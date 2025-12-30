<script>
	import Header from '$lib/components/Header.svelte';
	import Hero from '$lib/components/Hero.svelte';
	import Problem from '$lib/components/Problem.svelte';
	import Demo from '$lib/components/Demo.svelte';
	import Engine from '$lib/components/Engine.svelte';
	import Opportunity from '$lib/components/Opportunity.svelte';
	import Footer from '$lib/components/Footer.svelte';
</script>

<Header />

<div class="app-container">
	<Hero />
	<Problem />
	<Demo />
	<Engine />
	<Opportunity />
	<Footer />
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
		scroll-behavior: smooth; /* Smooth scrolling for anchor links */
	}
</style>
