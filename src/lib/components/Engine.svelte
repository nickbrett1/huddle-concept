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
                    { label: 'The Core: Vector Database', text: 'Optimized for high-speed "similarity searches" (e.g., Pinecone, Weaviate, or pgvector). It retrieves not just stats, but narrative "lore"—like instantly fetching Aaron Rodgers\' Packers history when he\'s mentioned in a Jets game.' },
                    { label: 'The Embedding Model', text: 'Converts sports jargon into machine-understandable vectors. We can use OpenAI text-embedding-3 for speed, or fine-tuned Hugging Face models (sentence-transformers) to deeply understand nuanced sports terminology.' }
                ]
			},
            {
                id: 'personas',
                title: 'The User Vector',
                icon: 'M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z',
                details: [
                    { label: 'Source', text: 'Persona selection (Expat, Casual, Strategist) and interaction history.' },
                    { label: 'Method', text: 'A dynamic User Profile Vector stored at the Edge.' },
                    { label: 'Purpose', text: 'Informs the Intelligence Layer, ensuring analogies and technical depth are tailored to the individual\'s knowledge level.' }
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
						{ label: 'Architecture', text: 'Unifies data streams into the Enrichment Layer, preventing data silos and ensuring real-time accuracy.' }
					]
				}
			]
		},
		enrichment: {
			title: 'Enrichment Layer',
			items: [
				{
					id: 'drama',
					title: 'The Drama Meter',
					icon: 'M3 3v18h18 M18 9l-5 5-4-4-3 3',
                    details: [
                        { label: 'Enrichment', text: 'Calculates the emotional weight of the moment. Monitors real-time Win Probability (WP) and can use lightweight audio models to analyze broadcast sentiment.' },
                        { label: 'Output', text: 'Flags the event stream with metadata (e.g., { drama_score: 9.5, type: "game_changing_play" }).' }
                    ]
				},
                {
                    id: 'tactical_ai',
                    title: 'The Tactical Analyzer',
                    icon: 'M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z',
                    details: [
                        { label: 'Enrichment', text: 'Deconstructs the play to add context. We can use an LLM (utilizing Retrieval-Augmented Generation from the Knowledge Base) to identify formations and find historical precedents for the current situation.' },
                        { label: 'Output', text: 'Tags the stream with tactical insights (e.g., { formation: "Spider 2 Y Banana", similar_to: "Super Bowl XLIX" }).' }
                    ]
                }
			]
		},
		intelligence: {
			title: 'Intelligence Layer',
			items: [
				{
					id: 'adaptation',
					title: 'The Adaptation Agent',
					icon: 'M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z',
                    details: [
                        { label: 'Decision Engine', text: 'The creative hub. Instead of one generic feed, it generates multiple narrative tracks simultaneously (e.g., one for "The Expat", one for "The Strategist") based on active user personas.' },
                        { label: 'LLM Generation', text: 'Uses an LLM to craft these specific narratives in real-time, preparing a "multicast" stream rich with varied analogies and insights.' }
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
                        { label: 'Persona Logic', text: 'This is where the personalization happens. The Edge function identifies the connected user and "subscribes" them to the specific narrative track generated by the Adaptation Agent, filtering out irrelevant data before it hits the device.' }
                    ]
				}
			]
		}
	};

	function select(item) {
		selectedItem = selectedItem?.id === item.id ? null : item;
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
			<p class="interaction-hint">Select any component for more details</p>
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
								class:active={selectedItem?.id === source.id}
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
								class:active={selectedItem?.id === item.id}
								onclick={() => select(item)}
							>
								<div class="node-label">{item.title}</div>
								{@render icon(item.icon)}
							</button>
						{/each}
					</div>
				</div>

				<div class="connector">{@render animatedArrow()}</div>

				<!-- Enrichment -->
				<div class="flow-step">
					<h3 class="group-title">Enrichment Layer</h3>
					<div class="nodes-row">
						{#each data.enrichment.items as item}
							 <button
								class="node box"
								class:active={selectedItem?.id === item.id}
								onclick={() => select(item)}
							>
								<div class="node-label-large">{item.title}</div>
								{@render icon(item.icon)}
							</button>
						{/each}
					</div>
				</div>

				<div class="connector">{@render animatedArrow()}</div>

				<!-- Intelligence -->
				<div class="flow-step">
					<h3 class="group-title">Intelligence Layer</h3>
					<div class="nodes-row">
						{#each data.intelligence.items as item}
							 <button
								class="node box"
								class:active={selectedItem?.id === item.id}
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
								class:active={selectedItem?.id === item.id}
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

	.interaction-hint {
		font-family: 'Montserrat', sans-serif;
		font-size: 0.9rem;
		color: #00afea;
		margin-top: 1rem;
		font-weight: 600;
		letter-spacing: 0.05em;
		animation: pulse 2s infinite;
	}

	@keyframes pulse {
		0% { opacity: 0.7; }
		50% { opacity: 1; }
		100% { opacity: 0.7; }
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

	.node {
		flex: 1;
		background: black;
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
		font-weight: 700;
		margin-bottom: 0.5rem;
		font-size: 1rem;
	}

	.node.box {
		padding: 2rem 1rem;
		border-style: solid;
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