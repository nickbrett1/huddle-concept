<script>
	let isMenuOpen = $state(false);

	function toggleMenu() {
		isMenuOpen = !isMenuOpen;
	}

	function closeMenu() {
		isMenuOpen = false;
	}
</script>

<header class="header">
	<div class="left">
		<button class="hamburger" onclick={toggleMenu} aria-label="Menu">
			<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path d="M3 12H21" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
				<path d="M3 6H21" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
				<path d="M3 18H21" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
			</svg>
		</button>
	</div>

	<div class="center">
		<div class="title">THE HUDDLE</div>
	</div>

	<div class="right">
		<div class="icon">
			<!-- Simple Huddle Icon: A circle of dots representing people in a huddle -->
			<svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="16" cy="6" r="3" fill="#00afea"/>
				<circle cx="24.66" cy="11" r="3" fill="white"/>
				<circle cx="24.66" cy="21" r="3" fill="white"/>
				<circle cx="16" cy="26" r="3" fill="white"/>
				<circle cx="7.34" cy="21" r="3" fill="white"/>
				<circle cx="7.34" cy="11" r="3" fill="white"/>
			</svg>
		</div>
	</div>

	{#if isMenuOpen}
		<nav class="nav-overlay">
			<button class="close-btn" onclick={closeMenu}>&times;</button>
			<div class="nav-links">
				<a href="#hero" onclick={closeMenu}>Home</a>
				<a href="#problem" onclick={closeMenu}>Problem</a>
				<a href="#demo" onclick={closeMenu}>Demo</a>
				<a href="#engine" onclick={closeMenu}>Engine</a>
				<a href="#opportunity" onclick={closeMenu}>Opportunity</a>
				<a href="#footer" onclick={closeMenu}>Author</a>
			</div>
		</nav>
	{/if}
</header>

<style>
	.header {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 70px;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 0 2rem;
		box-sizing: border-box;
		background-color: #0f1115;
		border-bottom: 1px solid rgba(255, 255, 255, 0.1);
		z-index: 1000;
	}

	.hamburger {
		background: none;
		border: none;
		cursor: pointer;
		padding: 0.5rem;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.hamburger:hover path {
		stroke: #00afea;
	}

	.center .title {
		font-family: 'Oswald', sans-serif;
		font-size: 1.5rem;
		font-weight: 700;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		color: white;
	}

	.right .icon {
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.nav-overlay {
		position: fixed;
		top: 70px; /* Below header */
		left: 0;
		width: 300px;
		height: calc(100vh - 70px);
		background-color: #0f1115;
		border-right: 1px solid rgba(255, 255, 255, 0.1);
		display: flex;
		flex-direction: column;
		padding: 2rem;
		box-sizing: border-box;
		z-index: 999;
	}

	.close-btn {
		position: absolute;
		top: 1rem;
		right: 1rem;
		background: none;
		border: none;
		color: white;
		font-size: 2rem;
		cursor: pointer;
	}

	.nav-links {
		display: flex;
		flex-direction: column;
		gap: 2rem;
		margin-top: 2rem;
	}

	.nav-links a {
		font-family: 'Oswald', sans-serif;
		font-size: 1.5rem;
		text-transform: uppercase;
		color: white;
		text-decoration: none;
		transition: color 0.2s;
	}

	.nav-links a:hover {
		color: #00afea;
	}
</style>
