import puppeteer from 'puppeteer';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const HTML_PATH = path.join(__dirname, 'posts', 'day_01', 'slides.html');
const OUT_PATH  = path.join(__dirname, 'posts', 'day_01', 'day_01_ML_carousel.pdf');

(async () => {
  console.log('Launching browser...');
  const browser = await puppeteer.launch({ headless: 'new' });
  const page    = await browser.newPage();

  // Set viewport to 1080×1080
  await page.setViewport({ width: 1080, height: 1080, deviceScaleFactor: 1 });

  console.log('Loading HTML...');
  await page.goto(`file:///${HTML_PATH.replace(/\\/g, '/')}`, {
    waitUntil: 'networkidle0',
    timeout: 30000
  });

  // Give Google Fonts an extra second to render
  await new Promise(r => setTimeout(r, 2000));

  console.log('Generating PDF...');
  await page.pdf({
    path: OUT_PATH,
    width:  '1080px',
    height: '1080px',
    printBackground: true,
    margin: { top: 0, right: 0, bottom: 0, left: 0 }
  });

  await browser.close();
  console.log('✅  PDF saved to:', OUT_PATH);
})();
