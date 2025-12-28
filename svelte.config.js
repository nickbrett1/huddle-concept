import adapter from '@sveltejs/adapter-cloudflare';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		// adapter-cloudflare is configured for Wrangler deployment
		// See https://kit.svelte.dev/docs/adapter-cloudflare for more information.
		adapter: adapter()
	}
};

export default config;
