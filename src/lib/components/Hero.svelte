<script>
	import Section from './Section.svelte';
	import { onMount } from 'svelte';

	let transformed = $state(false);

	onMount(() => {
		const interval = setInterval(() => {
			transformed = !transformed;
		}, 3000);
		return () => clearInterval(interval);
	});
</script>

<Section>
	<div class="hero-content">
		<h1 class="title">
			<span class="intro">WE TRANSFORM</span>
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
		</h1>

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
	}

	.title {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(4rem, 10vw, 8rem);
		font-weight: 700;
		text-transform: uppercase;
		color: white;
		display: flex;
		flex-direction: column;
		align-items: center;
		line-height: 1;
		gap: 0.2em;
	}

	.intro {
		font-size: 0.4em;
		letter-spacing: 0.1em;
		margin-bottom: 0.5em;
	}

	.connector {
		font-size: 0.3em;
		color: rgba(255, 255, 255, 0.5);
		margin: 0.5em 0;
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
	}

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
		position: absolute;
		bottom: 2rem;
		color: rgba(255, 255, 255, 0.3);
		font-family: 'Oswald', sans-serif;
		font-size: 0.9rem;
		text-transform: uppercase;
		letter-spacing: 3px;
		user-select: none;
	}
</style>
