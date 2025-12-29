<script>
	import Hero from '$lib/components/Hero.svelte';
	import Section from '$lib/components/Section.svelte';
</script>

<div class="scroll-container">
	<!-- Hero Section -->
	<Section id="hero">
		<Hero />
	</Section>

	<!-- Problem Section -->
	<Section id="problem" title="The Problem">
		<div class="placeholder">
			<h3>The Game is Fast. Understanding it shouldn't be slow.</h3>
			<p>Fans feel left out when the jargon flies over their heads.</p>
		</div>
	</Section>

	<!-- Interactive Demo Section -->
	<Section id="demo" title="Interactive Demo">
		<div class="placeholder">
			<p>[Interactive Jargon Decoder Demo Placeholder]</p>
		</div>
	</Section>

	<!-- Engine Section -->
	<Section id="engine" title="The Engine">
		<div class="placeholder">
			<p>Powered by Advanced LLMs and Real-time Sports Data API.</p>
		</div>
	</Section>

	<!-- Opportunity Section -->
	<Section id="opportunity" title="The Opportunity">
		<div class="placeholder">
			<p>Connecting the next generation of fans to the game they love.</p>
		</div>
	</Section>

	<!-- Author Section -->
	<Section id="author" title="About the Team">
		<div class="placeholder">
			<p>Built by passionate sports engineers.</p>
		</div>
	</Section>

	<!-- Footer Section -->
	<footer class="footer">
		<p>&copy; 2024 Huddle Concept. All rights reserved.</p>
	</footer>
</div>

<style :global>
	@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&display=swap');

	:global(body) {
		margin: 0;
		padding: 0;
		background-color: #0f1115;
		color: white;
		font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
		overflow: hidden; /* Prevent body scroll, handle in container */
	}

	:global(h1, h2, h3, h4, h5, h6) {
		font-family: 'Oswald', 'Impact', sans-serif;
		text-transform: uppercase;
	}

	.scroll-container {
		height: 100vh;
		overflow-y: scroll;
		scroll-snap-type: y mandatory;
		scroll-behavior: smooth;
	}

	.placeholder {
		border: 1px dashed rgba(0, 175, 234, 0.3);
		padding: 4rem;
		text-align: center;
		border-radius: 8px;
		background: rgba(255, 255, 255, 0.02);
	}

    .placeholder h3 {
        color: #00afea;
        margin-bottom: 1rem;
    }

	.footer {
		padding: 2rem;
		text-align: center;
		color: rgba(255, 255, 255, 0.5);
		font-size: 0.8rem;
		scroll-snap-align: end;
	}
</style>
