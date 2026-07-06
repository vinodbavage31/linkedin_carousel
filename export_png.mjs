import puppeteer from 'puppeteer';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const POSTS_DIR = path.join(__dirname, 'posts');

const pad = (num) => String(num).padStart(2, '0');

(async () => {
    const argDay = process.argv[2] || '13';
    const formattedDay = `day_${pad(argDay)}`;
    const htmlPath = path.join(POSTS_DIR, formattedDay, 'slides.html');
    const pngPath = path.join(POSTS_DIR, formattedDay, `${formattedDay}_ML_infographic.png`);

    if (!fs.existsSync(htmlPath)) {
        console.error(`❌  Slides not found at: ${htmlPath}`);
        process.exit(1);
    }

    console.log(`🚀  Launching headless browser...`);
    const browser = await puppeteer.launch({ headless: 'new' });
    const page = await browser.newPage();

    console.log(`🔗  Loading: ${htmlPath}`);
    await page.goto(`file:///${htmlPath.replace(/\\/g, '/')}`, {
        waitUntil: 'networkidle0',
        timeout: 30000
    });

    // Let Google Fonts render
    await new Promise(r => setTimeout(r, 2000));

    const dimensions = await page.evaluate(() => {
        const slide = document.querySelector('.slide');
        return {
            width: slide ? slide.offsetWidth : 1080,
            height: slide ? slide.offsetHeight : 1350
        };
    });

    console.log(`📐  Setting viewport to: ${dimensions.width}px × ${dimensions.height}px`);
    await page.setViewport({ width: dimensions.width, height: dimensions.height, deviceScaleFactor: 2 }); // Scale factor 2 for high-res

    console.log(`📷  Saving PNG to: ${pngPath}`);
    await page.screenshot({
        path: pngPath,
        type: 'png',
        clip: { x: 0, y: 0, width: dimensions.width, height: dimensions.height }
    });

    await browser.close();
    console.log('✅  PNG export completed successfully!');
})();
