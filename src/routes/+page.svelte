<script>
	import Section from '$lib/components/Section.svelte';

    let count = $state(0);
	function increment() {
		count += 1;
	}

    let activeIndex = $state(0);
    let container;
    const TOTAL_SECTIONS = 3;

    function scrollToSection(index) {
        if (index >= 0 && index < TOTAL_SECTIONS) {
            const sectionElement = container.children[index];
            sectionElement.scrollIntoView({ behavior: 'smooth' });
        }
    }

    function handleScroll() {
        if (!container) return;

        const scrollPosition = container.scrollTop;
        const sectionHeight = container.clientHeight;
        const index = Math.round(scrollPosition / sectionHeight);

        if (index !== activeIndex) {
            activeIndex = index;
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
    <!-- Section 1: Welcome -->
    <Section visible={activeIndex === 0}>
        <h1>Welcome to SvelteKit</h1>
    </Section>

    <!-- Section 2: Documentation -->
    <Section visible={activeIndex === 1}>
        <p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
    </Section>

    <!-- Section 3: Interactive Counter -->
    <Section visible={activeIndex === 2}>
        <button onclick={increment}>
            Clicks: {count}
        </button>
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
</style>
