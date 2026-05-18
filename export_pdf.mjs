import puppeteer from 'puppeteer';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const POSTS_DIR = path.join(__dirname, 'posts');

// Helper to format numbers to 2-digit padding (e.g. 2 -> '02')
const pad = (num) => String(num).padStart(2, '0');

(async () => {
  // Determine which days to export (all days found in the posts folder, or a specific day)
  const argDay = process.argv[2];
  let targets = [];

  if (argDay) {
    const formattedDay = `day_${pad(argDay)}`;
    const htmlPath = path.join(POSTS_DIR, formattedDay, 'slides.html');
    if (fs.existsSync(htmlPath)) {
      targets.push({
        folder: formattedDay,
        htmlPath,
        pdfPath: path.join(POSTS_DIR, formattedDay, `day_${pad(argDay)}_ML_carousel.pdf`),
        label: `Day ${pad(argDay)}`
      });
    } else {
      console.error(`❌  Slides not found at: ${htmlPath}`);
      process.exit(1);
    }
  } else {
    // Scan entire posts directory
    const folders = fs.readdirSync(POSTS_DIR).filter(f => f.startsWith('day_'));
    for (const folder of folders) {
      const htmlPath = path.join(POSTS_DIR, folder, 'slides.html');
      if (fs.existsSync(htmlPath)) {
        const match = folder.match(/day_(\d+)/);
        const dayNum = match ? match[1] : folder;
        targets.push({
          folder,
          htmlPath,
          pdfPath: path.join(POSTS_DIR, folder, `${folder}_ML_carousel.pdf`),
          label: `Day ${dayNum}`
        });
      }
    }
  }

  if (targets.length === 0) {
    console.log('⚠️  No slides.html files found to export.');
    return;
  }

  console.log(`🚀  Found ${targets.length} post(s) to export. Launching headless browser...`);
  const browser = await puppeteer.launch({ headless: 'new' });
  const page    = await browser.newPage();

  // Set viewport to 1080×1080
  await page.setViewport({ width: 1080, height: 1080, deviceScaleFactor: 1 });

  for (const target of targets) {
    console.log(`\n--------------------------------------------`);
    console.log(`📦  Processing ${target.label}...`);
    console.log(`🔗  Loading: ${target.htmlPath}`);
    
    await page.goto(`file:///${target.htmlPath.replace(/\\/g, '/')}`, {
      waitUntil: 'networkidle0',
      timeout: 30000
    });

    // Let Google Fonts render
    await new Promise(r => setTimeout(r, 2000));

    console.log(`📄  Generating PDF: ${target.pdfPath}`);
    await page.pdf({
      path: target.pdfPath,
      width: '1080px',
      height: '1080px',
      printBackground: true,
      margin: { top: 0, right: 0, bottom: 0, left: 0 }
    });
    console.log(`✅  Successfully exported ${target.label}!`);
  }

  await browser.close();
  console.log('\n============================================');
  console.log('🎉  All PDF exports completed successfully!');
  console.log('============================================');
})();
