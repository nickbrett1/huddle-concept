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
				<div class="card-header">
					<div class="card-icon">
						<!-- Wall Icon -->
						<svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
							<rect width="18" height="18" x="3" y="3" rx="2"></rect>
							<path d="M3 9h18"></path>
							<path d="M3 15h18"></path>
							<path d="M9 3v6"></path>
							<path d="M15 3v6"></path>
							<path d="M11 9v6"></path>
							<path d="M7 15v6"></path>
							<path d="M14 15v6"></path>
						</svg>
					</div>
					<h3>The Jargon Wall</h3>
				</div>
				<p>Terms like "Safety," "Nickel Defense," and "RBI" act as gatekeepers.</p>
			</div>

			<div class="card">
				<div class="card-header">
					<div class="card-icon">
						<!-- Story Book Icon -->
						<svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
							<path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
							<path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
						</svg>
					</div>
					<h3>The Story Gap</h3>
				</div>
				<p>If you didn't grow up with the sport, you miss the 20-year rivalries and human drama that make the game "sticky."</p>
			</div>

			<div class="card">
				<div class="card-header">
					<div class="card-icon">
						<!-- App Store / Grid Icon -->
						<svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
							<rect width="7" height="7" x="3" y="3" rx="1"></rect>
							<rect width="7" height="7" x="14" y="3" rx="1"></rect>
							<rect width="7" height="7" x="14" y="14" rx="1"></rect>
							<rect width="7" height="7" x="3" y="14" rx="1"></rect>
						</svg>
					</div>
					<h3>The App Absence</h3>
				</div>
				<p>Existing second-screen apps prioritize betting and raw stats, offering little resource to explain the game and draw you back into the action on your terms.</p>
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
		grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); /* Slightly smaller min */
		gap: 1.5rem; /* Reduced gap */
		width: 100%;
		max-width: 1150px; /* Increased to fit 3 cards */
	}

	.card {
		background: linear-gradient(145deg, rgba(255,255,255,0.05) 0%, rgba(255,255,255,0.02) 100%);
		border: 1px solid rgba(255, 255, 255, 0.1);
		padding: 2rem 1.5rem; /* Reduced padding */
		text-align: left;
		display: flex;
		flex-direction: column;
		gap: 0.5rem; /* Reduced gap */
		transition: transform 0.3s ease, border-color 0.3s ease;
	}

	.card:hover {
		transform: translateY(-5px);
		border-color: #00afea;
	}

	.card-header {
		display: contents;
	}

	.card-icon {
		color: #00afea;
		margin-bottom: 0.5rem;
	}

	h3 {
		font-family: 'Oswald', sans-serif;
		font-size: 1.5rem; /* Reduced */
		margin: 0;
		text-transform: uppercase;
		font-weight: 600;
	}

	p {
		margin: 0;
		opacity: 0.8;
		font-size: 1rem; /* Reduced */
		line-height: 1.5;
	}

	@media (max-width: 768px) {
		.card-header {
			display: flex;
			flex-direction: row;
			justify-content: space-between;
			align-items: center;
			width: 100%;
			margin-bottom: 0.5rem;
		}

		.card-header h3 {
			flex: 1;
			order: 1;
		}

		.card-header .card-icon {
			order: 2;
			margin-bottom: 0;
			margin-left: 1rem;
		}
	}
</style>
