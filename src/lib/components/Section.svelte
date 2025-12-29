<script>
	import { fly } from 'svelte/transition';
    /** @type {{ title: string, content: string, index: number, visible: boolean }} */
	let { title, content, index, visible } = $props();
</script>

<section class="section">
	<div class="content">
		{#if visible}
			<h2
                in:fly={{ y: 50, duration: 800, delay: 200 }}
                class="title"
            >
                {title}
            </h2>
			<div
                in:fly={{ y: 50, duration: 800, delay: 400 }}
                class="body-text"
            >
                {content}
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

	.title {
		font-size: 4rem;
		margin-bottom: 1.5rem;
		color: var(--accent-color);
        text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
	}

    .body-text {
        font-size: 1.5rem;
        line-height: 1.6;
        opacity: 0.9;
    }
</style>
