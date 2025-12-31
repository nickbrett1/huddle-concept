<script>
	import Section from './Section.svelte';
	let { id = "engine" } = $props();
</script>

<Section {id}>
	<div class="content-wrapper">
		<div class="header-group">
			<h2 class="section-title">THE ENGINE</h2>
			<h3 class="subtitle">TECHNICAL DEEP DIVE</h3>
		</div>

		<!-- Simplified Architecture Diagram -->
		<div class="diagram-container">
			<div class="node source">
				<div class="icon">
					<!-- Satellite Dish SVG -->
					<svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#00afea" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						<path d="M12 2a10 10 0 1 0 10 10"></path>
						<path d="M12 12 2 2"></path>
						<path d="m9 15 3-3"></path>
						<circle cx="12" cy="12" r="2"></circle>
					</svg>
				</div>
				<div class="label">Live Data</div>
			</div>
			<div class="arrow">→</div>
			<div class="node system">
				<div class="node-title">Ingestion</div>
				<div class="node-desc">Normalize</div>
			</div>
			<div class="arrow">→</div>
			<div class="node system highlight">
				<div class="node-title">Drama Meter</div>
				<div class="node-desc">Calc Tension</div>
			</div>
			<div class="arrow">→</div>
			<div class="node system">
				<div class="node-title">Adaptation Agent</div>
				<div class="node-desc">Personalize</div>
			</div>
			<div class="arrow">→</div>
			<div class="node client">
				<div class="icon">
					<!-- Mobile Phone SVG -->
					<svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#00afea" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						<rect x="5" y="2" width="14" height="20" rx="2" ry="2"></rect>
						<path d="M12 18h.01"></path>
					</svg>
				</div>
				<div class="label">Client App</div>
			</div>
		</div>

		<div class="details-grid">
			<div class="card">
				<h4>The Ingestion</h4>
				<p>Real-time data feeds via Sportradar & WebSockets ensure every play is captured instantly.</p>
			</div>
			<div class="card">
				<h4>The Drama Meter</h4>
				<p>Calculates tension dynamically by tracking "Win Probability" swings and momentum shifts.</p>
			</div>
			<div class="card">
				<h4>The Adaptation Agent</h4>
				<p>Uses a User Profile Vector to adjust content (e.g., explaining NFL terms using Cricket analogies for a UK expat).</p>
			</div>
		</div>

		<div class="dev-note">
			<strong>Developer Note:</strong> Utilizing Server-Sent Events (SSE) ensures low-latency, battery-efficient streaming for real-time updates.
		</div>
	</div>
</Section>

<style>
	.content-wrapper {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		height: 100%;
		width: 100%;
		max-width: 1200px;
		margin: 0 auto;
		color: white;
		gap: 2rem; /* Reduced gap to fit everything */
	}

	.header-group {
		text-align: center;
	}

	.section-title {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(3rem, 5vw, 4.5rem);
		font-weight: 700;
		text-transform: uppercase;
		margin: 0;
		line-height: 1;
	}

	.subtitle {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(1rem, 2vw, 1.5rem);
		font-weight: 400;
		letter-spacing: 0.2em;
		color: rgba(255, 255, 255, 0.7);
		margin: 0.5rem 0 0 0;
		text-transform: uppercase;
	}

	/* Diagram Styles */
	.diagram-container {
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 1rem;
		width: 100%;
		padding: 1rem;
		flex-wrap: nowrap; /* Keep on one line for desktop */
	}

	.node {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		background: rgba(255, 255, 255, 0.05);
		border: 1px solid rgba(255, 255, 255, 0.2);
		padding: 1rem;
		border-radius: 8px;
		min-width: 100px;
		text-align: center;
		transition: all 0.3s ease;
	}

	.node:hover {
		border-color: #00afea;
		box-shadow: 0 0 15px rgba(0, 175, 234, 0.3);
	}

	.node.source, .node.client {
		background: transparent;
		border: none;
	}

	.node.highlight {
		border-color: #00afea;
		background: rgba(0, 175, 234, 0.1);
	}

	.node-title {
		font-family: 'Oswald', sans-serif;
		font-size: 1rem;
		font-weight: 500;
		text-transform: uppercase;
		color: #00afea;
	}

	.node-desc {
		font-size: 0.8rem;
		opacity: 0.7;
	}

	.icon {
		display: flex;
		justify-content: center;
		margin-bottom: 0.5rem;
	}

	.arrow {
		font-size: 1.5rem;
		color: rgba(255, 255, 255, 0.3);
		font-weight: bold;
	}

	/* Details Grid */
	.details-grid {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		gap: 1.5rem;
		width: 100%;
	}

	.card {
		background: rgba(15, 17, 21, 0.6);
		border-left: 3px solid #00afea;
		padding: 1.5rem;
		backdrop-filter: blur(5px);
	}

	.card h4 {
		font-family: 'Oswald', sans-serif;
		color: #00afea;
		font-size: 1.25rem;
		margin: 0 0 0.5rem 0;
		text-transform: uppercase;
	}

	.card p {
		margin: 0;
		font-size: 0.95rem;
		line-height: 1.5;
		color: rgba(255, 255, 255, 0.8);
	}

	/* Developer Note */
	.dev-note {
		font-size: 0.9rem;
		color: rgba(255, 255, 255, 0.6);
		border-top: 1px solid rgba(255, 255, 255, 0.1);
		padding-top: 1rem;
		margin-top: 0;
		width: 100%;
		text-align: center;
	}

	.dev-note strong {
		color: #00afea;
		font-weight: normal; /* Oswald is already bold-ish */
		font-family: 'Oswald', sans-serif;
		text-transform: uppercase;
	}

	/* Mobile Responsiveness */
	@media (max-width: 900px) {
		.diagram-container {
			flex-direction: column;
			gap: 0.5rem;
		}

		.arrow {
			transform: rotate(90deg); /* Point down */
			font-size: 1.2rem;
			margin: -0.5rem 0;
		}

		.node {
			width: 100%;
			max-width: 300px;
			flex-direction: row;
			justify-content: space-between;
			padding: 0.75rem 1rem;
		}

		.node.source, .node.client {
			justify-content: center;
			gap: 1rem;
		}

		.node-desc {
			text-align: right;
		}

		.details-grid {
			grid-template-columns: 1fr;
			gap: 1rem;
		}

		.card {
			padding: 1rem;
		}

		.section-title {
			font-size: 3rem;
		}
	}
</style>
