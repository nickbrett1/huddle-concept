# The Huddle - Personalized Sports Broadcasting Concept

"The Huddle" is a product concept for a sports broadcasting overlay engine designed to bridge the gap between technical gameplay and casual fan engagement. By leveraging real-time data and personalized storytelling, it aims to bring a "Drive to Survive" narrative effect to live American sports.

## 🚀 Project Overview

This repository contains the source code for the "Huddle Concept" website, a SvelteKit application that demonstrates the capabilities of the proposed engine. The site features a horizontal scrolling narrative, an interactive demo, and a technical architectural breakdown.

### Key Features

*   **Interactive Demo**: A "Live Huddle" simulation that allows users to toggle between different viewer personas (The Expat, The Casual, The Strategist) and observe how the broadcast overlay adapts in real-time.
*   **The Engine**: An interactive "Technical Deep Dive" into the system architecture, visualizing the flow from the "Live Pulse" and "Knowledge Base" through the "Normalization Engine" to the "Client Layer."
*   **The Narrative**: A compelling pitch manifesto ("The Problem" & "The Opportunity") that addresses the "Jargon Wall" and the "Story Gap" in current sports broadcasting.
*   **Responsive Experience**: A highly polished UI featuring "Fox Sports" aesthetics (Dark Mode, Electric Blue accents, Oswald typography), optimized for both desktop (horizontal snap-scroll) and mobile (vertical swipe) interactions.

## 🛠️ Tech Stack

*   **Framework**: [SvelteKit](https://kit.svelte.dev/)
*   **Library**: [Svelte 5](https://svelte.dev/) (utilizing Runes for state management)
*   **Styling**: CSS (Scoped components, Responsive layouts)
*   **Fonts**: Montserrat (Body), Oswald (Headings/Display)
*   **Deployment**: [Cloudflare Pages](https://pages.cloudflare.com/) via [CircleCI](https://circleci.com/)
*   **Verification**: Playwright (E2E testing)

## 💻 Local Development

To run this project locally:

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd huddle-concept
    ```

2.  **Install dependencies:**
    ```bash
    npm install
    ```

3.  **Start the development server:**
    ```bash
    npm run dev
    ```

4.  **Open your browser:**
    Navigate to `http://localhost:5173` to view the application.

## 🏗️ Deployment

The project is configured for continuous deployment to Cloudflare Pages.
*   **Configuration**: `wrangler.jsonc` (generated from `wrangler.template.jsonc`)
*   **Pipeline**: CircleCI handles the build and deployment process.

## 📝 License

This project is a concept demonstration.
