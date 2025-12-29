<script>
	import Section from './Section.svelte';
</script>

<Section>
	<div class="content-wrapper">
		<h2 class="section-title">THE AUTHOR</h2>
		<div class="profile">
			<!-- Placeholder for Author Image -->
			<div class="avatar"></div>
			<div class="info">
				<h3>Jane Doe</h3>
				<p>Sports Tech Visionary</p>
			</div>
		</div>
		<footer class="footer">
			&copy; 2024 The Huddle Concept. All rights reserved.
		</footer>
	</div>
</Section>

<style>
	.content-wrapper {
		text-align: center;
		color: white;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: space-between;
		height: 100%;
		padding: 4rem 0;
	}

	.section-title {
		font-family: 'Oswald', sans-serif;
		font-size: 3rem;
		text-transform: uppercase;
		margin-bottom: 2rem;
	}

	.profile {
		display: flex;
		align-items: center;
		gap: 2rem;
		background: rgba(255, 255, 255, 0.05);
		padding: 2rem;
		border-radius: 100px; /* Pill shape */
	}

	.avatar {
		width: 80px;
		height: 80px;
		background-color: #333;
		border-radius: 50%;
	}

	.info {
		text-align: left;
	}

	h3 {
		font-family: 'Oswald', sans-serif;
		margin: 0;
		font-size: 1.5rem;
		text-transform: uppercase;
	}

	p {
		margin: 0;
		opacity: 0.6;
		font-size: 0.9rem;
	}

	.footer {
		font-size: 0.8rem;
		opacity: 0.3;
		margin-top: auto;
	}
</style>
