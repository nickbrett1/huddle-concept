<script>
	import Section from './Section.svelte';
	let { id = "engine" } = $props();
</script>

<Section {id}>
	<div class="content-wrapper">
		<h2 class="section-title">THE ENGINE</h2>
		<div class="grid">
			<div class="card">
				<h3>Ingest</h3>
				<p>Real-time data feeds</p>
			</div>
			<div class="card">
				<h3>Process</h3>
				<p>AI Narrative Generation</p>
			</div>
			<div class="card">
				<h3>Deliver</h3>
				<p>Personalized Stories</p>
			</div>
		</div>
	</div>
</Section>

<style>
	.content-wrapper {
		text-align: center;
		color: white;
		width: 100%;
	}

	.section-title {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(3rem, 6vw, 5rem);
		font-weight: 700;
		text-transform: uppercase;
		margin-bottom: 3rem;
	}

	.grid {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
		gap: 2rem;
		width: 100%;
	}

	.card {
		background: rgba(255, 255, 255, 0.03);
		border: 1px solid rgba(255, 255, 255, 0.1);
		padding: 2rem;
		text-align: left;
		transition: transform 0.3s ease;
	}

	.card:hover {
		transform: translateY(-5px);
		border-color: #00afea;
	}

	h3 {
		font-family: 'Oswald', sans-serif;
		font-size: 1.5rem;
		margin: 0 0 0.5rem 0;
		color: #00afea;
		text-transform: uppercase;
	}

	p {
		margin: 0;
		opacity: 0.7;
	}
</style>
