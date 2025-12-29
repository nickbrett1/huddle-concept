<script>
	import { fly } from 'svelte/transition';
    /** @type {{ children: import('svelte').Snippet, visible: boolean }} */
	let { children, visible } = $props();
</script>

<section class="section">
	<div class="content">
		{#if visible}
			<div
                in:fly={{ y: 50, duration: 800, delay: 200 }}
                class="animated-wrapper"
            >
                {@render children()}
            </div>
		{/if}
	</div>
</section>

<style>
	.section {
		height: 100vh;
		width: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
		scroll-snap-align: start;
		position: relative;
        padding: 2rem;
	}

    .content {
        max-width: 800px;
        text-align: center;
    }

    /* Style children generically to match the theme */
    .animated-wrapper :global(h1) {
		font-size: 4rem;
		margin-bottom: 1.5rem;
		color: var(--accent-color);
        text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
    }

    .animated-wrapper :global(p) {
        font-size: 1.5rem;
        line-height: 1.6;
        opacity: 0.9;
        margin-bottom: 1rem;
    }

    .animated-wrapper :global(a) {
        color: var(--accent-color);
        text-decoration: none;
        border-bottom: 2px solid transparent;
        transition: border-color 0.3s;
    }

    .animated-wrapper :global(a:hover) {
        border-bottom-color: var(--accent-color);
    }

    .animated-wrapper :global(button) {
        font-size: 2rem;
        padding: 1rem 2rem;
        background: var(--accent-color);
        color: var(--bg-color);
        border: none;
        border-radius: 4px;
        transition: transform 0.2s;
    }

    .animated-wrapper :global(button:hover) {
        transform: scale(1.05);
    }

    .animated-wrapper :global(button:active) {
        transform: scale(0.95);
    }
</style>
