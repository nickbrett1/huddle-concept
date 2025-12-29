<script>
	let { title, children, id } = $props();
</script>

<section {id} class="section">
	{#if title}
		<h2 class="section-title">{title}</h2>
	{/if}
	<div class="content">
		{@render children()}
	</div>
</section>

<style>
	.section {
		min-height: 100vh;
		width: 100%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		padding: 4rem 2rem;
		box-sizing: border-box;
		border-bottom: 1px solid rgba(255, 255, 255, 0.1);
		scroll-snap-align: start;
        position: relative;
	}

	.section-title {
		font-size: 1rem;
		color: #00afea;
		text-transform: uppercase;
		letter-spacing: 2px;
		margin-bottom: 2rem;
		opacity: 0.8;
	}

	.content {
		width: 100%;
		max-width: 1400px;
		margin: 0 auto;
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
	}
</style>
