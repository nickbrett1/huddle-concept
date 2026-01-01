<script>
	import Header from '$lib/components/Header.svelte';
	import Hero from '$lib/components/Hero.svelte';
	import Problem from '$lib/components/Problem.svelte';
	import Demo from '$lib/components/Demo.svelte';
	import Engine from '$lib/components/Engine.svelte';
	import Opportunity from '$lib/components/Opportunity.svelte';
	import Footer from '$lib/components/Footer.svelte';
	import { onMount } from 'svelte';

	const sections = [
		{ id: 'hero', label: 'Home' },
		{ id: 'problem', label: 'Problem' },
		{ id: 'demo', label: 'Demo' },
		{ id: 'engine', label: 'Engine' },
		{ id: 'opportunity', label: 'Opportunity' },
		{ id: 'footer', label: 'About' }
	];

	let activeIndex = $state(0);
	let container = $state(null);

	function scrollToSection(index) {
		if (index < 0 || index >= sections.length) return;
		const sectionId = sections[index].id;
		const el = document.getElementById(sectionId);
		if (el) {
			el.scrollIntoView({ behavior: 'smooth', block: 'start', inline: 'start' });
		}
	}

	function handleKeydown(event) {
		if (event.key === 'ArrowRight') {
			scrollToSection(activeIndex + 1);
		} else if (event.key === 'ArrowLeft') {
			scrollToSection(activeIndex - 1);
		}
	}

	onMount(() => {
		const observer = new IntersectionObserver(
			(entries) => {
				entries.forEach((entry) => {
					if (entry.isIntersecting) {
						const index = sections.findIndex(s => s.id === entry.target.id);
						if (index !== -1) {
							activeIndex = index;
						}
					}
				});
			},
			{
				root: container,
				threshold: 0.5 // Trigger when 50% of the section is visible
			}
		);

		sections.forEach(section => {
			const el = document.getElementById(section.id);
			if (el) observer.observe(el);
		});

		window.addEventListener('keydown', handleKeydown);

		return () => {
			observer.disconnect();
			window.removeEventListener('keydown', handleKeydown);
		};
	});
</script>

<Header />

<div class="app-container" bind:this={container}>
	<Hero id="hero" />
	<Problem id="problem" />
	<Demo id="demo" />
	<Engine id="engine" />
	<Opportunity id="opportunity" />
	<Footer id="footer" />
</div>

<!-- Navigation Controls -->
<nav class="navigation-dots">
	{#each sections as section, i}
		<button
			class="dot"
			class:active={i === activeIndex}
			onclick={() => scrollToSection(i)}
			aria-label={`Go to ${section.label}`}
			title={section.label}
		></button>
	{/each}
</nav>

<!-- Desktop Arrows -->
<div class="nav-arrows">
	<button
		class="arrow left"
		onclick={() => scrollToSection(activeIndex - 1)}
		disabled={activeIndex === 0}
		aria-label="Previous Section"
	>
		<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			<polyline points="15 18 9 12 15 6"></polyline>
		</svg>
	</button>
	<button
		class="arrow right"
		onclick={() => scrollToSection(activeIndex + 1)}
		disabled={activeIndex === sections.length - 1}
		aria-label="Next Section"
	>
		<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			<polyline points="9 18 15 12 9 6"></polyline>
		</svg>
	</button>
</div>

<style>
	:global(body) {
		margin: 0;
		padding: 0;
		background-color: #0f1115;
		color: white;
		font-family: 'Montserrat', sans-serif;
		overflow: hidden; /* Prevent body scroll, let app-container handle it */
	}

	:global(h1), :global(h2), :global(h3), :global(h4), :global(h5), :global(h6) {
		font-family: 'Oswald', 'Impact', sans-serif;
	}

	.app-container {
		width: 100vw;
		height: 100vh;
		display: flex;
		flex-direction: row;
		overflow-x: auto;
		overflow-y: hidden;
		scroll-snap-type: x mandatory;
		scroll-behavior: smooth;
	}

	.navigation-dots {
		position: fixed;
		bottom: 2rem;
		left: 50%;
		transform: translateX(-50%);
		display: flex;
		gap: 1rem;
		z-index: 1001; /* Above header if needed, definitely above content */
		background: rgba(15, 17, 21, 0.5); /* Semi-transparent background */
		padding: 0.5rem 1rem;
		border-radius: 2rem;
		backdrop-filter: blur(4px);
	}

	.dot {
		width: 12px;
		height: 12px;
		border-radius: 50%;
		background-color: rgba(255, 255, 255, 0.3);
		border: none;
		cursor: pointer;
		padding: 0;
		transition: all 0.3s ease;
	}

	.dot:hover {
		background-color: rgba(255, 255, 255, 0.6);
		transform: scale(1.2);
	}

	.dot.active {
		background-color: #00afea;
		transform: scale(1.2);
		box-shadow: 0 0 8px rgba(0, 175, 234, 0.6);
	}

	.nav-arrows {
		position: fixed;
		top: 50%;
		left: 0;
		width: 100%;
		transform: translateY(-50%);
		display: flex;
		justify-content: space-between;
		padding: 0 1rem;
		pointer-events: none; /* Let clicks pass through container */
		z-index: 1000;
		box-sizing: border-box;
	}

	.arrow {
		background: rgba(15, 17, 21, 0.8);
		border: 2px solid rgba(255, 255, 255, 0.5);
		color: white;
		border-radius: 50%;
		width: 56px;
		height: 56px;
		display: flex;
		align-items: center;
		justify-content: center;
		cursor: pointer;
		pointer-events: auto; /* Re-enable pointer events for buttons */
		transition: all 0.3s ease;
		backdrop-filter: blur(4px);
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
	}

	.arrow:hover:not(:disabled) {
		background: rgba(0, 175, 234, 0.3);
		border-color: #00afea;
		transform: scale(1.1);
		box-shadow: 0 0 15px rgba(0, 175, 234, 0.4);
	}

	.arrow:disabled {
		opacity: 0;
		pointer-events: none;
	}

	@media (max-width: 768px) {
		/* Hide arrows on mobile since swiping is primary */
		.nav-arrows {
			display: none;
		}
	}
</style>