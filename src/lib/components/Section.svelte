<script>
	import { onMount } from 'svelte';
	import { fade } from 'svelte/transition';

	let { children, id = "", bottomPadding = "6rem" } = $props();

	let scrollContainer = $state();
	let showScrollIndicator = $state(false);

	function checkScroll() {
		if (!scrollContainer) return;
		const { scrollTop, scrollHeight, clientHeight } = scrollContainer;
		// Only consider it scrollable if there's significant overflow (> 50px)
		// This prevents it from showing on the Hero page if it's just a tiny bit over.
		const isScrollable = (scrollHeight - clientHeight) > 50;
		// Show if scrollable and not at the very bottom (with 20px buffer)
		const isAtBottom = Math.ceil(scrollTop + clientHeight) >= scrollHeight - 20;
		showScrollIndicator = isScrollable && !isAtBottom;
	}

	onMount(() => {
		checkScroll();
		const resizeObserver = new ResizeObserver(checkScroll);
		if (scrollContainer) {
			resizeObserver.observe(scrollContainer);
		}
		window.addEventListener('resize', checkScroll);
		return () => {
			resizeObserver.disconnect();
			window.removeEventListener('resize', checkScroll);
		};
	});
</script>

<section class="section" {id}>
	<div
		class="scroll-container"
		bind:this={scrollContainer}
		onscroll={checkScroll}
	>
		<div class="content" style="padding-bottom: {bottomPadding}">
			{@render children()}
		</div>
	</div>

	{#if showScrollIndicator}
		<div class="scroll-indicator" transition:fade={{ duration: 200 }}>
			<svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
				<polyline points="6 9 12 15 18 9"></polyline>
			</svg>
		</div>
	{/if}
</section>

<style>
	.section {
		height: 100vh;
		width: 100vw;
		min-width: 100vw;
		position: relative;
		scroll-snap-align: start;
		overflow: hidden; /* Container doesn't scroll, inner does */
	}

	.scroll-container {
		height: 100%;
		width: 100%;
		overflow-y: auto;
		overflow-x: hidden;
		display: flex;
		flex-direction: column;
		padding: 2rem;
		padding-top: calc(70px + 2rem);
		box-sizing: border-box;
		/* Scrollbar styling for webkit */
		scrollbar-width: thin;
		scrollbar-color: rgba(255, 255, 255, 0.2) transparent;
	}

	/* Custom Scrollbar for Chrome/Safari/Edge */
	.scroll-container::-webkit-scrollbar {
		width: 6px;
	}
	.scroll-container::-webkit-scrollbar-track {
		background: transparent;
	}
	.scroll-container::-webkit-scrollbar-thumb {
		background-color: rgba(255, 255, 255, 0.2);
		border-radius: 3px;
	}

	.content {
		width: 100%;
		max-width: 1200px;
		margin: 0 auto;
		flex-grow: 1;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}

	@media (max-height: 800px) {
		.content {
			justify-content: flex-start;
			padding-top: 1rem;
		}
	}

	.scroll-indicator {
		position: absolute;
		bottom: 2rem;
		right: 2rem;
		display: flex;
		flex-direction: column;
		align-items: center;
		color: #00afea; /* Electric Blue */
		pointer-events: none;
		z-index: 10;
		animation: bounce 2s infinite;
		/* Removed text-shadow since it's colored now and simpler */
	}

	@keyframes bounce {
		0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
		40% {transform: translateY(-5px);}
		60% {transform: translateY(-3px);}
	}
</style>
