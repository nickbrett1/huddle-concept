<script>
	import Section from './Section.svelte';
	import { fly } from 'svelte/transition';

	let { id = "engine" } = $props();
	let selectedItem = $state(null);

	const data = {
		context: {
			title: 'Context & Control',
			description: 'Global settings that drive the engine\'s personalization logic.',
			icon: 'M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z M15 12a3 3 0 11-6 0 3 3 0 016 0z',
			items: [
				{
					id: 'personas',
					title: 'User Personas',
					description: 'The active viewer profile (e.g., "The Expat") which dictates the analogy engine.',
					icon: 'M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z'
				}
			]
		},
		sources: [
			{
				id: 'live_data',
				title: 'Live Data',
				description: 'Real-time play-by-play feeds from Sportradar and telemetry.',
				icon: 'M12 2a10 10 0 1 0 10 10 M12 12 2 2 M12 12L2 2'
			},
			{
				id: 'historical',
				title: 'Historical DB',
				description: 'Past season stats for trend analysis and context.',
				icon: 'M4 7v10c0 2.21 3.58 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.58 4 8 4s8-1.79 8-4M4 7c0-2.21 3.58-4 8-4s8 1.79 8 4m0 5c0 2.21-3.58 4-8 4s-8-1.79-8-4'
			}
		],
		ingestion: {
			title: 'Ingestion',
			items: [
				{
					id: 'normalize',
					title: 'Normalization',
					description: 'Standardizing disparate data sources into the Huddle Event Schema.',
					icon: 'M3 6l7 7v4h4v-4l7-7V4H3z'
				}
			]
		},
		core: {
			title: 'The Engine',
			items: [
				{
					id: 'drama',
					title: 'Drama Meter',
					description: 'Calculates "Tension" in real-time based on Win Probability and Momentum.',
					icon: 'M3 3v18h18 M18 9l-5 5-4-4-3 3'
				},
				{
					id: 'adaptation',
					title: 'Adaptation Agent',
					description: 'LLM-based agent that personalizes content based on the Drama Score + User Persona.',
					icon: 'M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z'
				}
			]
		},
		delivery: {
			title: 'Delivery',
			items: [
				{
					id: 'client',
					title: 'Client App',
					description: 'SvelteKit frontend rendering the personalized overlay via SSE.',
					icon: 'M17 2H7a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM12 18h.01'
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
			<!-- Sidebar: Context -->
			<div class="sidebar-col">
				<div class="spacer desktop-only"></div>
				<div class="sidebar-group">
					<div class="group-title desktop-only" aria-hidden="true">&nbsp;</div>
					{#each data.context.items as item}
						<button
							class="node sidebar-node"
							class:active={selectedItem === item}
							onclick={() => select(item)}
						>
							{@render icon(item.icon)}
							<span class="node-label sidebar-label">{item.title}</span>
						</button>
					{/each}
				</div>
			</div>

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
					<h3 class="group-title">Processing Core</h3>
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
					<h3 class="group-title">Delivery</h3>
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
					<p class="info-desc">{selectedItem.description}</p>
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
		grid-template-columns: 80px 1fr;
		gap: 2rem;
		width: 100%;
		position: relative;
	}

	/* Sidebar */
	.sidebar-col {
		display: flex;
		flex-direction: column;
	}

	.spacer {
		height: 40px; /* Align with title headers */
		margin-bottom: 1rem;
	}

	.sidebar-node {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		min-height: 150px;
		height: 100%;
		writing-mode: vertical-lr;
		transform: rotate(180deg);
		padding: 1rem 0.5rem;
		gap: 0.5rem;
	}

	.sidebar-label {
		font-family: 'Oswald', sans-serif;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		font-size: 0.9rem;
		color: #00afea;
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
		align-items: center;
		justify-content: space-between;
		gap: 2rem;
		box-shadow: 0 -5px 20px rgba(0, 0, 0, 0.5);
	}

	.info-content {
		flex: 1;
	}

	.info-title {
		font-family: 'Oswald', sans-serif;
		color: #00afea;
		font-size: 1.25rem;
		margin: 0 0 0.5rem 0;
		text-transform: uppercase;
	}

	.info-desc {
		margin: 0;
		font-size: 0.95rem;
		color: rgba(255, 255, 255, 0.8);
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

		.sidebar-col {
			flex-direction: row;
			margin-bottom: 1rem;
		}

		.sidebar-node {
			writing-mode: horizontal-tb;
			transform: none;
			min-height: auto;
			height: auto;
			flex-direction: row;
			width: 100%;
			padding: 0.75rem;
		}

		.sidebar-label {
			margin-left: 0.5rem;
			font-size: 1rem;
		}

		.spacer.desktop-only, .group-title.desktop-only {
			display: none;
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
			align-items: flex-start;
			padding: 1rem;
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
