<script>
	import Section from './Section.svelte';
	import { onMount } from 'svelte';

	let { id = "hero" } = $props();

	let transformed = $state(false);

	onMount(() => {
		const interval = setInterval(() => {
			transformed = !transformed;
		}, 3000);
		return () => clearInterval(interval);
	});
</script>

<Section {id}>
	<div class="hero-content">
		<h1 class="brand-title">THE HUDDLE</h1>

		<p class="tagline">DECODING THE GAME INTO THE STORIES YOU'LL LOVE.</p>

		<div class="transformation-display">
			<span class="intro">WE TRANSFORM</span>
			<div class="animation-row">
				<div class="line">
					<div class="swap-container">
						<span class="word from" class:active={!transformed}>JARGON</span>
						<span class="word to" class:active={transformed}>DRAMA</span>
					</div>
				</div>
				<span class="connector">&</span>
				<div class="line">
					<div class="swap-container">
						<span class="word from" class:active={!transformed}>STATS</span>
						<span class="word to" class:active={transformed}>STORIES</span>
					</div>
				</div>
			</div>
		</div>

		<p class="sub-headline">Bringing the "Drive to Survive" effect to every American sport.</p>

		<div class="scroll-hint">
			Scroll to Explore
		</div>
	</div>
</Section>

<style>
	.hero-content {
		height: 100%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		position: relative;
		width: 100%;
		text-align: center;
	}

	.brand-title {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(3rem, 8vw, 6rem);
		font-weight: 700;
		text-transform: uppercase;
		margin: 0 0 0.5rem 0;
		letter-spacing: 0.05em;
		line-height: 1;
	}

	.tagline {
		font-size: clamp(1rem, 2vw, 1.5rem);
		font-weight: 400;
		color: rgba(255, 255, 255, 0.9);
		margin: 0 0 3rem 0;
		text-transform: uppercase;
		letter-spacing: 0.1em;
	}

	.transformation-display {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 0.5rem;
		margin-bottom: 3rem;
	}

	.intro {
		font-size: 0.8rem;
		letter-spacing: 0.2em;
		color: rgba(255, 255, 255, 0.6);
	}

	.animation-row {
		display: flex;
		align-items: center;
		gap: 0.5rem;
		font-family: 'Oswald', sans-serif;
		font-size: clamp(2rem, 5vw, 4rem);
		font-weight: 700;
		text-transform: uppercase;
		line-height: 1;
	}

	.sub-headline {
		font-size: clamp(0.9rem, 1.5vw, 1.2rem);
		color: #00afea;
		margin: 0;
		letter-spacing: 0.05em;
		font-weight: 500;
	}

	.connector {
		font-size: 0.5em;
		color: rgba(255, 255, 255, 0.5);
	}

	.line {
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.swap-container {
		display: grid;
		place-items: center;
		position: relative;
		width: 3ch; /* Approximate width to prevent layout shift */
	}

	/* Adjust width for longer words if needed, or let them flow */
	.swap-container:first-child { width: 6ch; } /* JARGON/DRAMA */
	.swap-container:last-child { width: 7ch; } /* STATS/STORIES */


	.word {
		grid-area: 1 / 1;
		transition: all 0.8s cubic-bezier(0.16, 1, 0.3, 1);
		white-space: nowrap;
	}

	.word.from {
		opacity: 0;
		transform: translateY(-50%) scale(0.9);
		filter: blur(10px);
	}

	.word.from.active {
		opacity: 0.5;
		transform: translateY(0) scale(1);
		filter: blur(0);
		color: rgba(255, 255, 255, 0.5);
	}

	.word.to {
		opacity: 0;
		transform: translateY(50%) scale(1.1);
		filter: blur(10px);
		color: #00afea; /* Electric Blue */
	}

	.word.to.active {
		opacity: 1;
		transform: translateY(0) scale(1);
		filter: blur(0);
	}

	.scroll-hint {
		margin-top: 4rem;
		color: rgba(255, 255, 255, 0.3);
		font-family: 'Oswald', sans-serif;
		font-size: 0.9rem;
		text-transform: uppercase;
		letter-spacing: 3px;
		user-select: none;
	}

	/* Refine width overrides for specific words to center better */
	.line:first-of-type .swap-container { min-width: 3.5em; }
	.line:last-of-type .swap-container { min-width: 4em; }

</style>
