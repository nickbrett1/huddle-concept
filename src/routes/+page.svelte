<script>
	import Hero from '$lib/components/Hero.svelte';
	import Section from '$lib/components/Section.svelte';
</script>

<div class="scroll-container">
	<!-- Hero Section -->
	<Section id="hero">
		<Hero />
	</Section>

	<!-- Problem Section -->
	<Section id="problem" title="The Problem">
		<div class="problem-layout">
			<div class="problem-text">
				<h3>The Jargon Barrier</h3>
				<p>"Cover 2", "Spider 2 Y Banana", "RPO"...</p>
				<p>The game is faster than ever, but the commentary assumes you already have a PhD in football.</p>
			</div>
            <div class="problem-visual">
                <div class="confused-fan">
                    <span>?</span>
                </div>
            </div>
		</div>
	</Section>

	<!-- Interactive Demo Section -->
	<Section id="demo" title="Interactive Demo">
		<div class="demo-mockup">
            <div class="mock-header">Jargon Decoder</div>
            <div class="mock-body">
                <div class="mock-input">
                    <span class="label">Input Commentary:</span>
                    <div class="input-box">"The Mike linebacker is showing blitz..."</div>
                </div>
                <div class="mock-arrow">⬇️</div>
                <div class="mock-output">
                    <span class="label">Translated:</span>
                    <div class="output-box">The middle linebacker is pretending to rush the quarterback to trick the offense.</div>
                </div>
            </div>
            <div class="mock-footer">
                <button class="mock-btn">Try it Live</button>
            </div>
		</div>
	</Section>

	<!-- Engine Section -->
	<Section id="engine" title="The Engine">
		<div class="engine-grid">
            <div class="engine-card">
                <h4>LLM Core</h4>
                <p>Fine-tuned on 10,000+ hours of game commentary.</p>
            </div>
            <div class="engine-card">
                <h4>Real-time API</h4>
                <p>Sub-second latency sync with live broadcast feeds.</p>
            </div>
            <div class="engine-card">
                <h4>Context Engine</h4>
                <p>Aware of player stats, history, and game situation.</p>
            </div>
        </div>
	</Section>

	<!-- Opportunity Section -->
	<Section id="opportunity" title="The Opportunity">
		<div class="opportunity-content">
            <div class="stat-big">120M</div>
            <p>Casual fans who feel alienated by technical commentary.</p>
            <div class="growth-arrow">↗</div>
		</div>
	</Section>

	<!-- Author Section -->
	<Section id="author" title="About the Team">
		<div class="author-card">
            <div class="avatar"></div>
            <div class="author-info">
                <h4>The Huddle Team</h4>
                <p>Engineers & Sports Fanatics</p>
            </div>
		</div>
	</Section>

	<!-- Footer Section -->
	<footer class="footer">
		<p>&copy; 2024 Huddle Concept. All rights reserved.</p>
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

	.footer {
		padding: 2rem;
		text-align: center;
		color: rgba(255, 255, 255, 0.5);
		font-size: 0.8rem;
		scroll-snap-align: end;
	}

    /* Problem Section */
    .problem-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 2rem;
        align-items: center;
    }
    .problem-text h3 {
        font-size: 2rem;
        color: #e91e63;
        margin-bottom: 1rem;
    }
    .problem-text p {
        font-size: 1.2rem;
        line-height: 1.6;
        color: #ccc;
    }
    .problem-visual {
        display: flex;
        justify-content: center;
    }
    .confused-fan {
        width: 150px;
        height: 150px;
        border: 4px solid #e91e63;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 4rem;
        color: #e91e63;
        font-family: 'Impact', sans-serif;
    }

    /* Demo Section */
    .demo-mockup {
        border: 1px solid #00afea;
        background: rgba(0, 175, 234, 0.05);
        border-radius: 8px;
        padding: 2rem;
        width: 100%;
        max-width: 800px;
        margin: 0 auto;
    }
    .mock-header {
        font-family: 'Oswald', sans-serif;
        color: #00afea;
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
        border-bottom: 1px solid rgba(0, 175, 234, 0.3);
        padding-bottom: 0.5rem;
    }
    .mock-body {
        display: flex;
        flex-direction: column;
        gap: 1.5rem;
    }
    .mock-input, .mock-output {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }
    .label {
        font-size: 0.9rem;
        color: #aaa;
    }
    .input-box {
        background: rgba(255,255,255,0.1);
        padding: 1rem;
        border-radius: 4px;
        font-family: monospace;
        border-left: 3px solid #ccc;
    }
    .output-box {
        background: rgba(0, 175, 234, 0.1);
        padding: 1rem;
        border-radius: 4px;
        color: white;
        border-left: 3px solid #00afea;
    }
    .mock-arrow {
        text-align: center;
        font-size: 1.5rem;
        color: #00afea;
    }
    .mock-footer {
        margin-top: 2rem;
        text-align: right;
    }
    .mock-btn {
        background: #00afea;
        color: black;
        border: none;
        padding: 0.75rem 1.5rem;
        font-weight: bold;
        text-transform: uppercase;
        cursor: pointer;
        border-radius: 4px;
    }

    /* Engine Section */
    .engine-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 2rem;
    }
    .engine-card {
        background: rgba(255,255,255,0.03);
        border: 1px solid rgba(255,255,255,0.1);
        padding: 2rem;
        border-radius: 8px;
        text-align: center;
        transition: transform 0.2s;
    }
    .engine-card:hover {
        transform: translateY(-5px);
        border-color: #00afea;
    }
    .engine-card h4 {
        color: #00afea;
        font-size: 1.5rem;
        margin-bottom: 1rem;
    }

    /* Opportunity Section */
    .opportunity-content {
        text-align: center;
    }
    .stat-big {
        font-size: 8rem;
        font-family: 'Oswald', sans-serif;
        color: white;
        text-shadow: 0 0 30px rgba(255,255,255,0.2);
        line-height: 1;
    }
    .opportunity-content p {
        font-size: 1.5rem;
        color: #aaa;
        max-width: 600px;
        margin: 0 auto;
    }
    .growth-arrow {
        font-size: 4rem;
        color: #4caf50;
        margin-top: 1rem;
    }

    /* Author Section */
    .author-card {
        display: flex;
        align-items: center;
        gap: 2rem;
        background: rgba(255,255,255,0.05);
        padding: 2rem;
        border-radius: 12px;
        max-width: 500px;
        margin: 0 auto;
    }
    .avatar {
        width: 80px;
        height: 80px;
        background: #00afea;
        border-radius: 50%;
    }
    .author-info h4 {
        margin: 0;
        font-size: 1.5rem;
    }
    .author-info p {
        margin: 0.5rem 0 0 0;
        color: #aaa;
    }

    @media (max-width: 768px) {
        .problem-layout {
            grid-template-columns: 1fr;
            text-align: center;
        }
        .stat-big {
            font-size: 5rem;
        }
    }
</style>
