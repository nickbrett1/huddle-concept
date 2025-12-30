<script>
	import Section from './Section.svelte';
	let { id = "opportunity" } = $props();
</script>

<Section {id}>
	<div class="content-wrapper">
		<h2 class="section-title">THE OPPORTUNITY</h2>
		<p class="stat">90M+</p>
		<p class="desc">Casual fans waiting for a better way to watch.</p>
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
		opacity: 0.5;
	}

	.stat {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(6rem, 15vw, 12rem);
		font-weight: 700;
		color: #00afea;
		line-height: 1;
		margin: 0;
	}

	.desc {
		font-size: 1.5rem;
		margin-top: 1rem;
		opacity: 0.8;
	}
</style>
