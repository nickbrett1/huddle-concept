<script>
	import Section from './Section.svelte';
	import { fade, slide } from 'svelte/transition';

	let { id = "demo" } = $props();

	// --- Data ---
	const personas = [
		{
			id: 'expat',
			name: 'THE EXPAT',
			description: 'UK-based, knows Soccer/Cricket, new to NFL.',
			icon: '🌍'
		},
		{
			id: 'casual',
			name: 'THE CASUAL',
			description: 'US-based, here for the halftime show & drama.',
			icon: '🍿'
		},
		{
			id: 'strategist',
			name: 'THE STRATEGIST',
			description: 'US-based, wants the high-level chess match.',
			icon: '♟️'
		}
	];

	// Script content for the demo
	const scripts = {
		expat: [
			{
				type: 'broadcast',
				text: "Rodgers is back in the pocket... pressure coming... he's sacked! Loss of 8. That’s a massive blow on 3rd and long."
			},
			{
				delay: 1000,
				type: 'huddle',
				text: "Ouch. Rodgers just got flattened. That’s the third time today. Imagine a goalkeeper being left totally exposed by his defense—he’s got no chance."
			},
			{
				type: 'user_choice',
				options: ["Wait, why is it such a 'massive blow' if it's only 3rd down?"]
			},
			{
				type: 'huddle',
				text: "Great question. In the NFL, you only get 4 tries (downs) to move 10 yards. Since it was 3rd down and they lost yardage, they basically have to kick the ball away now. They just 'wasted' their possession. It's like being 2-0 down with only 5 minutes left on the clock.",
				metadata: {
					trigger: 'User Query "Why 3rd down?"',
					context: 'User_Literacy: 0.2',
					logic: 'Map NFL_Down_System to Soccer_Match_Clock',
					tone: 'Encouraging / Informal'
				}
			},
			{
				delay: 1500,
				type: 'huddle',
				text: "Also, keep an eye on Rodgers’ face. He’s yelling at his Left Tackle (the guy supposed to block for him). There’s a rumor they haven't spoken since training camp. The drama is peaking.",
				metadata: {
					trigger: 'Contextual Update',
					context: 'Narrative_Archive: Rodgers_vs_Line',
					logic: 'Inject "Soap Opera" Hook',
					tone: 'Dramatic / Insider'
				}
			}
		],
		casual: [
			{
				type: 'huddle',
				text: "Welcome! We'll keep the jargon low and the drama high. Tap 'The Expat' to see the full demo for now!",
				metadata: { trigger: 'Init', context: 'New User', logic: 'Default Welcome', tone: 'Friendly'}
			}
		],
		strategist: [
			{
				type: 'huddle',
				text: "Ready for the X's and O's? Tap 'The Expat' to see the full demo for now!",
				metadata: { trigger: 'Init', context: 'New User', logic: 'Default Welcome', tone: 'Professional'}
			}
		]
	};

	// --- State ---
	let selectedPersona = $state(null);
	let messages = $state([]);
	let showEngine = $state(false);
	let currentMetadata = $state(null);
	let isTyping = $state(false);

	let scriptTimeout = null;

	// --- Logic ---
	function selectPersona(persona) {
		console.log('Persona selected:', persona.id); // DEBUG
		if (scriptTimeout) clearTimeout(scriptTimeout);
		selectedPersona = persona;
		messages = [];
		currentMetadata = null;
		isTyping = false;

		runScript(persona.id, 0);
	}

	function runScript(personaId, stepIndex) {
		console.log('Running script step:', stepIndex); // DEBUG
		const script = scripts[personaId];
		if (!script || stepIndex >= script.length) return;

		const step = script[stepIndex];

		// If delay, wait then process
		const delay = step.delay || 1000;
		isTyping = true;

		scriptTimeout = setTimeout(() => {
			isTyping = false;
			processStep(step, personaId, stepIndex);
		}, delay);
	}

	function processStep(step, personaId, stepIndex) {
		console.log('Processing step:', step); // DEBUG
		if (step.type === 'broadcast' || step.type === 'huddle') {
			messages = [...messages, { ...step, id: Date.now() }];
			if (step.metadata) {
				currentMetadata = step.metadata;
			}
			// Auto advance
			runScript(personaId, stepIndex + 1);
		} else if (step.type === 'user_choice') {
			// Wait for user input
			// We append a special "choice" message that renders buttons
			messages = [...messages, { ...step, id: Date.now(), isChoice: true, originalIndex: stepIndex }];
		}
	}

	function handleUserChoice(choiceText, stepIndex) {
		// Replace choice buttons with user message
		messages = messages.filter(m => !m.isChoice); // remove buttons
		messages = [...messages, { type: 'user', text: choiceText, id: Date.now() }];

		// Advance script
		if (selectedPersona) {
			runScript(selectedPersona.id, stepIndex + 1);
		}
	}

</script>

<Section {id}>
	<div class="demo-wrapper">
		<div class="columns">
			<!-- Left Column: Controls -->
			<div class="controls-col">
				<h2 class="section-title">THE LIVE HUDDLE</h2>
				<p class="subtitle">Experience the interactive demo.</p>

				<div class="persona-selector">
					<h3 class="label">PICK YOUR PERSONA</h3>
					<p class="persona-footnote">In a real implementation, personas would be highly personalised based on the users past interaction with the app and other preferences. This wouldn’t be a selection step.</p>
					<div class="buttons">
						{#each personas as persona}
							<button
								class="persona-btn"
								class:active={selectedPersona?.id === persona.id}
								onclick={() => selectPersona(persona)}
							>
								<span class="icon">{persona.icon}</span>
								<div class="info">
									<span class="name">{persona.name}</span>
									<span class="desc">{persona.description}</span>
								</div>
							</button>
						{/each}
					</div>
				</div>

				<div class="engine-control">
					<div class="toggle-row">
						<span class="label">ENGINE OVERLAY</span>
						<label class="switch">
							<input type="checkbox" bind:checked={showEngine}>
							<span class="slider round"></span>
						</label>
					</div>

					{#if showEngine}
						<div class="engine-display" transition:slide>
							<div class="engine-header">METADATA STREAM</div>
							{#if currentMetadata}
								<div class="meta-row"><span class="key">TRIGGER:</span> <span class="val">{currentMetadata.trigger}</span></div>
								<div class="meta-row"><span class="key">CONTEXT:</span> <span class="val">{currentMetadata.context}</span></div>
								<div class="meta-row"><span class="key">LOGIC:</span> <span class="val">{currentMetadata.logic}</span></div>
								<div class="meta-row"><span class="key">TONE:</span> <span class="val">{currentMetadata.tone}</span></div>
							{:else}
								<div class="meta-row waiting">Waiting for AI response...</div>
							{/if}
						</div>
					{/if}
				</div>
			</div>

			<!-- Right Column: Phone -->
			<div class="phone-col">
				<div class="tv-mockup">
					<div class="tv-screen">
						<div class="tv-placeholder">
							<span>LIVE GAME FEED</span>
							<small>(Clip Placeholder)</small>
						</div>
					</div>
					<div class="tv-stand"></div>
				</div>

				<div class="phone-mockup">
					<div class="phone-header">
						<div class="signal">5G</div>
						<div class="app-name">THE HUDDLE</div>
						<div class="battery">100%</div>
					</div>
					<div class="chat-area">
						{#if messages.length === 0 && !isTyping}
							<div class="empty-state">Select a persona to start the live feed.</div>
						{/if}

						{#each messages as msg (msg.id)}
							<div class="message-row" class:user={msg.type === 'user'} class:broadcast={msg.type === 'broadcast'} class:choice={msg.isChoice} transition:slide|local>
								{#if msg.type === 'broadcast'}
									<div class="broadcast-bubble">
										<div class="b-label">LIVE BROADCAST</div>
										{msg.text}
									</div>
								{:else if msg.type === 'huddle'}
									<div class="avatar">H</div>
									<div class="bubble huddle">
										{msg.text}
									</div>
								{:else if msg.type === 'user'}
									<div class="bubble user">
										{msg.text}
									</div>
								{:else if msg.isChoice}
									<div class="choice-container">
										{#each msg.options as option}
											<button class="choice-btn" onclick={() => handleUserChoice(option, msg.originalIndex)}>
												{option}
											</button>
										{/each}
									</div>
								{/if}
							</div>
						{/each}

						{#if isTyping}
							<div class="typing-indicator" transition:fade>
								<span>.</span><span>.</span><span>.</span>
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
	</div>
</Section>

<style>
	.demo-wrapper {
		width: 100%;
		display: flex;
		justify-content: center;
		padding: 1rem;
	}

	.columns {
		display: flex;
		flex-direction: row;
		gap: 4rem;
		width: 100%;
		max-width: 1100px;
		align-items: flex-start;
	}

	/* Left Column */
	.controls-col {
		flex: 1;
		display: flex;
		flex-direction: column;
		gap: 2rem;
		text-align: left;
	}

	.section-title {
		font-size: 3rem;
		color: #fff;
		margin: 0;
		line-height: 1;
	}

	.subtitle {
		font-family: sans-serif;
		color: #aaa;
		margin-top: -1.5rem;
		font-size: 1.1rem;
	}

	.label {
		font-size: 1.2rem;
		color: #00afea;
		margin-bottom: 0.5rem;
		display: block;
		font-weight: 700;
	}

	.persona-footnote {
		font-size: 0.8rem;
		color: #888;
		margin-bottom: 1.5rem;
		line-height: 1.4;
		max-width: 90%;
	}

	.buttons {
		display: flex;
		flex-direction: column;
		gap: 1rem;
	}

	.persona-btn {
		background: rgba(255, 255, 255, 0.05);
		border: 1px solid rgba(255, 255, 255, 0.1);
		padding: 1rem;
		display: flex;
		align-items: center;
		gap: 1rem;
		text-align: left;
		cursor: pointer;
		color: white;
		transition: all 0.2s ease;
		border-radius: 4px;
	}

	.persona-btn:hover {
		background: rgba(255, 255, 255, 0.1);
		border-color: #00afea;
	}

	.persona-btn.active {
		background: rgba(0, 175, 234, 0.1);
		border-color: #00afea;
		box-shadow: 0 0 15px rgba(0, 175, 234, 0.2);
	}

	.icon {
		font-size: 1.5rem;
	}

	.info {
		display: flex;
		flex-direction: column;
	}

	.name {
		font-family: 'Oswald', sans-serif;
		font-weight: 700;
		font-size: 1.1rem;
	}

	.desc {
		font-size: 0.85rem;
		color: #ccc;
	}

	/* Engine Overlay */
	.engine-control {
		margin-top: 2rem;
		border-top: 1px solid rgba(255, 255, 255, 0.1);
		padding-top: 2rem;
	}

	.toggle-row {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 1rem;
	}

	.engine-display {
		background: rgba(0, 0, 0, 0.5);
		border: 1px solid #00afea;
		padding: 1rem;
		font-family: 'Courier New', monospace;
		font-size: 0.85rem;
		color: #00afea;
		border-radius: 4px;
	}

	.engine-header {
		border-bottom: 1px solid rgba(0, 175, 234, 0.3);
		padding-bottom: 0.5rem;
		margin-bottom: 0.5rem;
		font-weight: bold;
	}

	.meta-row {
		margin-bottom: 0.3rem;
		display: flex;
	}

	.meta-row.waiting {
		opacity: 0.5;
		font-style: italic;
	}

	.key {
		width: 70px;
		opacity: 0.7;
	}

	.val {
		color: white;
		flex: 1;
	}

	/* Toggle Switch */
	.switch {
		position: relative;
		display: inline-block;
		width: 50px;
		height: 24px;
	}
	.switch input { opacity: 0; width: 0; height: 0; }
	.slider {
		position: absolute;
		cursor: pointer;
		top: 0; left: 0; right: 0; bottom: 0;
		background-color: #333;
		transition: .4s;
	}
	.slider:before {
		position: absolute;
		content: "";
		height: 16px;
		width: 16px;
		left: 4px;
		bottom: 4px;
		background-color: white;
		transition: .4s;
	}
	input:checked + .slider { background-color: #00afea; }
	input:checked + .slider:before { transform: translateX(26px); }
	.slider.round { border-radius: 34px; }
	.slider.round:before { border-radius: 50%; }

	/* Right Column: Phone */
	.phone-col {
		flex: 1;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		gap: 2rem;
	}

	.tv-mockup {
		width: 320px;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.tv-screen {
		width: 100%;
		aspect-ratio: 16/9;
		background: #000;
		border: 8px solid #222;
		border-radius: 4px;
		display: flex;
		justify-content: center;
		align-items: center;
		position: relative;
		box-shadow: 0 0 30px rgba(0, 175, 234, 0.1);
	}

	.tv-placeholder {
		display: flex;
		flex-direction: column;
		align-items: center;
		color: #444;
		font-family: 'Oswald', sans-serif;
		letter-spacing: 1px;
	}

	.tv-placeholder span {
		font-size: 1.2rem;
		font-weight: bold;
	}

	.tv-placeholder small {
		font-size: 0.8rem;
		opacity: 0.7;
	}

	.tv-stand {
		width: 80px;
		height: 10px;
		background: #222;
		margin-top: 0;
		border-bottom-left-radius: 8px;
		border-bottom-right-radius: 8px;
	}

	.phone-mockup {
		width: 320px;
		height: 600px;
		background: #0f1115;
		border: 12px solid #1a1d23;
		border-radius: 30px;
		box-shadow: 0 20px 50px rgba(0,0,0,0.5);
		display: flex;
		flex-direction: column;
		overflow: hidden;
		position: relative;
	}

	.phone-header {
		background: #1a1d23;
		padding: 10px 15px;
		display: flex;
		justify-content: space-between;
		font-size: 0.7rem;
		color: #aaa;
		align-items: center;
		border-bottom: 1px solid #333;
	}

	.app-name {
		color: white;
		font-weight: bold;
		letter-spacing: 1px;
	}

	.chat-area {
		flex: 1;
		padding: 1rem;
		overflow-y: auto;
		display: flex;
		flex-direction: column;
		gap: 1rem;
		background: linear-gradient(180deg, #0f1115 0%, #15181e 100%);
	}

	.empty-state {
		text-align: center;
		color: #555;
		margin-top: 50%;
		font-style: italic;
	}

	/* Bubbles */
	.message-row {
		display: flex;
		align-items: flex-end;
		gap: 0.5rem;
		max-width: 100%;
	}

	.message-row.user {
		justify-content: flex-end;
	}

	.message-row.broadcast {
		justify-content: center;
	}

	.broadcast-bubble {
		background: rgba(255, 255, 255, 0.05);
		border: 1px solid rgba(255, 255, 255, 0.1);
		padding: 0.8rem;
		border-radius: 8px;
		font-size: 0.8rem;
		color: #ccc;
		text-align: center;
		width: 100%;
		font-style: italic;
	}

	.b-label {
		font-size: 0.6rem;
		color: #00afea;
		font-weight: bold;
		margin-bottom: 0.2rem;
		text-transform: uppercase;
	}

	.avatar {
		width: 30px;
		height: 30px;
		background: #00afea;
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
		font-weight: bold;
		font-size: 0.8rem;
		color: white;
		flex-shrink: 0;
	}

	.bubble {
		padding: 0.8rem 1rem;
		border-radius: 18px;
		font-size: 0.9rem;
		line-height: 1.4;
		max-width: 80%;
	}

	.bubble.huddle {
		background: #252a33;
		color: white;
		border-bottom-left-radius: 4px;
	}

	.bubble.user {
		background: #00afea;
		color: white;
		border-bottom-right-radius: 4px;
	}

	.choice-container {
		display: flex;
		flex-direction: column;
		align-items: flex-end;
		width: 100%;
		gap: 0.5rem;
	}

	.choice-btn {
		background: transparent;
		border: 1px solid #00afea;
		color: #00afea;
		padding: 0.5rem 1rem;
		border-radius: 20px;
		cursor: pointer;
		font-size: 0.85rem;
		text-align: right;
		transition: all 0.2s;
	}

	.choice-btn:hover {
		background: #00afea;
		color: white;
	}

	.typing-indicator {
		color: #555;
		font-size: 1.5rem;
		padding-left: 3rem;
		margin-top: -0.5rem;
	}

	.typing-indicator span {
		animation: blink 1.4s infinite both;
	}

	.typing-indicator span:nth-child(2) { animation-delay: 0.2s; }
	.typing-indicator span:nth-child(3) { animation-delay: 0.4s; }

	@keyframes blink {
		0% { opacity: 0.2; }
		20% { opacity: 1; }
		100% { opacity: 0.2; }
	}

	/* Responsive */
	@media (max-width: 768px) {
		.columns {
			flex-direction: column;
			align-items: center;
			gap: 2rem;
		}

		.controls-col {
			width: 100%;
			text-align: center;
		}

		.persona-btn {
			justify-content: center;
		}

		.info {
			text-align: left;
		}
	}
</style>
