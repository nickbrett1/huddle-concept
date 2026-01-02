<script>
	import Section from './Section.svelte';
	import { fade, slide } from 'svelte/transition';
	import { onMount } from 'svelte';

	let { id = "demo" } = $props();

	// --- Data ---
	const personas = [
		{
			id: 'expat',
			name: 'THE EXPAT',
			description: 'UK-based, focuses on analogies to Soccer and Cricket.',
			icon: '🌍'
		},
		{
			id: 'casual',
			name: 'THE CASUAL',
			description: 'US-based, focuses on the drama and "tea".',
			icon: '🍿'
		},
		{
			id: 'strategist',
			name: 'THE STRATEGIST',
			description: 'US-based, focuses on X\'s and O\'s and chess match.',
			icon: '♙'
		}
	];

	// Script content for the demo
	const scripts = {
		expat: [
			{
				type: 'broadcast',
				text: "Who's out in front? Wow, he takes on Za'Darius Smith!"
			},
			{
				delay: 1500,
				type: 'huddle',
				text: "Look at the man in purple (#55) charging in. That’s a bit like a defender in football (soccer) sliding in on a striker just as he’s about to take a shot.",
				metadata: {
					trigger: 'Visual Event: Sack',
					context: 'User_Literacy: Low (NFL)',
					logic: 'Analogy: Soccer_Slide_Tackle',
					tone: 'Educational'
				}
			},
			{
				delay: 2000,
				type: 'huddle',
				text: "Rodgers gets the ball away, but he gets a proper 'clobbering' afterward. In the NFL, you’re allowed to hit the 'batsman' even after the ball is gone if you're within a step.",
				metadata: {
					trigger: 'Follow-up: Late Hit?',
					context: 'Rule_Check: Roughing Passer',
					logic: 'Analogy: Cricket_Batsman',
					tone: 'Informative / Humorous'
				}
			},
			{
				delay: 1000,
				type: 'broadcast',
				text: "And then he's going to go tell him... look, he's laughing!"
			},
			{
				type: 'user_choice',
				options: ["Why are they smiling then? In the Premier League, that would be a red card!"]
			},
			{
				delay: 500,
				type: 'broadcast',
				text: "He didn't back down. I love that. You talk about—"
			},
			{
				delay: 1000,
				type: 'huddle',
				text: "They used to be teammates! It’s like Frank Lampard tackling John Terry—it’s high-intensity, but they're mates off the pitch.",
				metadata: {
					trigger: 'User Query: "Why smiling?"',
					context: 'Player_History: GB_Packers',
					logic: 'Social_Graph: Teammates',
					tone: 'Insightful'
				}
			}
		],
		casual: [
			{
				type: 'broadcast',
				text: "Who's out in front? Wow, he takes on Za'Darius Smith!"
			},
			{
				delay: 1500,
				type: 'huddle',
				text: "OMG, look at Za'Darius Smith going right for his old boss! The 'ex-teammate revenge' energy is off the charts today.",
				metadata: {
					trigger: 'Visual Event: Sack',
					context: 'Narrative: Rivalry',
					logic: 'Highlight: Emotional Arc',
					tone: 'Dramatic / Hype'
				}
			},
			{
				delay: 2000,
				type: 'huddle',
				text: "Smith was actually Rodgers’ teammate in Green Bay just last year. He definitely wanted to remind Aaron what he’s missing in Minnesota.",
				metadata: {
					trigger: 'Contextual Update',
					context: 'History: Smith_vs_Rodgers',
					logic: 'Backstory Injection',
					tone: 'Gossipy'
				}
			},
			{
				delay: 1000,
				type: 'broadcast',
				text: "And then he's going to go tell him... look, he's laughing!"
			},
			{
				type: 'user_choice',
				options: ["Rodgers looks like he’s about to scream, but then he starts laughing?"]
			},
			{
				delay: 500,
				type: 'broadcast',
				text: "He didn't back down. I love that. You talk about—"
			},
			{
				delay: 1000,
				type: 'huddle',
				text: "He's playing it off! He hates getting hit, but he knows if he gets mad, the Vikings fans (and Smith) will know they’ve gotten under his skin.",
				metadata: {
					trigger: 'User Observation: Reaction',
					context: 'Psych_Profile: Rodgers',
					logic: 'Interpretation: Body Language',
					tone: 'Insider'
				}
			}
		],
		strategist: [
			{
				type: 'broadcast',
				text: "Who's out in front? Wow, he takes on Za'Darius Smith!"
			},
			{
				delay: 1500,
				type: 'huddle',
				text: "Vikings are showing a 'Sugar' front to confuse the protection. Watch Smith (#55) use a speed-to-power move on the edge.",
				metadata: {
					trigger: 'Visual Event: Pre-snap',
					context: 'Formation: Sugar_Front',
					logic: 'Technique_ID: Speed_to_Power',
					tone: 'Technical / Analytical'
				}
			},
			{
				delay: 2000,
				type: 'huddle',
				text: "Rodgers is forced into an 'off-platform' throw. Smith finishes through the whistle to ensure the hit affects Rodgers' rhythm for the next drive.",
				metadata: {
					trigger: 'Visual Event: Throw Mechanics',
					context: 'QB_Mechanics: Off_Platform',
					logic: 'Impact_Analysis',
					tone: 'Professional'
				}
			},
			{
				delay: 1000,
				type: 'broadcast',
				text: "And then he's going to go tell him... look, he's laughing!"
			},
			{
				type: 'user_choice',
				options: ["Did the Right Tackle miss the 'hot' read there?"]
			},
			{
				delay: 500,
				type: 'broadcast',
				text: "He didn't back down. I love that. You talk about—"
			},
			{
				delay: 1000,
				type: 'huddle',
				text: "The Vikings' interior line slanted left, which pulled the help away from Smith. It created a 1-on-1 matchup that the Vikings' DC identified in the film room.",
				metadata: {
					trigger: 'User Query: "Blown Assignment?"',
					context: 'Scheme: Zone_Blitz',
					logic: 'Tactical_Breakdown',
					tone: 'Expert'
				}
			}
		]
	};

	// --- State ---
	let selectedPersona = $state(null);
	let messages = $state([]);
	let isTyping = $state(false);

	let scriptTimeout = null;

	let demoContainer = $state();
	let isVisible = $state(false);

	// --- Logic ---
	function selectPersona(persona) {
		if (scriptTimeout) clearTimeout(scriptTimeout);
		selectedPersona = persona;
		messages = [];
		isTyping = false;

		runScript(persona.id, 0);
	}

	function runScript(personaId, stepIndex) {
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
		if (step.type === 'broadcast' || step.type === 'huddle') {
			messages = [...messages, { ...step, id: Date.now() }];
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

	onMount(() => {
		const observer = new IntersectionObserver((entries) => {
			entries.forEach(entry => {
				if (entry.isIntersecting) {
					isVisible = true;
				}
			});
		}, { threshold: 0.1 });

		if (demoContainer) {
			observer.observe(demoContainer);
		}

		return () => {
			observer.disconnect();
		}
	});

</script>

<Section {id}>
	<div class="demo-wrapper" bind:this={demoContainer}>
		<div class="columns">
			<!-- Left Column: Controls -->
			<div class="controls-col">
				<div class="header-group">
					<h2 class="section-title">THE LIVE HUDDLE</h2>
					<p class="subtitle">EXPERIENCE THE INTERACTIVE DEMO.</p>
				</div>

				<div class="persona-selector">
					<h3 class="label">PICK YOUR PERSONA</h3>
					<p class="instruction">Select from the three sample personas below to start the demo:</p>
					<div class="buttons" class:unselected={!selectedPersona}>
						{#each personas as persona, i}
							<button
								class="persona-btn"
								class:active={selectedPersona?.id === persona.id}
								onclick={() => selectPersona(persona)}
							>
								<span class="icon">{persona.icon}</span>
								<div class="info">
									<span class="name">PERSONA {i+1}: {persona.name}</span>
									<span class="desc">{persona.description}</span>
								</div>
							</button>
						{/each}
					</div>
					<p class="persona-footnote">In a real implementation, personas would be highly personalised based on the user's past interaction with the app and other preferences. This wouldn’t be a selection step.</p>
				</div>

			</div>

			<!-- Right Column: Phone -->
			<div class="phone-col">
				<div class="tv-mockup">
					<div class="tv-screen">
						<iframe
							width="100%"
							height="100%"
							src={"https://www.youtube.com/embed/7w51A2TBBbE?controls=0&rel=0&loop=1&playlist=7w51A2TBBbE&mute=1&playsinline=1" + (isVisible ? "&autoplay=1" : "")}
							title="YouTube video player"
							frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen
						></iframe>
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
		font-family: 'Oswald', sans-serif;
		font-size: clamp(2.5rem, 5vw, 4rem);
		font-weight: 700;
		text-transform: uppercase;
		color: #fff;
		margin: 0;
		line-height: 1;
	}

	.subtitle {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(1rem, 2vw, 1.5rem);
		font-weight: 400;
		color: rgba(255, 255, 255, 0.9);
		margin: 0.5rem 0 0 0; /* Small gap from title */
		text-transform: uppercase;
		letter-spacing: 0.1em;
	}

	.header-group {
		display: flex;
		flex-direction: column;
		margin-bottom: 1rem;
	}

	.label {
		font-family: 'Oswald', sans-serif;
		font-size: 1.4rem;
		color: #ffffff;
		margin-bottom: 0.5rem;
		display: block;
		font-weight: 700;
		letter-spacing: 0.05em;
	}

	.instruction {
		font-size: 1rem;
		color: #ccc;
		margin-bottom: 1.5rem;
	}

	.persona-footnote {
		font-size: 0.8rem;
		color: #666;
		margin-top: 1.5rem;
		line-height: 1.4;
		max-width: 90%;
		font-style: italic;
	}

	.buttons {
		display: flex;
		flex-direction: column;
		gap: 1rem;
	}

	/* Pulse effect to draw attention when nothing is selected */
	.buttons.unselected .persona-btn {
		border-color: rgba(0, 175, 234, 0.4);
		animation: border-pulse 2s infinite;
	}

	@keyframes border-pulse {
		0% { border-color: rgba(0, 175, 234, 0.2); box-shadow: 0 0 0 rgba(0, 175, 234, 0); }
		50% { border-color: rgba(0, 175, 234, 0.6); box-shadow: 0 0 10px rgba(0, 175, 234, 0.2); }
		100% { border-color: rgba(0, 175, 234, 0.2); box-shadow: 0 0 0 rgba(0, 175, 234, 0); }
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
