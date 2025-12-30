<script>
	let { children, id = "" } = $props();
</script>

<section class="section" {id}>
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
		padding-top: calc(70px + 2rem); /* Account for fixed header */
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
