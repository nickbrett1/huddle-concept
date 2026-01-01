<script>
	import Section from './Section.svelte';
	import { fly } from 'svelte/transition';

	let { id = "engine" } = $props();
	let selectedItem = $state(null);

	const data = {
		sources: [
			{
				id: 'live_pulse',
				title: 'The Live Pulse',
				icon: 'M12 2a10 10 0 1 0 10 10 M12 12 2 2 M12 12L2 2',
                details: [
                    { label: 'Method', text: 'Low-latency ingestion via WebSockets.' },
                    { label: 'Source', text: 'Play-by-play statistics combined with live transcriptions of broadcast commentary.' },
                    { label: 'Purpose', text: 'Provides the immediate "What just happened?" updates. This is the heartbeat of the real-time experience.' }
                ]
			},
			{
				id: 'knowledge_base',
				title: 'The Knowledge Base',
				icon: 'M4 7v10c0 2.21 3.58 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.58 4 8 4s8-1.79 8-4M4 7c0-2.21 3.58-4 8-4s8 1.79 8 4m0 5c0 2.21-3.58 4-8 4s-8-1.79-8-4',
                details: [
                    { label: 'Source', text: 'Decades of historical statistics, player draft profiles, injury reports, and "lore" (e.g., historic rivalries and career milestones).' },
                    { label: 'Method', text: 'A specialized Knowledge Base used for Retrieval-Augmented Generation (RAG).' },
                    { label: 'Purpose', text: 'Provides the "Why does this matter?"—linking a current sack or touchdown to a player\'s season narrative or a team\'s 10-year drought.' }
                ]
			},
            {
                id: 'personas',
                title: 'The User Vector',
                icon: 'M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z',
                details: [
                    { label: 'Source', text: 'Persona selection (Expat, Casual, Strategist) and interaction history.' },
                    { label: 'Method', text: 'A dynamic User Profile Vector stored at the Edge.' },
                    { label: 'Purpose', text: 'Defines the "How should I explain this?" layer, ensuring analogies and technical depth are tailored to the individual\'s knowledge level.' }
                ]
            }
		],
		ingestion: {
			title: 'Ingestion',
			items: [
				{
					id: 'normalize',
					title: 'Normalization Engine',
					icon: 'M3 6l7 7v4h4v-4l7-7V4H3z',
					details: [
						{ label: 'Engine', text: 'Apache Flink creates a "Unified Event Stream," acting as a traffic controller to ensure all data speaks the same language via a Schema Registry.' },
						{ label: 'Syncing', text: 'Uses "Watermarks" to synchronize out-of-order streams (e.g., aligning faster stats feeds with slower audio commentary).' },
						{ label: 'Live Pulse', text: 'Flattens raw WebSockets and performs "Lookup Joins" against the Knowledge Base to create "Rich Play Events" (e.g., adding season stats to a live sack).' },
						{ label: 'Personalization', text: 'Applies the "User Vector" (e.g., {soccer_affinity: 0.9}) as a filter, ensuring the output is translated into the user\'s preferred terminology.' },
						{ label: 'Architecture', text: 'Replaces separate apps with one Unified Intelligence Layer, avoiding data silos and ensuring real-time accuracy.' }
					]
				}
			]
		},
		core: {
			title: 'The Intelligence Layer',
			items: [
				{
					id: 'drama',
					title: 'The Drama Meter',
					icon: 'M3 3v18h18 M18 9l-5 5-4-4-3 3',
                    details: [
                        { label: 'Function', text: 'The system monitors Win Probability (WP) swings in real-time. When a play results in a massive shift (e.g., a 15% swing on a single interception), the system flags it as a "High Drama" event.' },
                        { label: 'Goal', text: 'The AI Agent proactively interjects to explain the gravity of the shift, ensuring even a Casual fan understands the stakes.' }
                    ]
				},
				{
					id: 'adaptation',
					title: 'The Adaptation Agent',
					icon: 'M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z',
                    details: [
                        { label: 'Function', text: 'This layer acts as the bridge. It cross-references the "Live Pulse" with the "User Vector."' },
                        { label: 'Example (Expat)', text: 'If a "Safety" occurs, it pulls a "Soccer" analogy from the Knowledge Base.' },
                        { label: 'Example (Strategist)', text: 'It pulls the specific defensive formation (e.g., Nickel vs. Dime) that led to the play.' }
                    ]
				}
			]
		},
		delivery: {
			title: 'Client Layer',
			items: [
				{
					id: 'edge_delivery',
					title: 'Edge-First Delivery',
					icon: 'M17 2H7a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM12 18h.01',
                    details: [
                        { label: 'Server-Sent Events (SSE)', text: 'We use SSE for the data stream. Unlike traditional WebSockets, SSE is unidirectional and highly battery-efficient for mobile devices, allowing for a persistent "live commentary" feel without the overhead of a two-way connection.' },
                        { label: 'Low Latency', text: 'By processing the Persona Logic at the Edge (using tools like Cloudflare Workers), we ensure the AI’s insights stay perfectly synced with the low-latency broadcast.' }
                    ]
				}
			]
		}
	};

	function select(item) {
		selectedItem = selectedItem === item ? null : item;
	}
</script>

{#snippet animatedArrow()}
	<svg class="arrow-svg" viewBox="0 0 24 48" fill="none" xmlns="http://www.w3.org/2000/svg">
		<path d="M12 0V40" stroke="currentColor" stroke-width="2" class="animate-dash" />
		<path d="M6 34L12 40L18 34" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
	</svg>
{/snippet}

{#snippet icon(path)}
	<svg class="icon-svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
		<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d={path} />
	</svg>
{/snippet}

<Section {id}>
	<div class="content-wrapper">
		<div class="header-group">
			<h2 class="section-title">THE ENGINE</h2>
			<h3 class="subtitle">TECHNICAL DEEP DIVE</h3>
		</div>

		<div class="diagram-grid">
			<!-- Main Flow -->
			<div class="main-col">
				<!-- Sources -->
				<div class="flow-step">
					<h3 class="group-title">Sources</h3>
					<div class="nodes-row">
						{#each data.sources as source}
							<button
								class="node"
								class:active={selectedItem === source}
								onclick={() => select(source)}
							>
								<div class="node-label">{source.title}</div>
								{@render icon(source.icon)}
							</button>
						{/each}
					</div>
				</div>

				<div class="connector">{@render animatedArrow()}</div>

				<!-- Ingestion -->
				<div class="flow-step">
					<h3 class="group-title">Ingestion</h3>
					<div class="nodes-row">
						{#each data.ingestion.items as item}
							<button
								class="node wide"
								class:active={selectedItem === item}
								onclick={() => select(item)}
							>
								<div class="node-label">{item.title}</div>
								{@render icon(item.icon)}
							</button>
						{/each}
					</div>
				</div>

				<div class="connector">{@render animatedArrow()}</div>

				<!-- The Engine -->
				<div class="flow-step">
					<h3 class="group-title">Intelligence Layer</h3>
					<div class="nodes-grid-engine">
						{#each data.core.items as item}
							 <button
								class="node box"
								class:active={selectedItem === item}
								onclick={() => select(item)}
							>
								<div class="node-label-large">{item.title}</div>
								{@render icon(item.icon)}
							</button>
						{/each}
					</div>
				</div>

				<div class="connector">{@render animatedArrow()}</div>

				<!-- Delivery -->
				<div class="flow-step">
					<h3 class="group-title">Client Layer</h3>
					<div class="nodes-row">
						{#each data.delivery.items as item}
							<button
								class="node wide"
								class:active={selectedItem === item}
								onclick={() => select(item)}
							>
								<div class="node-label">{item.title}</div>
								{@render icon(item.icon)}
							</button>
						{/each}
					</div>
				</div>
			</div>
		</div>

		<!-- Info Panel -->
		{#if selectedItem}
			<div class="info-panel" transition:fly={{ y: 50, duration: 300 }}>
				<div class="info-content">
					<h4 class="info-title">{selectedItem.title}</h4>
					{#if selectedItem.details}
						<div class="info-details">
							{#each selectedItem.details as detail}
								<div class="detail-item">
									{#if detail.label}
										<span class="detail-label">{detail.label}:</span>
									{/if}
									<span class="detail-text">{detail.text}</span>
								</div>
							{/each}
						</div>
					{:else}
						<p class="info-desc">{selectedItem.description}</p>
					{/if}
				</div>
				<button class="close-btn" onclick={() => selectedItem = null}>Close</button>
			</div>
		{/if}
	</div>
</Section>

<style>
	.content-wrapper {
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 100%;
		max-width: 1200px;
		margin: 0 auto;
		color: #e5e5e5;
		padding-bottom: 60px; /* Space for info panel */
	}

	.header-group {
		text-align: center;
		margin-bottom: 2rem;
	}

	.section-title {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(3rem, 5vw, 4.5rem);
		font-weight: 700;
		text-transform: uppercase;
		margin: 0;
		line-height: 1;
		color: white;
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

	.diagram-grid {
		display: grid;
		grid-template-columns: 1fr;
		gap: 2rem;
		width: 100%;
		position: relative;
	}

	/* Main Flow */
	.main-col {
		display: flex;
		flex-direction: column;
		width: 100%;
	}

	.flow-step {
		width: 100%;
	}

	.group-title {
		font-size: 0.875rem;
		font-weight: 700;
		color: rgba(255, 255, 255, 0.6);
		text-transform: uppercase;
		margin: 0 0 1rem 0;
		text-align: left;
		padding-left: 0.5rem;
	}

	.nodes-row {
		display: flex;
		gap: 1rem;
		width: 100%;
	}

	.nodes-grid-engine {
		display: grid;
		grid-template-columns: repeat(2, 1fr);
		gap: 1.5rem;
		width: 100%;
	}

	.node {
		flex: 1;
		background: rgba(15, 17, 21, 0.8);
		border: 1px solid rgba(0, 175, 234, 0.3);
		border-radius: 8px;
		padding: 1rem;
		color: #e5e5e5;
		cursor: pointer;
		transition: all 0.2s ease;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		text-align: center;
		min-height: 80px;
		position: relative;
	}

	.node:hover {
		background: rgba(15, 17, 21, 1);
		border-color: #00afea;
	}

	.node.active {
		border-color: #00afea;
		box-shadow: 0 0 0 2px #00afea;
		background: rgba(0, 175, 234, 0.1);
	}

	.node-label {
		font-weight: 700;
		margin-bottom: 0.5rem;
		font-size: 0.9rem;
	}

	.node-label-large {
		font-family: 'Oswald', sans-serif;
		font-weight: 500;
		text-transform: uppercase;
		color: #00afea;
		margin-bottom: 0.5rem;
		font-size: 1rem;
	}

	.node.box {
		padding: 2rem 1rem;
		background: rgba(255, 255, 255, 0.05);
		border-style: dashed;
		border-color: rgba(255, 255, 255, 0.2);
	}

	.node.box:hover {
		border-color: #00afea;
		background: rgba(0, 175, 234, 0.05);
	}

	.node.box.active {
		border-style: solid;
		border-color: #00afea;
		background: rgba(0, 175, 234, 0.1);
	}

	/* Connector */
	.connector {
		display: flex;
		justify-content: center;
		padding: 1rem 0;
		color: rgba(0, 175, 234, 0.5);
	}

	.arrow-svg {
		width: 24px;
		height: 48px;
	}

	.icon-svg {
		width: 24px;
		height: 24px;
		color: #00afea;
	}

	/* Animation */
	@keyframes dash {
		to {
			stroke-dashoffset: 0;
		}
	}

	:global(.animate-dash) {
		stroke-dasharray: 5;
		stroke-dashoffset: 10;
		animation: dash 1s linear infinite;
	}

	/* Info Panel */
	.info-panel {
		position: fixed;
		bottom: 0;
		left: 0;
		right: 0;
		background: rgba(15, 17, 21, 0.95);
		backdrop-filter: blur(10px);
		border-top: 1px solid rgba(0, 175, 234, 0.5);
		padding: 1.5rem 2rem;
		z-index: 100;
		display: flex;
		align-items: flex-start;
		justify-content: space-between;
		gap: 2rem;
		box-shadow: 0 -5px 20px rgba(0, 0, 0, 0.5);
		max-height: 60vh;
	}

	.info-content {
		flex: 1;
		overflow-y: auto;
		max-height: 100%;
		padding-right: 1rem;
	}

	.info-title {
		font-family: 'Oswald', sans-serif;
		color: #00afea;
		font-size: 1.25rem;
		margin: 0 0 1rem 0;
		text-transform: uppercase;
		position: sticky;
		top: 0;
		background: rgba(15, 17, 21, 0.95);
		padding-bottom: 0.5rem;
	}

	.info-desc {
		margin: 0;
		font-size: 0.95rem;
		color: rgba(255, 255, 255, 0.8);
		line-height: 1.5;
	}

	.info-details {
		display: flex;
		flex-direction: column;
		gap: 0.75rem;
	}

	.detail-item {
		display: flex;
		flex-direction: column;
		gap: 0.25rem;
	}

	.detail-label {
		color: #00afea;
		font-weight: 700;
		font-size: 0.85rem;
		text-transform: uppercase;
		letter-spacing: 0.05em;
	}

	.detail-text {
		color: rgba(255, 255, 255, 0.9);
		font-size: 0.95rem;
		line-height: 1.5;
	}

	.close-btn {
		padding: 0.5rem 1.5rem;
		background: #2a2a2a;
		border: 1px solid #444;
		border-radius: 4px;
		color: white;
		font-weight: 700;
		cursor: pointer;
		transition: background 0.2s;
		white-space: nowrap;
		margin-top: 0;
		flex-shrink: 0;
	}

	.close-btn:hover {
		background: #3a3a3a;
	}

	/* Mobile Responsiveness */
	@media (max-width: 900px) {
		.diagram-grid {
			grid-template-columns: 1fr;
			gap: 1rem;
		}

		.nodes-row {
			flex-direction: column;
		}

		.nodes-grid-engine {
			grid-template-columns: 1fr;
		}

		.info-panel {
			flex-direction: column;
			gap: 1rem;
			align-items: stretch;
			padding: 1rem;
			max-height: 80vh;
		}

		.info-content {
			padding-right: 0;
		}

		.close-btn {
			align-self: flex-end;
		}

		.group-title {
			text-align: center;
			padding-left: 0;
		}
	}
</style>