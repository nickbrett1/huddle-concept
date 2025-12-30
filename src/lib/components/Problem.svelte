<script>
	import Section from './Section.svelte';
</script>

<Section>
	<div class="content-wrapper">
		<h2 class="section-title">THE PROBLEM</h2>
		<p class="section-text">
			Sports are complicated. <br>
			<span class="highlight">The stories shouldn't be.</span>
		</p>
	</div>
</Section>

<style>
	.content-wrapper {
		text-align: center;
		color: white;
	}

	.section-title {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(3rem, 6vw, 5rem);
		font-weight: 700;
		text-transform: uppercase;
		margin-bottom: 1rem;
		color: white;
	}

	.section-text {
		font-size: clamp(1.2rem, 2vw, 1.5rem);
		font-weight: 300;
		line-height: 1.5;
		opacity: 0.8;
	}

	.highlight {
		color: #00afea;
		font-weight: 500;
	}
</style>
