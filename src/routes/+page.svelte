<script>
	import Section from '$lib/components/Section.svelte';
	import { onMount } from 'svelte';

	let sections = [
		{
			title: 'THE GAME PLAN',
			content: 'Every great victory starts with a solid strategy. We analyze the field, understand the players, and execute with precision.'
		},
		{
			title: 'UNMATCHED SPEED',
			content: 'In this league, hesitation is defeat. Our platform delivers real-time data with zero latency, keeping you ahead of the competition.'
		},
		{
			title: 'TEAM SYNERGY',
			content: 'Seamless integration across all devices. Your team stays connected, sharing insights and plays instantly, anywhere, anytime.'
		},
		{
			title: 'VICTORY LAP',
			content: 'Celebrate your wins with comprehensive analytics. Measure your success and refine your tactics for the next season.'
		}
	];

    let activeIndex = $state(0);
    let container;

    function scrollToSection(index) {
        if (index >= 0 && index < sections.length) {
            const sectionElement = container.children[index];
            sectionElement.scrollIntoView({ behavior: 'smooth' });
        }
    }

    function handleScroll() {
        if (!container) return;

        // Simple scroll detection to find which section is most visible
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
	{#each sections as section, i}
		<Section
            title={section.title}
            content={section.content}
            index={i}
            visible={i === activeIndex}
        />
	{/each}
</div>

{#if activeIndex < sections.length - 1}
    <button class="down-arrow" onclick={nextSection} aria-label="Next Section">
        ↓
    </button>
{/if}

<style>
	.scroll-container {
		height: 100vh;
		overflow-y: scroll;
		scroll-snap-type: y mandatory;
        /* Hide scrollbar for cleaner look */
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
