<script>
	import Hero from '$lib/components/Hero.svelte';
</script>

<Hero />

<style :global>
	@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap'); /* Closest free Google Font to Impact */

	:global(body) {
		margin: 0;
		padding: 0;
		background-color: #0f1115;
		color: white;
		font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
	}

	:global(h1, h2, h3, h4, h5, h6) {
		font-family: 'Oswald', 'Impact', sans-serif;
		text-transform: uppercase;
	}
</style>
