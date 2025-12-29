<script>
	import Hero from '$lib/components/Hero.svelte';
</script>

<div class="app-container">
	<Hero />
</div>

<style>
	:global(body) {
		margin: 0;
		padding: 0;
		background-color: #0f1115;
		color: white;
		font-family: 'Oswald', 'Impact', sans-serif;
		overflow-x: hidden;
	}

	.app-container {
		width: 100%;
		height: 100vh;
		overflow-y: scroll;
		scroll-snap-type: y mandatory;
	}
</style>
