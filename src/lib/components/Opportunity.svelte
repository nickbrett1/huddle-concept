<script>
	import Section from './Section.svelte';
	let { id = "opportunity" } = $props();
</script>

<Section {id}>
	<div class="content-wrapper">
		<h2 class="section-title">THE OPPORTUNITY</h2>
		<p class="subtitle">WHY A BROADCASTER SHOULD CARE</p>

		<div class="cards-container">
			<div class="card">
				<div class="card-header">
					<div class="card-icon">
						<!-- Magnet Icon -->
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
							<path d="m12 15 4 4" />
							<path d="M2.352 10.648a1.205 1.205 0 0 0 0 1.704l2.296 2.296a1.205 1.205 0 0 0 1.704 0l6.029-6.029a1 1 0 1 1 3 3l-6.029 6.029a1.205 1.205 0 0 0 0 1.704l2.296 2.296a1.205 1.205 0 0 0 1.704 0l6.365-6.367A1 1 0 0 0 8.716 4.282z" />
							<path d="m5 8 4 4" />
						</svg>
					</div>
					<h3>Reclaiming Attention</h3>
				</div>
				<p>Keeping the "Second Screen" inside the broadcaster ecosystem.</p>
			</div>

			<div class="card">
				<div class="card-header">
					<div class="card-icon">
						<!-- Shopping Bag Icon -->
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
							<path d="M16 10a4 4 0 0 1-8 0" />
							<path d="M3.103 6.034h17.794" />
							<path d="M3.4 5.467a2 2 0 0 0-.4 1.2V20a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6.667a2 2 0 0 0-.4-1.2l-2-2.667A2 2 0 0 0 17 2H7a2 2 0 0 0-1.6.8z" />
						</svg>
					</div>
					<h3>Closing the Loop</h3>
				</div>
				<p>Shoppable TV. When the app knows you're watching a Nike ad or a specific player, it serves a one-tap purchase link.</p>
			</div>

			<div class="card">
				<div class="card-header">
					<div class="card-icon">
						<!-- Globe Icon -->
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
							<circle cx="12" cy="12" r="10" />
							<path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20" />
							<path d="M2 12h20" />
						</svg>
					</div>
					<h3>Demographic Bridge</h3>
				</div>
				<p>Onboarding the "unreachable" Gen Z and international audiences.</p>
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
		height: 100%;
		justify-content: center;
	}

	.section-title {
		font-family: 'Oswald', sans-serif;
		font-size: clamp(2.5rem, 5vw, 4rem);
		font-weight: 700;
		text-transform: uppercase;
		margin-bottom: 0.2rem;
		color: white;
		line-height: 1;
	}

	.subtitle {
		font-size: clamp(1rem, 2vw, 1.5rem);
		font-weight: 400;
		color: #FFFFFF;
		margin: 0 0 3rem 0;
		text-transform: uppercase;
		letter-spacing: 0.1em;
	}

	.cards-container {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
		gap: 1.5rem;
		width: 100%;
		max-width: 1150px;
	}

	.card {
		background: linear-gradient(145deg, rgba(255,255,255,0.05) 0%, rgba(255,255,255,0.02) 100%);
		border: 1px solid rgba(255, 255, 255, 0.1);
		padding: 2rem 1.5rem;
		text-align: left;
		display: flex;
		flex-direction: column;
		gap: 0.5rem;
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
		font-size: 1.5rem;
		margin: 0;
		text-transform: uppercase;
		font-weight: 600;
	}

	p {
		margin: 0;
		opacity: 0.8;
		font-size: 1rem;
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
