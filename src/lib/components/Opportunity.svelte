<script>
	import Section from './Section.svelte';
	let { id = "opportunity" } = $props();
</script>

<Section {id}>
	<div class="content-wrapper">
		<h2 class="section-title">THE OPPORTUNITY</h2>
		<p class="subtitle">CASUAL FANS WAITING FOR A BETTER WAY TO WATCH.</p>
		<p class="stat">90M+</p>
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
		margin-bottom: 0.5rem;
	}

	.subtitle {
		font-size: clamp(1rem, 2vw, 1.5rem);
		font-weight: 400;
		color: rgba(255, 255, 255, 0.9);
		margin: 0 0 3rem 0;
		text-transform: uppercase;
		letter-spacing: 0.1em;
	}

	.stat {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(6rem, 15vw, 12rem);
		font-weight: 700;
		color: #00afea;
		line-height: 1;
		margin: 0;
	}
</style>
