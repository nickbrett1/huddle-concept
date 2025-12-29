<script>
	let showStory = $state(false);

	function toggle() {
		showStory = !showStory;
	}
</script>

<div class="demo-wrapper">
	<div class="demo-header">
		<div class="header-text">LIVE PLAY FEED</div>
		<div class="live-indicator">● LIVE</div>
	</div>

	<div class="demo-content">
		{#if !showStory}
			<div class="jargon-view">
				<p class="jargon-text">"It's a 4th-and-1 in the Red Zone..."</p>
			</div>
		{:else}
			<div class="story-view">
				<p class="story-text">"This is the moment of truth. If they don't score now, the season is likely over. The QB is staring down the coach who traded him three years ago."</p>
			</div>
		{/if}
	</div>

	<div class="demo-controls">
		<button class="decode-btn" onclick={toggle}>
			{showStory ? 'Show Original Feed' : 'Decode the Drama'}
		</button>
	</div>
</div>

<style>
	.demo-wrapper {
		width: 100%;
		max-width: 800px;
		margin: 0 auto;
		background: rgba(15, 17, 21, 0.8);
		border: 1px solid #00afea;
		border-radius: 12px;
		overflow: hidden;
		box-shadow: 0 0 30px rgba(0, 175, 234, 0.1);
	}

	.demo-header {
		background: rgba(0, 175, 234, 0.1);
		padding: 1rem 1.5rem;
		display: flex;
		justify-content: space-between;
		align-items: center;
		border-bottom: 1px solid rgba(0, 175, 234, 0.2);
	}

	.header-text {
		color: #00afea;
		font-family: 'Oswald', sans-serif;
		font-weight: bold;
		letter-spacing: 1px;
	}

	.live-indicator {
		color: #e91e63;
		font-weight: bold;
		font-size: 0.8rem;
		animation: pulse 2s infinite;
	}

	.demo-content {
		padding: 3rem 2rem;
		min-height: 150px;
		display: flex;
		align-items: center;
		justify-content: center;
		text-align: center;
	}

	.jargon-text {
		font-family: monospace;
		font-size: 1.5rem;
		color: #ccc;
		border-left: 4px solid #ccc;
		padding-left: 1rem;
	}

	.story-text {
		font-family: 'Oswald', sans-serif;
		font-size: 1.8rem;
		color: white;
		line-height: 1.4;
		border-left: 4px solid #00afea;
		padding-left: 1rem;
		animation: fadeIn 0.5s ease-out;
	}

	.demo-controls {
		padding: 1.5rem;
		background: rgba(0, 0, 0, 0.2);
		text-align: center;
	}

	.decode-btn {
		background: #00afea;
		color: black;
		border: none;
		padding: 1rem 2rem;
		font-size: 1.1rem;
		font-weight: bold;
		text-transform: uppercase;
		border-radius: 4px;
		cursor: pointer;
		transition: all 0.2s;
	}

	.decode-btn:hover {
		transform: scale(1.05);
		box-shadow: 0 0 20px rgba(0, 175, 234, 0.4);
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
</style>
