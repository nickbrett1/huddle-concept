<script>
	import Section from './Section.svelte';
	let { id = "problem" } = $props();
</script>

<Section {id}>
	<div class="content-wrapper">
		<h2 class="section-title">THE PROBLEM</h2>
		<p class="subtitle">THE DISCONNECT</p>

		<p class="section-text">
			"88% of us use a second screen while watching, yet most of us are still locked out of the story."
		</p>

		<div class="cards-container">
			<div class="card">
				<div class="card-content">
					<h3>The Jargon Wall</h3>
					<p>Terms like "Safety," "Nickel Defense," and "RBI" act as gatekeepers.</p>
				</div>
				<div class="card-icon">
					<!-- Wall Icon -->
					<svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						<rect x="4" y="4" width="16" height="16" rx="2" ry="2"></rect>
						<line x1="4" y1="10" x2="20" y2="10"></line>
						<line x1="10" y1="4" x2="10" y2="10"></line>
						<line x1="14" y1="10" x2="14" y2="20"></line>
					</svg>
				</div>
			</div>

			<div class="card">
				<div class="card-content">
					<h3>The Context Gap</h3>
					<p>If you didn't grow up with the sport, you miss the 20-year rivalries and human drama that make the game "sticky."</p>
				</div>
				<div class="card-icon">
					<!-- Gap/Missing Link Icon -->
					<svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						<path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path>
						<path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path>
					</svg>
				</div>
			</div>

			<div class="card">
				<div class="card-content">
					<h3>The Insight Void</h3>
					<p>Existing second-screen apps prioritize betting and raw stats, offering no resource to explain the game and draw you back into the action on your terms.</p>
				</div>
				<div class="card-icon">
					<!-- Insight Void / Disconnect Icon (Wifi Off) -->
					<svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						<line x1="1" y1="1" x2="23" y2="23"></line>
						<path d="M16.72 11.06A10.94 10.94 0 0 1 19 12.55"></path>
						<path d="M5 12.55a10.94 10.94 0 0 1 5.17-2.39"></path>
						<path d="M10.71 5.05A16 16 0 0 1 22.58 9"></path>
						<path d="M1.42 9a15.91 15.91 0 0 1 4.7-2.88"></path>
						<path d="M8.53 16.11a6 6 0 0 1 6.95 0"></path>
						<line x1="12" y1="20" x2="12.01" y2="20"></line>
					</svg>
				</div>
			</div>
		</div>
	</div>
</Section>

<style>
	.content-wrapper {
		text-align: center;
		color: white;
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		height: 100%; /* Use full height for flex distribution */
		justify-content: center;
	}

	.section-title {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(2.5rem, 5vw, 4rem); /* Slightly smaller clamp */
		font-weight: 700;
		text-transform: uppercase;
		margin-bottom: 0.2rem; /* Reduced */
		color: white;
		line-height: 1;
	}

	.subtitle {
		font-family: 'Oswald', sans-serif;
		font-size: 1.2rem; /* Reduced */
		color: #00afea;
		letter-spacing: 0.2em;
		margin-bottom: 1.5rem; /* Reduced */
		text-transform: uppercase;
	}

	.section-text {
		font-size: clamp(1rem, 1.5vw, 1.5rem); /* Slightly smaller */
		font-weight: 300;
		line-height: 1.4;
		margin-bottom: 2rem; /* Reduced from 4rem */
		max-width: 800px;
		font-style: italic;
	}

	.cards-container {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Increased min-width slightly */
		gap: 1rem; /* Reduced gap */
		width: 100%;
		max-width: 1150px;
	}

	.card {
		background: linear-gradient(145deg, rgba(255,255,255,0.05) 0%, rgba(255,255,255,0.02) 100%);
		border: 1px solid rgba(255, 255, 255, 0.1);
		padding: 1.5rem; /* Reduced padding */
		text-align: left;
		display: flex;
		flex-direction: row; /* Horizontal layout */
		align-items: center; /* Center vertically */
		justify-content: space-between;
		gap: 1rem;
		transition: transform 0.3s ease, border-color 0.3s ease;
	}

	.card:hover {
		transform: translateY(-5px);
		border-color: #00afea;
	}

	.card-content {
		display: flex;
		flex-direction: column;
		gap: 0.25rem;
		flex: 1;
	}

	.card-icon {
		color: #00afea;
		flex-shrink: 0;
	}

	h3 {
		font-family: 'Oswald', sans-serif;
		font-size: 1.3rem; /* Slightly reduced */
		margin: 0;
		text-transform: uppercase;
		font-weight: 600;
	}

	p {
		margin: 0;
		opacity: 0.8;
		font-size: 0.95rem; /* Slightly reduced */
		line-height: 1.4;
	}
</style>
