<script>
	import Section from './Section.svelte';
</script>

<Section>
	<div class="content-wrapper">
		<h2 class="section-title">INTERACTIVE DEMO</h2>
		<div class="demo-placeholder">
			<div class="play-diagram">
				<!-- Abstract representation of a play -->
				<div class="x">X</div>
				<div class="o">O</div>
				<div class="arrow"></div>
			</div>
			<p class="caption">Live Play Feed vs. Huddle Story</p>
		</div>
	</div>
</Section>

<style>
	.content-wrapper {
		text-align: center;
		color: white;
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 2rem;
	}

	.section-title {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(3rem, 6vw, 5rem);
		font-weight: 700;
		text-transform: uppercase;
		color: white;
	}

	.demo-placeholder {
		width: 100%;
		max-width: 600px;
		aspect-ratio: 16/9;
		background: rgba(255, 255, 255, 0.05);
		border: 1px solid rgba(255, 255, 255, 0.1);
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		border-radius: 8px;
	}

	.play-diagram {
		display: flex;
		gap: 2rem;
		font-family: 'Oswald', sans-serif;
		font-size: 2rem;
		font-weight: 700;
		margin-bottom: 1rem;
	}

	.x { color: #00afea; }
	.o { color: white; }

	.caption {
		font-size: 0.9rem;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		opacity: 0.5;
	}
</style>
