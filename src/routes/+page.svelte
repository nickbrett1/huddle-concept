<script>
	import Hero from '$lib/components/Hero.svelte';
	import Section from '$lib/components/Section.svelte';
	import Demo from '$lib/components/Demo.svelte';
</script>

<div class="scroll-container">
	<!-- Section 1: The Hero -->
	<Section id="hero">
		<Hero />
	</Section>

	<!-- Section 2: The Problem -->
	<Section id="problem" title="The Problem">
		<div class="problem-content">
			<h3 class="angle">88% of us watch with a second screen, but we've never felt more alone.</h3>

			<div class="barriers-grid">
				<div class="barrier-card">
					<h4>1. The Jargon Wall</h4>
					<p>Terms like "Safety," "Nickel Defense," and "RBI" act as gatekeepers.</p>
				</div>
				<div class="barrier-card">
					<h4>2. The Context Gap</h4>
					<p>If you didn't grow up with the sport, you miss the 20-year rivalries and human drama that make the game "sticky."</p>
				</div>
			</div>

			<p class="copy-highlight">"Traditional broadcasts are built for the expert. We built something for the fan."</p>
		</div>
	</Section>

	<!-- Section 3: The Interactive Demo -->
	<Section id="demo" title="The Interactive Demo">
		<div class="demo-section-content">
			<div class="developer-label">Developer Showcase: Live Svelte Component</div>
			<Demo />
		</div>
	</Section>

	<!-- Section 4: The Engine -->
	<Section id="engine" title="The Engine">
		<div class="engine-layout">
			<div class="diagram">
				<div class="node ingestion">
					<h5>The Ingestion</h5>
					<p>Real-time data feeds (Sportradar/WebSocket)</p>
				</div>
				<div class="arrow">↓</div>
				<div class="node logic">
					<h5>The Drama Meter</h5>
					<p>Calculating tension using "Win Probability" swings</p>
					<hr/>
					<h5>The Adaptation Agent</h5>
					<p>User Profile Vector adjusting analogies (e.g. UK Expat)</p>
				</div>
			</div>
			<div class="dev-note">
				<strong>Developer Note:</strong> Uses Server-Sent Events (SSE) for low-latency, battery-efficient streaming.
			</div>
		</div>
	</Section>

	<!-- Section 5: The Opportunity -->
	<Section id="opportunity" title="The Opportunity">
		<div class="opportunity-list">
			<div class="opp-item">
				<h4>Reclaiming Attention</h4>
				<p>Keeping the "Second Screen" inside the Fox ecosystem.</p>
			</div>
			<div class="opp-item">
				<h4>Closing the Loop</h4>
				<p>Shoppable TV. When the app knows you're watching a Nike ad or a specific player, it serves a one-tap purchase link.</p>
			</div>
			<div class="opp-item">
				<h4>Demographic Bridge</h4>
				<p>Onboarding the "unreachable" Gen Z and international audiences.</p>
			</div>
		</div>
	</Section>

	<!-- Section 6: The Author -->
	<Section id="author" title="The Author">
		<div class="author-profile">
			<div class="profile-card">
				<h4>Nick — Software Engineer</h4>
				<p class="story">
					"I moved from the UK to New York and realized I was missing out on the biggest cultural conversations in the US. I built this concept to solve my own problem using the same low-latency engineering I use in Finance."
				</p>
				<a href="https://www.google.com/search?q=fintechnick.com" class="profile-link" target="_blank" rel="noreferrer">Back to fintechnick.com</a>
			</div>
		</div>
	</Section>

	<!-- Section 7: The Footer -->
	<footer class="footer-section">
		<h2>Let's evolve the broadcast together.</h2>
		<div class="form-container">
			<input type="email" placeholder="Interested in a prototype demo? Drop your email." />
			<button>Connect</button>
		</div>
		<div class="social-links">
			<a href="#">LinkedIn</a>
			<a href="#">GitHub</a>
		</div>
	</footer>
</div>

<style :global>
	@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&display=swap');

	:global(body) {
		margin: 0;
		padding: 0;
		background-color: #0f1115;
		color: white;
		font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
		overflow: hidden;
	}

	:global(h1, h2, h3, h4, h5, h6) {
		font-family: 'Oswald', 'Impact', sans-serif;
		text-transform: uppercase;
	}

	.scroll-container {
		height: 100vh;
		overflow-y: scroll;
		scroll-snap-type: y mandatory;
		scroll-behavior: smooth;
	}

	/* Section Styling */
	.problem-content, .demo-section-content, .engine-layout, .opportunity-list, .author-profile {
		text-align: center;
		max-width: 900px;
		margin: 0 auto;
	}

	/* Problem */
	.angle {
		font-size: 2rem;
		margin-bottom: 3rem;
		color: #e91e63;
	}
	.barriers-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 2rem;
		margin-bottom: 3rem;
	}
	.barrier-card {
		background: rgba(255,255,255,0.05);
		padding: 2rem;
		border-radius: 8px;
		border: 1px solid rgba(255,255,255,0.1);
	}
	.barrier-card h4 {
		color: #00afea;
		font-size: 1.5rem;
		margin-bottom: 1rem;
	}
	.copy-highlight {
		font-size: 1.5rem;
		font-style: italic;
		color: #ccc;
		border-left: 4px solid #00afea;
		padding-left: 1rem;
		display: inline-block;
	}

	/* Demo */
	.developer-label {
		font-family: monospace;
		color: #00afea;
		margin-bottom: 1rem;
		opacity: 0.7;
	}

	/* Engine */
	.diagram {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 1rem;
		margin-bottom: 2rem;
	}
	.node {
		background: rgba(0, 175, 234, 0.1);
		border: 1px solid #00afea;
		padding: 1.5rem;
		border-radius: 8px;
		width: 100%;
		max-width: 500px;
	}
	.node h5 {
		color: #00afea;
		margin-bottom: 0.5rem;
		font-size: 1.2rem;
	}
	.node p {
		margin: 0;
		font-size: 0.9rem;
	}
	.arrow {
		font-size: 2rem;
		color: #00afea;
	}
	.dev-note {
		font-family: monospace;
		background: rgba(255, 255, 255, 0.1);
		padding: 1rem;
		border-radius: 4px;
		display: inline-block;
		font-size: 0.9rem;
	}

	/* Opportunity */
	.opportunity-list {
		display: flex;
		flex-direction: column;
		gap: 2rem;
		text-align: left;
	}
	.opp-item h4 {
		font-size: 1.8rem;
		color: white;
		margin-bottom: 0.5rem;
	}
	.opp-item p {
		font-size: 1.1rem;
		color: #aaa;
		margin: 0;
	}

	/* Author */
	.profile-card {
		background: rgba(255,255,255,0.05);
		padding: 3rem;
		border-radius: 12px;
		border-left: 5px solid #00afea;
		text-align: left;
	}
	.story {
		font-size: 1.3rem;
		font-style: italic;
		line-height: 1.6;
		margin: 1.5rem 0;
	}
	.profile-link {
		color: #00afea;
		text-decoration: none;
		text-transform: uppercase;
		font-weight: bold;
		letter-spacing: 1px;
	}

	/* Footer */
	.footer-section {
		height: 100vh;
		scroll-snap-align: start;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		text-align: center;
		padding: 2rem;
		background: linear-gradient(to top, rgba(0,175,234,0.1), transparent);
	}
	.footer-section h2 {
		font-size: 3rem;
		margin-bottom: 2rem;
	}
	.form-container {
		display: flex;
		gap: 1rem;
		margin-bottom: 2rem;
		width: 100%;
		max-width: 500px;
	}
	.form-container input {
		flex: 1;
		padding: 1rem;
		border-radius: 4px;
		border: 1px solid #333;
		background: rgba(255,255,255,0.1);
		color: white;
	}
	.form-container button {
		padding: 1rem 2rem;
		background: #00afea;
		border: none;
		border-radius: 4px;
		font-weight: bold;
		cursor: pointer;
		color: black;
		text-transform: uppercase;
	}
	.social-links {
		display: flex;
		gap: 2rem;
	}
	.social-links a {
		color: rgba(255,255,255,0.5);
		text-decoration: none;
		text-transform: uppercase;
		font-size: 0.9rem;
	}

	@media (max-width: 768px) {
		.barriers-grid {
			grid-template-columns: 1fr;
		}
		.form-container {
			flex-direction: column;
		}
	}
</style>
