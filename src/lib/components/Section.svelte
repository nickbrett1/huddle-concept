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
		min-height: 100vh;
		width: 100%;
		display: flex;
		flex-direction: column;
		scroll-snap-align: start;
		padding: 2rem;
		padding-top: calc(70px + 2rem); /* Account for fixed header */
		box-sizing: border-box;
		position: relative;
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
