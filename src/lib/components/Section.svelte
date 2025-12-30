<script>
	let { children, id = "", bottomPadding = "6rem" } = $props();
</script>

<section class="section" {id} style="padding-bottom: {bottomPadding}">
	<div class="content">
		{@render children()}
	</div>
</section>

<style>
	.section {
		height: 100vh;
		width: 100vw;
		min-width: 100vw;
		display: flex;
		flex-direction: column;
		scroll-snap-align: start;
		padding: 2rem;
		padding-top: calc(70px + 2rem); /* Account for fixed header */
		/* padding-bottom handled by style attribute */
		box-sizing: border-box;
		position: relative;
		overflow-y: auto;
		overflow-x: hidden;
	}

	.content {
		width: 100%;
		max-width: 1200px;
		margin: 0 auto;
		flex-grow: 1;
		display: flex;
		flex-direction: column;
		justify-content: center;
		/* Ensure content doesn't get clipped at the top if it overflows */
	}

	@media (max-height: 800px) {
		.content {
			justify-content: flex-start; /* Start from top on small screens */
			padding-top: 1rem;
		}
	}
</style>
