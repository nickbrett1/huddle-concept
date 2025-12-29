<script>
	let messages = [
		{
			role: 'AI',
			text: "Notice the defensive formation here. They're showing a Cover 2 shell, anticipating a pass."
		},
		{
			role: 'AI',
			text: 'Watch the linebacker fake the blitz. He drops back into coverage at the last second, confusing the QB.'
		},
		{
			role: 'AI',
			text: "That hesitation gives the defensive end just enough time to break through the line. SACK! That's the game right there."
		}
	];
</script>

<section class="hero">
	<div class="video-container">
		<!-- Placeholder video since I cannot browse for a direct MP4 link easily without browser access.
             Using a solid color background with text for now, or a generic placeholder if available. -->
        <video autoplay loop muted playsinline poster="https://placehold.co/1920x1080/0f1115/00afea?text=American+Football+Play">
            <!-- Ideally this would be a real video source -->
             <source src="https://videos.pexels.com/video-files/5377508/5377508-uhd_2732_1440_25fps.mp4" type="video/mp4">
             Your browser does not support the video tag.
        </video>
        <div class="overlay"></div>
	</div>

	<div class="content">
		<h1>GAME TIME <span class="highlight">INSIGHTS</span></h1>

		<div class="chat-interface">
			<div class="chat-header">
				<div class="status-dot"></div>
				<span>HUDDLE AI COMPANION</span>
			</div>
			<div class="messages">
				{#each messages as msg}
					<div class="message">
						<span class="role">{msg.role}</span>
						<p>{msg.text}</p>
					</div>
				{/each}
			</div>
		</div>
	</div>
</section>

<style>
	.hero {
		position: relative;
		height: 100vh;
		width: 100%;
		overflow: hidden;
		display: flex;
		align-items: center;
		justify-content: center;
		color: white;
		font-family: 'Impact', sans-serif;
	}

	.video-container {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 0;
	}

	video {
		width: 100%;
		height: 100%;
		object-fit: cover;
	}

    .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(15, 17, 21, 0.7); /* Darken the video */
        z-index: 1;
    }

	.content {
		position: relative;
		z-index: 2;
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 100%;
		max-width: 1200px;
		padding: 2rem;
	}

	h1 {
		font-size: 4rem;
		text-transform: uppercase;
		margin-bottom: 2rem;
		text-shadow: 0 0 20px rgba(0, 175, 234, 0.5);
        text-align: center;
        letter-spacing: 2px;
	}

	.highlight {
		color: #00afea;
	}

	.chat-interface {
		background: rgba(15, 17, 21, 0.9);
		border: 2px solid #00afea;
		border-radius: 8px;
		padding: 1.5rem;
		width: 100%;
		max-width: 600px;
		box-shadow: 0 0 30px rgba(0, 175, 234, 0.2);
	}

	.chat-header {
		display: flex;
		align-items: center;
		gap: 0.5rem;
		margin-bottom: 1rem;
		border-bottom: 1px solid rgba(255, 255, 255, 0.1);
		padding-bottom: 0.5rem;
		font-family: sans-serif;
		font-weight: bold;
		font-size: 0.9rem;
		letter-spacing: 1px;
	}

	.status-dot {
		width: 8px;
		height: 8px;
		background-color: #00afea;
		border-radius: 50%;
		box-shadow: 0 0 10px #00afea;
		animation: pulse 2s infinite;
	}

	.messages {
		display: flex;
		flex-direction: column;
		gap: 1rem;
	}

	.message {
		display: flex;
		flex-direction: column;
		gap: 0.25rem;
        animation: fadeIn 0.5s ease-out forwards;
	}

	.role {
		color: #00afea;
		font-size: 0.8rem;
		font-weight: bold;
		font-family: sans-serif;
	}

	.message p {
		font-family: sans-serif;
		line-height: 1.5;
		margin: 0;
        font-size: 1.1rem;
	}

	@keyframes pulse {
		0% { opacity: 1; }
		50% { opacity: 0.5; }
		100% { opacity: 1; }
	}

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        h1 {
            font-size: 2.5rem;
        }

        .chat-interface {
            width: 90%;
        }
    }
</style>
