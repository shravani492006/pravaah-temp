const { chromium } = require('playwright');
const axeCore = require('axe-core');

(async () => {
  const browser = await chromium.launch({ args: ['--no-sandbox'] });
  const page = await browser.newPage();

  try {
    await page.goto('http://127.0.0.1:8000/accounts/login/');
    // login
    await page.fill('input[name="username"]', process.env.UI_TEST_USERNAME || 'ui_test');
    await page.fill('input[name="password"]', process.env.UI_TEST_PASSWORD || 'testpass');
    await Promise.all([
      page.click('button[type="submit"]'),
      page.waitForNavigation({ waitUntil: 'networkidle' })
    ]);

    await page.goto('http://127.0.0.1:8000/trainers/profile/');

    // inject axe
    await page.addScriptTag({ content: axeCore.source });
    const results = await page.evaluate(async () => {
      return await axe.run();
    });

    if (results.violations && results.violations.length > 0) {
      console.error('Accessibility violations found:');
      console.error(JSON.stringify(results.violations, null, 2));
      await page.screenshot({ path: 'a11y-fail.png', fullPage: true });
      await browser.close();
      process.exit(1);
    } else {
      console.log('No accessibility violations found');
      await page.screenshot({ path: 'a11y-pass.png', fullPage: true });
    }

    await browser.close();
    process.exit(0);
  } catch (e) {
    console.error('Error running a11y script', e);
    await page.screenshot({ path: 'a11y-error.png', fullPage: true }).catch(()=>{});
    await browser.close();
    process.exit(2);
  }
})();
