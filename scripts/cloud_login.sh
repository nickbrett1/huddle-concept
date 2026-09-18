#!/bin/bash
set -e


# Doppler login/setup
if command -v doppler &> /dev/null; then
  if doppler whoami &> /dev/null; then
    echo "Already logged in to Doppler."
  else
    echo "INFO: Logging into Doppler..."
    doppler login --no-check-version --no-timeout --yes
    echo "INFO: Setting up Doppler..."
    doppler setup --no-interactive --project huddle-concept --config dev
  fi
else
  echo "Doppler CLI not found. Skipping Doppler login."
fi


echo
# Cloudflare Wrangler login
# Check if wrangler is installed
if ! command -v wrangler &> /dev/null; then
  echo "Wrangler CLI not found. Installing globally with npm..."
  npm install -g wrangler
fi

script -q -c "npx wrangler login --browser=false --callback-host=0.0.0.0 --callback-port=8976 | stdbuf -oL sed 's/0\\.0\\.0\\.0/localhost/g'" /dev/null




echo
# Setup Wrangler configuration with environment variables
echo "Setting up Wrangler configuration..."
doppler run --project huddle-concept --config dev -- ./scripts/setup-wrangler-config.sh dev

# Tailscale login. Joining the tailnet is what gives the agent a non-loopback
# card URL and what makes the container reachable by the LiteLLM proxy, which
# dials the card. --hostname sets the name it joins under, and that name is what
# the agent advertises, so it is the repo name.
if command -v tailscale &> /dev/null; then
  if ! pgrep -x tailscaled > /dev/null; then
    echo "INFO: Starting Tailscale daemon..."
    sudo start-stop-daemon --start --background --oknodo --pidfile /var/run/tailscaled.pid --make-pidfile --exec /usr/sbin/tailscaled -- --state=/var/lib/tailscale/tailscaled.state
    sleep 2
  fi
  if ! sudo tailscale status &> /dev/null; then
    echo "INFO: Logging into Tailscale..."
    sudo tailscale up --hostname=huddle-concept
  else
    echo "OK: Already logged in to Tailscale."
  fi
else
  echo "WARN: tailscale is not installed. Build the container first - post-create"
  echo "      installs it - then re-run this script."
fi

echo "Cloud login script finished."
