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

<Section {id} bottomPadding="2rem">
	<div class="hero-content">
		<div class="spacer top"></div>
		<div class="center-content">
			<h1 class="brand-title">THE HUDDLE</h1>

			<p class="tagline">DECODING THE GAME INTO THE STORIES YOU'LL LOVE.</p>

			<div class="transformation-display">
				<span class="intro">WE TRANSFORM</span>

				<div class="display-stack">
					<div class="old-way">
						<span>JARGON</span>
						<span class="connector">&</span>
						<span>STATS</span>
					</div>

					<div class="arrow-container">
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="arrow-icon">
							<line x1="12" y1="5" x2="12" y2="19"></line>
							<polyline points="19 12 12 19 5 12"></polyline>
						</svg>
					</div>

					<div class="new-way" class:highlight={transformed}>
						<div class="new-way-line">
							<span>DRAMA</span>
							<span class="connector">&</span>
							<span>STORIES</span>
						</div>
						<div class="new-way-line">FOR YOU</div>
					</div>
				</div>
			</div>

			<p class="sub-headline">Bringing a personalised "Drive to Survive" effect to every American sport.</p>
		</div>
		<div class="spacer bottom"></div>

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
		align-items: center;
		position: relative;
		width: 100%;
		text-align: center;
	}

	.spacer {
		min-height: 2rem;
	}

	.spacer.top {
		flex: 1;
	}

	.spacer.bottom {
		flex: 2;
		min-height: 4rem; /* Force visible gap */
	}

	.center-content {
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 100%;
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
		gap: 1rem;
		margin-bottom: 3rem;
	}

	.intro {
		font-size: 0.8rem;
		letter-spacing: 0.2em;
		color: rgba(255, 255, 255, 0.6);
		margin-bottom: 0.5rem;
	}

	.display-stack {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 0.5rem;
	}

	.old-way, .new-way {
		display: flex;
		align-items: center;
		gap: 0.5rem;
		font-family: 'Oswald', sans-serif;
		font-size: clamp(1.5rem, 4vw, 3rem);
		font-weight: 700;
		text-transform: uppercase;
		line-height: 1;
		transition: all 0.5s ease;
	}

	.old-way {
		color: rgba(255, 255, 255, 0.4);
		filter: blur(0.5px);
	}

	.new-way {
		color: #00afea; /* Electric Blue */
		opacity: 0.8;
		transform: scale(0.98);
		flex-direction: column;
		gap: 0;
	}

	.new-way-line {
		display: flex;
		align-items: center;
		gap: 0.5rem;
	}

	.new-way.highlight {
		opacity: 1;
		transform: scale(1.05);
		text-shadow: 0 0 10px rgba(0, 175, 234, 0.5);
	}

	.connector {
		font-size: 0.6em;
		opacity: 0.7;
	}

	.arrow-container {
		color: rgba(255, 255, 255, 0.3);
		animation: bounce 2s infinite;
	}

	@keyframes bounce {
		0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
		40% {transform: translateY(-5px);}
		60% {transform: translateY(-3px);}
	}

	.sub-headline {
		font-size: clamp(0.9rem, 1.5vw, 1.2rem);
		color: #00afea;
		margin: 0;
		letter-spacing: 0.05em;
		font-weight: 500;
		margin-top: 1rem;
	}

	.scroll-hint {
		margin-bottom: 2rem;
		color: rgba(255, 255, 255, 0.3);
		font-family: 'Oswald', sans-serif;
		font-size: 0.9rem;
		text-transform: uppercase;
		letter-spacing: 3px;
		user-select: none;
	}
</style>
