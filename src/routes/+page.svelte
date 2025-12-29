<script>
	import { fade } from 'svelte/transition';

	let isDecoded = $state(false);

	function toggleDecode() {
		isDecoded = !isDecoded;
	}
</script>

<svelte:head>
	<title>The Huddle Concept</title>
	<meta name="description" content="The Huddle: Decoding the game into the stories you'll love." />
</svelte:head>

<main>
	<!-- Section 1: The Hero (The Hook) -->
	<section id="hero" class="hero">
		<div class="content">
			<h1>The Huddle</h1>
			<h2>Decoding the game into the stories you'll love.</h2>
			<p class="sub-headline">
				Bringing the "Drive to Survive" effect to every American sport. An AI-powered personal
				companion that translates jargon into drama and stats into stories.
			</p>

			<div class="mockup">
				<div class="screen live-game">
					<div class="label">Live Game Feed</div>
					<!-- Placeholder for video/game -->
					<div class="placeholder-rect"></div>
				</div>
				<div class="screen chat">
					<div class="label">The Huddle Companion</div>
					<div class="chat-bubble">Who is that player?</div>
					<div class="chat-bubble ai">That's the QB who was traded last season...</div>
				</div>
			</div>

			<a href="#problem" class="cta-button">Explore the Concept</a>
		</div>
	</section>

	<!-- Section 2: The Problem (The "Gap") -->
	<section id="problem">
		<div class="content">
			<h2>The Problem</h2>
			<div class="stat-box">
				<p class="stat">88%</p>
				<p class="stat-desc">of us watch with a second screen, but we've never felt more alone.</p>
			</div>

			<div class="barriers">
				<div class="barrier">
					<h3>The Jargon Wall</h3>
					<p>Terms like "Safety," "Nickel Defense," and "RBI" act as gatekeepers.</p>
				</div>
				<div class="barrier">
					<h3>The Context Gap</h3>
					<p>If you didn't grow up with the sport, you miss the 20-year rivalries and human drama that make the game "sticky."</p>
				</div>
			</div>

			<p class="quote">"Traditional broadcasts are built for the expert. We built something for the fan."</p>
		</div>
	</section>

	<!-- Section 3: The Interactive Demo (The "Flex") -->
	<section id="demo" class="demo-section">
		<div class="content">
			<h2>Interactive Demo</h2>
			<p>Experience the translation.</p>

			<div class="demo-container">
				<div class="live-feed">
					<div class="feed-header">
						<span>Live Play Feed</span>
						<button class="decode-btn" onclick={toggleDecode}>
							{isDecoded ? 'Show Raw Feed' : 'Decode the Drama'}
						</button>
					</div>

					<div class="feed-content">
						{#if !isDecoded}
							<div class="jargon-text">
								<p><strong>Situation:</strong> 4th-and-1 in the Red Zone.</p>
								<p><strong>Formation:</strong> I-Form Tight.</p>
								<p><strong>Action:</strong> HB Dive.</p>
							</div>
						{:else}
							<div class="story-text" in:fade>
								<p>This is the moment of truth. If they don't score now, the season is likely over.</p>
								<p>The QB is staring down the coach who traded him three years ago.</p>
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Section 4: The Engine (The "How It Works") -->
	<section id="engine">
		<div class="content">
			<h2>The Engine</h2>
			<div class="diagram-placeholder">
				<div class="box">Ingestion (Sportradar)</div>
				<div class="arrow">→</div>
				<div class="box">Drama Meter (Win Prob)</div>
				<div class="arrow">→</div>
				<div class="box">Adaptation Agent (User Profile)</div>
			</div>

			<div class="tech-details">
				<p><strong>Real-time data feeds:</strong> WebSocket connections for instant updates.</p>
				<p><strong>The Drama Meter:</strong> Calculating tension using "Win Probability" swings.</p>
				<p><strong>The Adaptation Agent:</strong> Adjusts analogies based on your profile (e.g., UK expat).</p>
				<p class="dev-note"><em>Developer Note: Using Server-Sent Events (SSE) for low-latency, battery-efficient streaming.</em></p>
			</div>
		</div>
	</section>

	<!-- Section 5: The Opportunity (The "Fox" Slide) -->
	<section id="opportunity">
		<div class="content">
			<h2>The Opportunity</h2>
			<ul class="benefits">
				<li>
					<strong>Reclaiming Attention:</strong> Keeping the "Second Screen" inside the Fox ecosystem.
				</li>
				<li>
					<strong>Closing the Loop:</strong> Shoppable TV. One-tap purchase links for ads or player gear.
				</li>
				<li>
					<strong>Demographic Bridge:</strong> Onboarding Gen Z and international audiences.
				</li>
			</ul>
		</div>
	</section>

	<!-- Section 6: The Author (The "Human" Angle) -->
	<section id="author">
		<div class="content">
			<h2>The Author</h2>
			<div class="profile">
				<h3>Nick — Software Engineer</h3>
				<p>"I moved from the UK to New York and realized I was missing out on the biggest cultural conversations in the US. I built this concept to solve my own problem using the same low-latency engineering I use in Finance."</p>
				<a href="https://www.google.com/search?q=fintechnick.com" target="_blank" class="link">fintechnick.com</a>
			</div>
		</div>
	</section>

	<!-- Section 7: The Footer (The Call to Action) -->
	<section id="footer" class="footer">
		<div class="content">
			<h2>Let's evolve the broadcast together.</h2>

			<div class="form-placeholder">
				<input type="email" placeholder="Interested? Drop your email." />
				<button>Send</button>
			</div>

			<div class="socials">
				<a href="#">LinkedIn</a>
				<a href="#">GitHub</a>
			</div>
		</div>
	</section>
</main>

<style>
	:global(html) {
		scroll-behavior: smooth;
	}

	:global(body) {
		margin: 0;
		padding: 0;
		background-color: #0f1115; /* Deep, dark background */
		color: #ffffff;
		font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
		overflow-x: hidden;
	}

	main {
		width: 100%;
	}

	section {
		min-height: 100vh; /* Full screen sections */
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		padding: 4rem 2rem;
		box-sizing: border-box;
		border-bottom: 1px solid #222;
		text-align: center;
	}

	.content {
		max-width: 800px;
		width: 100%;
	}

	h1 {
		font-size: 4rem;
		font-weight: 800;
		text-transform: uppercase;
		margin-bottom: 0.5rem;
		letter-spacing: -1px;
		background: linear-gradient(90deg, #fff, #bbb);
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
	}

	h2 {
		font-size: 2.5rem;
		font-weight: 700;
		margin-bottom: 1.5rem;
		color: #e0e0e0;
	}

	h3 {
		font-size: 1.5rem;
		color: #00b4ff; /* Fox Sports Blue-ish */
		margin-bottom: 0.5rem;
	}

	p {
		font-size: 1.2rem;
		line-height: 1.6;
		color: #aaa;
		margin-bottom: 1.5rem;
	}

	.sub-headline {
		font-size: 1.5rem;
		color: #ccc;
		margin-bottom: 3rem;
	}

	.cta-button {
		display: inline-block;
		padding: 1rem 2rem;
		background-color: #00b4ff;
		color: white;
		text-decoration: none;
		font-weight: bold;
		border-radius: 4px;
		text-transform: uppercase;
		transition: background-color 0.3s;
		margin-top: 2rem;
	}

	.cta-button:hover {
		background-color: #008ecc;
	}

	/* Mockup Styles */
	.mockup {
		display: flex;
		gap: 1rem;
		justify-content: center;
		margin-bottom: 2rem;
		flex-wrap: wrap;
	}

	.screen {
		background: #1a1a1a;
		border: 1px solid #333;
		border-radius: 8px;
		width: 300px;
		height: 200px;
		display: flex;
		flex-direction: column;
		padding: 1rem;
		position: relative;
	}

	.screen.live-game {
		border: 1px solid #00b4ff;
	}

	.label {
		font-size: 0.8rem;
		text-transform: uppercase;
		color: #666;
		margin-bottom: 0.5rem;
	}

	.placeholder-rect {
		flex: 1;
		background: #222;
		border-radius: 4px;
	}

	.chat-bubble {
		background: #333;
		padding: 0.5rem;
		border-radius: 8px;
		margin-bottom: 0.5rem;
		font-size: 0.9rem;
		text-align: left;
	}

	.chat-bubble.ai {
		background: #005a80;
		align-self: flex-end;
	}

	/* Problem Section */
	.stat-box .stat {
		font-size: 6rem;
		font-weight: 900;
		color: #ffcc00; /* Attention grabbing yellow */
		margin: 0;
	}

	.barriers {
		display: flex;
		gap: 2rem;
		margin: 2rem 0;
		flex-wrap: wrap;
		justify-content: center;
	}

	.barrier {
		background: #1a1a1a;
		padding: 1.5rem;
		border-radius: 8px;
		flex: 1;
		min-width: 250px;
	}

	.quote {
		font-style: italic;
		border-left: 4px solid #00b4ff;
		padding-left: 1rem;
		display: inline-block;
	}

	/* Demo Section */
	.demo-container {
		background: #111;
		border: 1px solid #333;
		border-radius: 12px;
		padding: 2rem;
		margin-top: 2rem;
		box-shadow: 0 4px 20px rgba(0,0,0,0.5);
	}

	.live-feed {
		text-align: left;
	}

	.feed-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 1rem;
		border-bottom: 1px solid #333;
		padding-bottom: 1rem;
	}

	.decode-btn {
		background: #ffcc00;
		color: #000;
		border: none;
		padding: 0.5rem 1rem;
		font-weight: bold;
		cursor: pointer;
		border-radius: 4px;
	}

	.feed-content {
		min-height: 150px;
	}

	.jargon-text p {
		color: #ff6666;
		font-family: monospace;
	}

	.story-text p {
		color: #66ff66;
		font-size: 1.3rem;
	}

	/* Engine Section */
	.diagram-placeholder {
		display: flex;
		justify-content: center;
		align-items: center;
		gap: 1rem;
		margin: 2rem 0;
		flex-wrap: wrap;
	}

	.box {
		border: 1px solid #00b4ff;
		padding: 1rem;
		border-radius: 4px;
		background: #0f2a38;
	}

	.arrow {
		font-size: 1.5rem;
		color: #555;
	}

	/* Opportunity Section */
	.benefits {
		text-align: left;
		list-style-type: none;
		padding: 0;
	}

	.benefits li {
		background: #1a1a1a;
		padding: 1rem;
		margin-bottom: 1rem;
		border-left: 4px solid #00b4ff;
	}

	/* Author Section */
	.profile {
		background: #1a1a1a;
		padding: 2rem;
		border-radius: 8px;
	}

	.link {
		color: #00b4ff;
		text-decoration: none;
	}

	/* Footer */
	.form-placeholder {
		display: flex;
		gap: 0.5rem;
		justify-content: center;
		margin: 2rem 0;
	}

	input {
		padding: 0.8rem;
		border-radius: 4px;
		border: 1px solid #333;
		background: #222;
		color: white;
		width: 250px;
	}

	button {
		padding: 0.8rem 1.5rem;
		background: #00b4ff;
		color: white;
		border: none;
		border-radius: 4px;
		font-weight: bold;
		cursor: pointer;
	}

	.socials {
		display: flex;
		gap: 1rem;
		justify-content: center;
	}

	.socials a {
		color: #aaa;
		text-decoration: none;
	}

	.socials a:hover {
		color: white;
	}
</style>
