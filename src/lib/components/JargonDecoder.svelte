<script>
	import { fade } from 'svelte/transition';

    let decoded = $state(false);

    function toggleDecode() {
        decoded = !decoded;
    }
</script>

<div class="decoder-container">
    <div class="card">
        <div class="header">
            <span class="live-indicator">● LIVE</span>
            <span class="game-clock">Q4 0:08</span>
        </div>

        <div class="content-area">
            {#if !decoded}
                <div class="jargon" in:fade={{ duration: 300 }}>
                    <h3>TECHNICAL FEED</h3>
                    <p>"It's a 4th-and-1 in the Red Zone."</p>
                </div>
            {:else}
                <div class="story" in:fade={{ duration: 300 }}>
                    <h3>HUDDLE STORY</h3>
                    <p>"This is the moment of truth. If they don't score now, the season is likely over. The QB is staring down the coach who traded him three years ago."</p>
                </div>
            {/if}
        </div>

        <button onclick={toggleDecode} class="decode-btn">
            {decoded ? 'RESET FEED' : 'DECODE THE DRAMA'}
        </button>
    </div>
</div>

<style>
    .decoder-container {
        width: 100%;
        display: flex;
        justify-content: center;
        margin-top: 2rem;
    }

    .card {
        background: var(--secondary-bg);
        border: 1px solid #333;
        border-radius: 8px;
        padding: 2rem;
        width: 100%;
        max-width: 600px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.5);
    }

    .header {
        display: flex;
        justify-content: space-between;
        margin-bottom: 2rem;
        font-family: var(--font-heading);
        font-size: 1.2rem;
    }

    .live-indicator {
        color: #ff4444;
        animation: pulse 1.5s infinite;
    }

    .content-area {
        min-height: 150px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    h3 {
        color: #666;
        font-size: 0.9rem;
        margin-bottom: 0.5rem;
        letter-spacing: 2px;
    }

    p {
        font-size: 1.5rem;
        line-height: 1.4;
        font-weight: bold;
    }

    .story p {
        color: var(--accent-color);
    }

    .decode-btn {
        width: 100%;
        margin-top: 2rem;
        background: transparent;
        border: 2px solid var(--accent-color);
        color: var(--accent-color);
        padding: 1rem;
        font-size: 1rem;
        letter-spacing: 1px;
        transition: all 0.2s;
    }

    .decode-btn:hover {
        background: var(--accent-color);
        color: var(--bg-color);
    }

    @keyframes pulse {
        0% { opacity: 1; }
        50% { opacity: 0.5; }
        100% { opacity: 1; }
    }
</style>
