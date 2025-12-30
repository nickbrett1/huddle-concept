import asyncio
from playwright.async_api import async_playwright

async def run():
    async with async_playwright() as p:
        browser = await p.chromium.launch()
        page = await browser.new_page()
        page.set_viewport_size({"width": 1280, "height": 720})

        try:
            await page.goto("http://localhost:5173")
            await page.wait_for_selector(".app-container")

            # Wait a bit for layout to settle
            await page.wait_for_timeout(1000)

            # Check horizontal layout
            scroll_width = await page.evaluate("document.querySelector('.app-container').scrollWidth")
            client_width = await page.evaluate("document.querySelector('.app-container').clientWidth")

            if scroll_width > client_width:
                print("SUCCESS: Container has horizontal scroll width.")
            else:
                print(f"FAILURE: Container scrollWidth ({scroll_width}) is not greater than clientWidth ({client_width}).")

            # Check for dots
            dots = page.locator(".dot")
            count = await dots.count()
            if count > 0:
                print(f"SUCCESS: Found {count} navigation dots.")
            else:
                print("FAILURE: No navigation dots found.")

            # Check for arrows
            arrows = page.locator(".arrow")
            arrow_count = await arrows.count()
            if arrow_count > 0:
                print(f"SUCCESS: Found {arrow_count} navigation arrows.")
            else:
                print("FAILURE: No navigation arrows found.")

            # Take Screenshot
            await page.screenshot(path="verification/verification.png")
            print("Screenshot saved to verification/verification.png")

        except Exception as e:
            print(f"ERROR: {e}")
        finally:
            await browser.close()

if __name__ == "__main__":
    asyncio.run(run())
