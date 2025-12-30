<script>
	let { children } = $props();
</script>

<section class="section">
	<div class="content">
		{@render children()}
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
		padding: 2rem;
		box-sizing: border-box;
		position: relative;
	}

	.content {
		width: 100%;
		max-width: 1200px;
		margin: 0 auto;
		height: 100%;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
</style>
