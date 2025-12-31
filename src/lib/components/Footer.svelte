<script>
	import Section from './Section.svelte';
	let { id = "footer" } = $props();
</script>

<Section {id}>
	<div class="content-wrapper">
		<h2 class="section-title">ABOUT</h2>

		<div class="grid">
			<div class="column left-col">
				<div class="card profile">
					<div class="profile-header">
						<img src="/nick-profile.jpg" alt="Nick - Profile" class="profile-pic" />
						<h3>Profile: Nick — Builder and Product Leader</h3>
					</div>
					<p>
						Based in New York, I am a builder and product leader with nearly 20 years of experience designing the data systems that power global platforms. My background spans the full spectrum of the data lifecycle: from defining and building real-time, data-powered applications at Bloomberg LP, to scaling the data infrastructure for Meta’s Messenger—one of the world's largest consumer communication apps—and most recently, architecting the data systems for $60B+ AUM at Two Sigma.
					</p>
				</div>

			</div>

			<div class="column right-col">
				<div class="card story">
					<h3>The Story: The Impact of Personalization</h3>
					<p>
						As a UK native living in the US, I’ve often felt the "context gap" that exists in traditional sports broadcasts. I developed this concept because I saw how transformative new AI technology could be in changing how we experience live events.
					</p>
					<p>
						It isn't just about translating rules; it's about using AI agents to make the game feel accessible, inclusive, and deeply engaging for everyone—whether they are a lifelong strategist or someone tuning in for the very first time. This pitch is a vision for a more connected fan experience, where the technology works behind the scenes to bring people into the heart of the action.
					</p>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="card connect">
				<h3>Connect</h3>
				<ul class="links">
					<li>
						<span class="label">Email:</span>
						<a href="mailto:nick@fintechnick.com">nick@fintechnick.com</a>
					</li>
					<li>
						<span class="label">LinkedIn:</span>
						<a href="https://www.linkedin.com/in/nick-brett?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app" target="_blank" rel="noopener noreferrer">View Professional Profile</a>
					</li>
					<li>
						<span class="label">Personal Portfolio:</span>
						<a href="https://fintechnick.com" target="_blank" rel="noopener noreferrer">fintechnick.com</a>
						<span class="note">(Note: This site is primarily focused on my work in fintech and data engineering applications)</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
</Section>

<style>
	.content-wrapper {
		width: 100%;
		display: flex;
		flex-direction: column;
	}

	.section-title {
		font-family: 'Oswald', sans-serif;
		font-size: 3rem;
		text-transform: uppercase;
		margin-bottom: 2rem;
		text-align: center;
		color: white;
	}

	.footer-bottom {
		margin-top: 3rem;
		text-align: center;
		width: 100%;
		display: flex;
		justify-content: center;
	}

	.footer-bottom .card.connect {
		text-align: center;
	}

	.grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 3rem;
		align-items: start;
	}

	.column {
		display: flex;
		flex-direction: column;
		gap: 2rem;
	}

	.card {
		text-align: left;
	}

	.profile-header {
		display: flex;
		align-items: center;
		gap: 1.5rem;
		margin-bottom: 1rem;
	}

	.profile-pic {
		width: 100px;
		height: 100px;
		border-radius: 50%;
		object-fit: cover;
		border: 2px solid #00afea;
		flex-shrink: 0;
	}

	h3 {
		font-family: 'Oswald', sans-serif;
		font-size: 1.5rem;
		text-transform: uppercase;
		color: #00afea; /* Electric Blue */
		margin-bottom: 1rem;
		margin-top: 0;
	}

	/* Adjust h3 inside profile header to remove bottom margin since header handles it */
	.profile-header h3 {
		margin-bottom: 0;
	}

	p {
		font-size: 1rem;
		line-height: 1.6;
		color: rgba(255, 255, 255, 0.9);
		margin-bottom: 1rem;
	}

	.links {
		list-style: none;
		padding: 0;
		margin: 0;
	}

	.links li {
		margin-bottom: 1rem;
		color: rgba(255, 255, 255, 0.9);
		line-height: 1.5;
	}

	.label {
		font-weight: bold;
		color: white;
	}

	/* Target links specifically to override any global/browser defaults */
	.links a, .links a:visited {
		color: #00afea;
		text-decoration: none;
		transition: color 0.2s;
	}

	.links a:hover {
		text-decoration: underline;
		color: white;
	}

	.note {
		display: block;
		font-size: 0.85rem;
		opacity: 0.7;
		margin-top: 0.2rem;
		font-style: italic;
	}


	@media (max-width: 768px) {
		.grid {
			grid-template-columns: 1fr;
			gap: 2rem;
		}

		.section-title {
			font-size: 2.5rem;
		}
	}
</style>
