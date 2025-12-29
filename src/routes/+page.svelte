<script>
	import Section from '$lib/components/Section.svelte';
    import JargonDecoder from '$lib/components/JargonDecoder.svelte';

    let activeIndex = $state(0);
    let container;
    const TOTAL_SECTIONS = 7;

    function scrollToSection(index) {
        if (index >= 0 && index < TOTAL_SECTIONS && container) {
            const sectionElement = container.children[index];
            sectionElement.scrollIntoView({ behavior: 'smooth' });
        }
    }

    function handleScroll() {
        if (!container) return;

        // Dynamic detection of active section based on which one is closest to the top of the viewport
        const children = Array.from(container.children);
        let closestIndex = activeIndex;
        let minDistance = Infinity;

        children.forEach((child, index) => {
            const rect = child.getBoundingClientRect();
            // Distance from the top of the viewport (container)
            const distance = Math.abs(rect.top);

            if (distance < minDistance) {
                minDistance = distance;
                closestIndex = index;
            }
        });

        if (closestIndex !== activeIndex) {
            activeIndex = closestIndex;
        }
    }

    function nextSection() {
        scrollToSection(activeIndex + 1);
    }
</script>

<div
    class="scroll-container"
    bind:this={container}
    onscroll={handleScroll}
>
    <!-- Section 1: The Hero -->
    <Section visible={activeIndex === 0}>
        <div class="hero-content">
            <h1 class="main-title">THE HUDDLE</h1>
            <h2 class="subtitle">Decoding the game into the stories you'll love.</h2>
            <p class="pitch">
                Bringing the "Drive to Survive" effect to every American sport.
                An AI-powered personal companion that translates jargon into drama and stats into stories.
            </p>
            <div class="mockup-placeholder">
                <div class="split left">LIVE GAME STREAM</div>
                <div class="split right">AI COMPANION CHAT</div>
            </div>
            <p class="cta-hint">Scroll to Explore the Concept</p>
        </div>
    </Section>

    <!-- Section 2: The Problem -->
    <Section visible={activeIndex === 1}>
        <h2>THE PROBLEM</h2>
        <p class="stat">"88% of us watch with a second screen, but we've never felt more alone."</p>
        <div class="grid-2">
            <div class="card">
                <h3>1. THE JARGON WALL</h3>
                <p>Terms like "Safety," "Nickel Defense," and "RBI" act as gatekeepers.</p>
            </div>
            <div class="card">
                <h3>2. THE CONTEXT GAP</h3>
                <p>If you didn't grow up with the sport, you miss the 20-year rivalries and human drama that make the game "sticky."</p>
            </div>
        </div>
        <p class="highlight">"Traditional broadcasts are built for the expert. We built something for the fan."</p>
    </Section>

    <!-- Section 3: The Interactive Demo -->
    <Section visible={activeIndex === 2}>
        <h2>THE EXPERIENCE</h2>
        <p>See how The Huddle translates technical plays into emotional narratives in real-time.</p>
        <JargonDecoder />
    </Section>

    <!-- Section 4: The Engine -->
    <Section visible={activeIndex === 3}>
        <h2>THE ENGINE</h2>
        <div class="tech-stack">
            <div class="tech-item">
                <h3>INGESTION</h3>
                <p>Real-time data feeds (Sportradar/WebSocket) for sub-second updates.</p>
            </div>
            <div class="arrow">↓</div>
            <div class="tech-item">
                <h3>DRAMA METER</h3>
                <p>Calculates tension using "Win Probability" swings and historical context.</p>
            </div>
            <div class="arrow">↓</div>
            <div class="tech-item">
                <h3>ADAPTATION AGENT</h3>
                <p>User Profile Vector adjusts analogies based on your background (e.g., explaining NFL to a UK expat).</p>
            </div>
        </div>
        <p class="tech-note">Built with Server-Sent Events (SSE) for low-latency, battery-efficient streaming.</p>
    </Section>

    <!-- Section 5: The Opportunity -->
    <Section visible={activeIndex === 4}>
        <h2>THE OPPORTUNITY</h2>
        <ul class="opportunity-list">
            <li>
                <strong>RECLAIMING ATTENTION</strong>
                <span>Keeping the "Second Screen" inside the ecosystem.</span>
            </li>
            <li>
                <strong>CLOSING THE LOOP</strong>
                <span>Shoppable TV. When the app knows you're watching a Nike ad or a specific player, it serves a one-tap purchase link.</span>
            </li>
            <li>
                <strong>DEMOGRAPHIC BRIDGE</strong>
                <span>Onboarding the "unreachable" Gen Z and international audiences.</span>
            </li>
        </ul>
    </Section>

    <!-- Section 6: The Author -->
    <Section visible={activeIndex === 5}>
        <h2>THE AUTHOR</h2>
        <div class="profile">
            <h3>NICK — SOFTWARE ENGINEER</h3>
            <p>"I moved from the UK to New York and realized I was missing out on the biggest cultural conversations in the US. I built this concept to solve my own problem using the same low-latency engineering I use in Finance."</p>
            <a href="https://www.google.com/search?q=fintechnick.com" target="_blank" class="profile-link">Back to fintechnick.com</a>
        </div>
    </Section>

    <!-- Section 7: The Footer -->
    <Section visible={activeIndex === 6}>
        <h2>LET'S EVOLVE THE BROADCAST TOGETHER.</h2>
        <div class="contact-form">
            <input type="email" placeholder="Drop your email for a prototype demo" />
            <button>JOIN THE WAITLIST</button>
        </div>
        <div class="socials">
            <a href="#">LinkedIn</a>
            <span class="separator">|</span>
            <a href="#">GitHub</a>
        </div>
    </Section>
</div>

{#if activeIndex < TOTAL_SECTIONS - 1}
    <button class="down-arrow" onclick={nextSection} aria-label="Next Section">
        ↓
    </button>
{/if}

<style>
	.scroll-container {
		height: 100vh;
		overflow-y: scroll;
		scroll-snap-type: y mandatory;
        scrollbar-width: none;
        -ms-overflow-style: none;
	}

    .scroll-container::-webkit-scrollbar {
        display: none;
    }

    .down-arrow {
        position: fixed;
        bottom: 2rem;
        left: 50%;
        transform: translateX(-50%);
        background: transparent;
        border: 2px solid var(--accent-color);
        color: var(--accent-color);
        border-radius: 50%;
        width: 3rem;
        height: 3rem;
        font-size: 1.5rem;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
        z-index: 100;
        animation: bounce 2s infinite;
        font-family: var(--font-heading);
        cursor: pointer;
    }

    .down-arrow:hover {
        background: var(--accent-color);
        color: var(--bg-color);
    }

    @keyframes bounce {
        0%, 20%, 50%, 80%, 100% {
            transform: translateX(-50%) translateY(0);
        }
        40% {
            transform: translateX(-50%) translateY(-10px);
        }
        60% {
            transform: translateX(-50%) translateY(-5px);
        }
    }

    /* Section Specific Styles */
    .main-title {
        font-size: 6rem;
        line-height: 0.9;
        margin-bottom: 1rem;
        background: linear-gradient(45deg, #fff, var(--accent-color));
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .subtitle {
        font-size: 1.5rem;
        font-family: var(--font-body);
        font-weight: 300;
        margin-bottom: 2rem;
        color: #888;
        text-transform: none;
    }

    .pitch {
        font-size: 1.25rem;
        max-width: 600px;
        margin: 0 auto 3rem;
    }

    .mockup-placeholder {
        width: 100%;
        height: 300px;
        background: #000;
        border: 1px solid #333;
        display: flex;
        margin-bottom: 2rem;
        border-radius: 12px;
        overflow: hidden;
    }

    .split {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: var(--font-heading);
        color: #444;
        font-size: 1.5rem;
    }

    .split.left { border-right: 1px solid #333; }

    .cta-hint {
        font-size: 0.9rem;
        color: var(--accent-color);
        opacity: 0.7;
    }

    .stat {
        font-size: 2rem;
        font-style: italic;
        margin-bottom: 3rem;
        color: #fff;
    }

    .grid-2 {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 2rem;
        margin-bottom: 3rem;
        text-align: left;
    }

    .card {
        background: var(--secondary-bg);
        padding: 2rem;
        border-radius: 8px;
        border-top: 3px solid var(--accent-color);
    }

    .card h3 {
        margin-bottom: 1rem;
        color: var(--accent-color);
    }

    .tech-stack {
        display: flex;
        flex-direction: column;
        gap: 1rem;
        align-items: center;
        margin: 3rem 0;
    }

    .tech-item {
        background: var(--secondary-bg);
        padding: 1.5rem;
        border-radius: 8px;
        width: 100%;
        max-width: 500px;
    }

    .tech-item h3 { color: var(--accent-color); font-size: 1.2rem; margin-bottom: 0.5rem; }
    .tech-item p { font-size: 1rem; margin: 0; }

    .tech-note { font-size: 0.9rem; color: #666; font-style: italic; }

    .opportunity-list {
        list-style: none;
        padding: 0;
        text-align: left;
        max-width: 600px;
        margin: 0 auto;
    }

    .opportunity-list li {
        margin-bottom: 2rem;
        padding-left: 2rem;
        border-left: 2px solid var(--accent-color);
    }

    .opportunity-list strong {
        display: block;
        font-family: var(--font-heading);
        font-size: 1.5rem;
        margin-bottom: 0.5rem;
        color: #fff;
    }

    .profile {
        max-width: 600px;
        margin: 0 auto;
    }

    .profile-link {
        display: inline-block;
        margin-top: 2rem;
        font-size: 1.2rem;
    }

    .contact-form {
        display: flex;
        gap: 1rem;
        justify-content: center;
        margin: 3rem 0;
    }

    input {
        padding: 1rem;
        border-radius: 4px;
        border: 1px solid #444;
        background: var(--secondary-bg);
        color: #fff;
        width: 300px;
    }

    .socials {
        display: flex;
        gap: 1rem;
        justify-content: center;
        font-family: var(--font-heading);
        font-size: 1.2rem;
    }

    .separator { color: #444; }

    /* Mobile Enhancements */
    @media (max-width: 768px) {
        .main-title { font-size: 3.5rem; }
        .grid-2 { grid-template-columns: 1fr; }
        .contact-form { flex-direction: column; align-items: center; }
        input { width: 100%; max-width: 300px; }
        .mockup-placeholder { height: 200px; }
        .split { font-size: 1rem; }
    }
</style>
