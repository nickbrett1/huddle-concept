<script>
	import { onMount } from 'svelte';

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

    let visibleMessages = $state([]);

    // Simulate typing/revealing effect
    onMount(() => {
        let i = 0;
        const interval = setInterval(() => {
            if (i < messages.length) {
                visibleMessages = [...visibleMessages, messages[i]];
                i++;
            } else {
                clearInterval(interval);
            }
        }, 2500); // New message every 2.5 seconds

        return () => clearInterval(interval);
    });

    function scrollToExplore() {
        const nextSection = document.getElementById('problem');
        if (nextSection) nextSection.scrollIntoView({ behavior: 'smooth' });
    }
</script>

<div class="hero-layout">
	<div class="video-side">
        <div class="video-wrapper">
            <video autoplay loop muted playsinline poster="https://placehold.co/800x600/0f1115/00afea?text=Football+Play">
                <source src="https://videos.pexels.com/video-files/5377508/5377508-uhd_2732_1440_25fps.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
            <div class="live-badge">LIVE ANALYSIS</div>
        </div>
	</div>

	<div class="info-side">
		<h1>The Huddle: Decoding the game into the stories you'll love.</h1>
        <p class="subheadline">
            Bringing the "Drive to Survive" effect to every American sport. An AI-powered personal companion that translates jargon into drama and stats into stories.
        </p>

        <button onclick={scrollToExplore} class="cta-button">Scroll to Explore the Concept</button>

		<div class="chat-interface">
			<div class="chat-header">
				<div class="status-dot"></div>
				<span>HUDDLE AI COMPANION</span>
			</div>
			<div class="messages">
				{#each visibleMessages as msg}
					<div class="message">
						<span class="role">{msg.role}</span>
						<p>{msg.text}</p>
					</div>
				{/each}
                {#if visibleMessages.length < messages.length}
                    <div class="typing-indicator">
                        <span>.</span><span>.</span><span>.</span>
                    </div>
                {/if}
			</div>
		</div>
	</div>
</div>

<style>
	.hero-layout {
		display: grid;
		grid-template-columns: 1fr;
		gap: 2rem;
		width: 100%;
		height: 100%;
        align-items: center;
	}

    @media (min-width: 900px) {
        .hero-layout {
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
        }
    }

	/* Video Side */
	.video-side {
		width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
	}

    .video-wrapper {
        position: relative;
        width: 100%;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 0 40px rgba(0, 175, 234, 0.15);
        border: 1px solid rgba(0, 175, 234, 0.3);
        aspect-ratio: 16/9;
    }

	video {
		width: 100%;
		height: 100%;
		object-fit: cover;
        display: block;
	}

    .live-badge {
        position: absolute;
        top: 1rem;
        left: 1rem;
        background: #e91e63;
        color: white;
        padding: 0.25rem 0.75rem;
        font-weight: bold;
        font-size: 0.8rem;
        border-radius: 4px;
        font-family: sans-serif;
        box-shadow: 0 2px 4px rgba(0,0,0,0.3);
    }

	/* Info Side */
	.info-side {
		display: flex;
		flex-direction: column;
		justify-content: center;
        text-align: left;
	}

	h1 {
		font-size: 2.5rem;
        line-height: 1.1;
		text-transform: uppercase;
		margin-bottom: 1.5rem;
		text-shadow: 0 0 20px rgba(0, 175, 234, 0.3);
        letter-spacing: 1px;
	}

    .subheadline {
        font-size: 1.2rem;
        color: #ccc;
        margin-bottom: 2rem;
        line-height: 1.5;
        font-family: sans-serif;
    }

    .cta-button {
        background-color: #00afea;
        color: black;
        border: none;
        padding: 1rem 2rem;
        font-size: 1rem;
        font-weight: bold;
        text-transform: uppercase;
        border-radius: 4px;
        cursor: pointer;
        align-self: flex-start;
        margin-bottom: 2rem;
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .cta-button:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 20px rgba(0, 175, 234, 0.4);
    }

	.chat-interface {
		background: rgba(15, 17, 21, 0.5);
		border: 1px solid rgba(0, 175, 234, 0.5);
		border-radius: 8px;
		padding: 1.5rem;
		width: 100%;
        box-sizing: border-box;
        height: 300px;
        display: flex;
        flex-direction: column;
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
		font-size: 0.8rem;
		letter-spacing: 1px;
        flex-shrink: 0;
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
        overflow-y: auto;
        flex-grow: 1;
        padding-right: 0.5rem;
	}

    /* Scrollbar styling */
    .messages::-webkit-scrollbar {
        width: 6px;
    }
    .messages::-webkit-scrollbar-track {
        background: rgba(255,255,255,0.05);
    }
    .messages::-webkit-scrollbar-thumb {
        background: rgba(0, 175, 234, 0.3);
        border-radius: 3px;
    }

	.message {
		display: flex;
		flex-direction: column;
		gap: 0.25rem;
        animation: slideIn 0.3s ease-out forwards;
	}

	.role {
		color: #00afea;
		font-size: 0.75rem;
		font-weight: bold;
		font-family: sans-serif;
	}

	.message p {
		font-family: sans-serif;
		line-height: 1.4;
		margin: 0;
        font-size: 0.95rem;
        color: #e0e0e0;
	}

    .typing-indicator span {
        animation: blink 1.4s infinite both;
        font-size: 2rem;
        line-height: 10px;
        color: #00afea;
    }
    .typing-indicator span:nth-child(2) { animation-delay: 0.2s; }
    .typing-indicator span:nth-child(3) { animation-delay: 0.4s; }

	@keyframes pulse {
		0% { opacity: 1; }
		50% { opacity: 0.5; }
		100% { opacity: 1; }
	}

    @keyframes slideIn {
        from { opacity: 0; transform: translateX(-10px); }
        to { opacity: 1; transform: translateX(0); }
    }

    @keyframes blink {
        0% { opacity: 0.2; }
        20% { opacity: 1; }
        100% { opacity: 0.2; }
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        h1 {
            font-size: 1.8rem;
        }
        .cta-button {
            width: 100%;
        }
    }
</style>
