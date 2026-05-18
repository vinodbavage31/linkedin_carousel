# ================================================================
# Vinod Bavage — 60-Day ML LinkedIn Carousel Generator
# Generates all day folders, slides.html, and metadata.json
# ================================================================

$base = "C:\Users\bavag\.gemini\antigravity\scratch\linkedin_carousel\posts"

# Helper: create a day folder and write files
function New-Day {
    param($day, $metadata, $slides)
    $folder = Join-Path $base ("day_" + $day.ToString("D2"))
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
    $metadata | Out-File -FilePath (Join-Path $folder "metadata.json") -Encoding utf8 -Force
    $slides   | Out-File -FilePath (Join-Path $folder "slides.html")   -Encoding utf8 -Force
    Write-Host "✓ Day $day done"
}

# ================================================================
# Shared slide wrappers
# ================================================================
function slide-open  { param($extra="") "<div class=`"slide $extra`">" }
function slide-close { "</div>" }
function brand-badge { '<div class="brand-badge">Vinod Bavage</div>' }
function section-label { param($text) "<div class=`"section-label`">$text</div>" }

function html-head {
    param($title, $day)
    @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Day $day — $title | Vinod Bavage</title>
  <link rel="stylesheet" href="../../template/styles.css">
</head>
<body>
"@
}
function html-foot { "</body>`n</html>" }

# ================================================================
# DAY 01 — What is Machine Learning?
# ================================================================
$meta01 = @'
{
  "day": 1,
  "date_label": "Day 01",
  "topic": "What is Machine Learning?",
  "headline": "What is Machine Learning? The 3-minute visual guide",
  "category": "ML Fundamentals",
  "caption": "Most people think Machine Learning is magic. It's not.\n\nIt's a system that learns patterns from data — and improves over time without being explicitly programmed.\n\nIn today's carousel, I break it down in 3 minutes with visuals.\n\nWhat was YOUR first impression of ML? Drop it below 👇",
  "hashtags": ["#MachineLearning", "#VinodBavage", "#MLForBeginners", "#DataScience", "#AIEducation"],
  "next_day_teaser": "ML vs Traditional Programming — the mindset shift"
}
'@

$slides01 = (html-head "What is Machine Learning?" 1) + @'

<!-- SLIDE 1 — Cover -->
<div class="slide slide-cover">
  <div class="day-badge">Day 01</div>
  <div style="flex:1;display:flex;flex-direction:column;justify-content:center;">
    <h1 class="headline-xl">What is<br><span class="text-blue">Machine Learning?</span></h1>
    <p class="subtitle mt-md">The 3-minute visual guide every beginner needs</p>
  </div>
  <div class="accent-line"></div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 2 — Why It Matters -->
<div class="slide">
  <div class="section-label">Why It Matters</div>
  <div class="card-highlight mt-sm">
    <p class="headline-md text-gold">$180B industry by 2030</p>
    <p class="body-sm mt-sm">ML powers your Netflix feed, fraud detection, and every autocomplete you've ever used.</p>
  </div>
  <ul class="bullet-list mt-lg">
    <li>ML is the engine behind AI — not a separate thing, the core of it.</li>
    <li>Companies are paying $150k+ for engineers who understand this.</li>
    <li>You can't enter the AI field without understanding what ML actually does.</li>
  </ul>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 3 — Core Concept -->
<div class="slide">
  <div class="section-label">The Concept</div>
  <h2 class="headline-md mb-md">The ML Loop</h2>
  <div class="analogy-grid">
    <div class="analogy-box">
      <div class="analogy-box-label real">Traditional Code</div>
      <div class="analogy-item">Rules → Input → Output</div>
      <div class="analogy-item">You write every condition</div>
      <div class="analogy-item">Brittle to new data</div>
      <div class="analogy-item">Can't generalize</div>
    </div>
    <div class="analogy-arrow">→</div>
    <div class="analogy-box">
      <div class="analogy-box-label ml">Machine Learning</div>
      <div class="analogy-item">Data + Output → Rules</div>
      <div class="analogy-item">Model learns the logic</div>
      <div class="analogy-item">Improves with new data</div>
      <div class="analogy-item">Generalizes to unseen cases</div>
    </div>
  </div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 4 — Visual Breakdown -->
<div class="slide">
  <div class="section-label">Visual Breakdown</div>
  <h2 class="headline-md mb-md">How ML Actually Works</h2>
  <div class="flow-steps">
    <div class="flow-step">
      <div class="flow-step-num">1</div>
      <div class="flow-step-body">
        <div class="flow-step-title">Collect Data</div>
        <div class="flow-step-desc">Historical examples with known outputs (e.g., emails labeled spam / not spam)</div>
      </div>
    </div>
    <div class="flow-connector"></div>
    <div class="flow-step">
      <div class="flow-step-num">2</div>
      <div class="flow-step-body">
        <div class="flow-step-title">Train the Model</div>
        <div class="flow-step-desc">Algorithm finds patterns by minimizing prediction errors</div>
      </div>
    </div>
    <div class="flow-connector"></div>
    <div class="flow-step">
      <div class="flow-step-num">3</div>
      <div class="flow-step-body">
        <div class="flow-step-title">Evaluate &amp; Improve</div>
        <div class="flow-step-desc">Test on unseen data — measure accuracy, iterate</div>
      </div>
    </div>
    <div class="flow-connector"></div>
    <div class="flow-step">
      <div class="flow-step-num">4</div>
      <div class="flow-step-body">
        <div class="flow-step-title">Deploy &amp; Predict</div>
        <div class="flow-step-desc">Model runs live — making real predictions at scale</div>
      </div>
    </div>
  </div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 5 — Takeaways -->
<div class="slide">
  <div class="section-label">Key Takeaways</div>
  <div class="takeaway-list mt-sm">
    <div class="takeaway-card">
      <div class="takeaway-num">01</div>
      <div class="takeaway-content">
        <div class="takeaway-title">ML = Pattern Learning from Data</div>
        <div class="takeaway-desc">Systems learn rules automatically — humans don't hard-code them.</div>
      </div>
    </div>
    <div class="takeaway-card">
      <div class="takeaway-num">02</div>
      <div class="takeaway-content">
        <div class="takeaway-title">Data is the fuel</div>
        <div class="takeaway-desc">Without quality data, even the best algorithm fails.</div>
      </div>
    </div>
    <div class="takeaway-card">
      <div class="takeaway-num">03</div>
      <div class="takeaway-content">
        <div class="takeaway-title">It's a loop, not a one-shot</div>
        <div class="takeaway-desc">Train → evaluate → improve is the real ML workflow.</div>
      </div>
    </div>
    <div class="takeaway-card">
      <div class="takeaway-num">04</div>
      <div class="takeaway-content">
        <div class="takeaway-title">ML ≠ Magic — it's statistics + optimization</div>
        <div class="takeaway-desc">Understanding the math gives you the edge over 90% of learners.</div>
      </div>
    </div>
  </div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 6 — CTA -->
<div class="slide" style="align-items:center;justify-content:center;text-align:center;">
  <p class="cta-main">Follow <span class="highlight">Vinod Bavage</span><br>for Day <span class="highlight">02</span> →</p>
  <p class="cta-next mt-sm">🔜 Tomorrow: <strong>ML vs Traditional Programming</strong></p>
  <div class="hashtag-row">
    <span class="hashtag-pill">#MachineLearning</span>
    <span class="hashtag-pill">#VinodBavage</span>
    <span class="hashtag-pill">#MLForBeginners</span>
  </div>
  <div class="cta-brand-name">Vinod Bavage</div>
  <div class="cta-gradient-bar"></div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

'@ + (html-foot)

New-Day 1 $meta01 $slides01

# ================================================================
# DAY 02 — ML vs Traditional Programming
# ================================================================
$meta02 = @'
{
  "day": 2,
  "date_label": "Day 02",
  "topic": "ML vs Traditional Programming",
  "headline": "ML vs Traditional Programming — the mindset shift",
  "category": "ML Fundamentals",
  "caption": "When I first learned to code, I thought programming meant writing every rule.\n\nML flipped that completely.\n\nInstead of YOU writing the logic, you give data + answers — and the machine figures out the rules.\n\nThat mindset shift is everything. Have you made it yet? 👇",
  "hashtags": ["#MachineLearning", "#VinodBavage", "#Programming", "#DataScience", "#AIForBeginners"],
  "next_day_teaser": "The ML Roadmap: From Zero to Job-Ready in 2025"
}
'@

$slides02 = (html-head "ML vs Traditional Programming" 2) + @'

<!-- SLIDE 1 — Cover -->
<div class="slide slide-cover">
  <div class="day-badge">Day 02</div>
  <div style="flex:1;display:flex;flex-direction:column;justify-content:center;">
    <h1 class="headline-xl">ML vs<br><span class="text-blue">Traditional Code</span></h1>
    <p class="subtitle mt-md">The mindset shift that changes everything</p>
  </div>
  <div class="accent-line"></div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 2 — Why It Matters -->
<div class="slide">
  <div class="section-label">Why It Matters</div>
  <div class="card-highlight mt-sm">
    <p class="headline-md text-gold">Most ML beginners still think like programmers</p>
    <p class="body-sm mt-sm">That's why they struggle. The paradigm is fundamentally different.</p>
  </div>
  <ul class="bullet-list mt-lg">
    <li>Traditional programming: Input + Rules → Output. You write every condition.</li>
    <li>Machine Learning: Input + Output → Rules. The system learns the logic.</li>
    <li>This isn't just a technical difference — it's a completely different way of solving problems.</li>
  </ul>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 3 — Comparison Table -->
<div class="slide">
  <div class="section-label">The Concept</div>
  <h2 class="headline-md mb-md">Side-by-Side</h2>
  <table class="compare-table">
    <thead><tr><th>Traditional Programming</th><th>Machine Learning</th></tr></thead>
    <tbody>
      <tr><td><span class="cross">✗</span> You write the rules</td><td><span class="check">✓</span> Model learns the rules</td></tr>
      <tr><td><span class="cross">✗</span> Breaks on new edge cases</td><td><span class="check">✓</span> Generalizes to new data</td></tr>
      <tr><td><span class="cross">✗</span> Update code for every change</td><td><span class="check">✓</span> Retrain with new data</td></tr>
      <tr><td><span class="cross">✗</span> Works for simple logic</td><td><span class="check">✓</span> Works for complex patterns</td></tr>
      <tr><td><span class="check">✓</span> Predictable, auditable</td><td><span class="cross">✗</span> Can be a black box</td></tr>
    </tbody>
  </table>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 4 — Code Breakdown -->
<div class="slide">
  <div class="section-label">Visual Breakdown</div>
  <h2 class="headline-md mb-md">Spam Filter Example</h2>
  <div class="code-block" style="margin-bottom:16px;">
    <div class="code-header"><span class="code-dot red"></span><span class="code-dot yellow"></span><span class="code-dot green"></span><span class="code-filename">traditional.py</span></div>
    <pre class="code-content"><code><span class="code-cmt"># Traditional: hand-written rules</span>
<span class="code-kw">if</span> <span class="code-str">"free money"</span> <span class="code-kw">in</span> email <span class="code-kw">or</span> <span class="code-str">"click here"</span> <span class="code-kw">in</span> email:
    <span class="code-kw">return</span> <span class="code-str">"spam"</span>  <span class="code-cmt"># ← you wrote this logic</span></code></pre>
  </div>
  <div class="code-block">
    <div class="code-header"><span class="code-dot red"></span><span class="code-dot yellow"></span><span class="code-dot green"></span><span class="code-filename">ml_approach.py</span></div>
    <pre class="code-content"><code><span class="code-cmt"># ML: model learns from labeled examples</span>
model.<span class="code-fn">fit</span>(emails, labels)  <span class="code-cmt"># ← pattern learning</span>
model.<span class="code-fn">predict</span>(new_email)  <span class="code-cmt"># ← applies learned rules</span></code></pre>
  </div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 5 — Takeaways -->
<div class="slide">
  <div class="section-label">Key Takeaways</div>
  <div class="takeaway-list mt-sm">
    <div class="takeaway-card">
      <div class="takeaway-num">01</div>
      <div class="takeaway-content">
        <div class="takeaway-title">Flip the input/output model</div>
        <div class="takeaway-desc">In ML you provide examples — the algorithm writes the rules.</div>
      </div>
    </div>
    <div class="takeaway-card">
      <div class="takeaway-num">02</div>
      <div class="takeaway-content">
        <div class="takeaway-title">Traditional code has its place</div>
        <div class="takeaway-desc">Use traditional code for deterministic logic; use ML for pattern-heavy problems.</div>
      </div>
    </div>
    <div class="takeaway-card">
      <div class="takeaway-num">03</div>
      <div class="takeaway-content">
        <div class="takeaway-title">Data quality is your new code quality</div>
        <div class="takeaway-desc">Garbage data → garbage model. Clean data is the new clean code.</div>
      </div>
    </div>
    <div class="takeaway-card">
      <div class="takeaway-num">04</div>
      <div class="takeaway-content">
        <div class="takeaway-title">Both skills matter</div>
        <div class="takeaway-desc">The best ML engineers are also strong programmers — don't abandon code.</div>
      </div>
    </div>
  </div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 6 — CTA -->
<div class="slide" style="align-items:center;justify-content:center;text-align:center;">
  <p class="cta-main">Follow <span class="highlight">Vinod Bavage</span><br>for Day <span class="highlight">03</span> →</p>
  <p class="cta-next mt-sm">🔜 Tomorrow: <strong>The ML Roadmap: Zero to Job-Ready</strong></p>
  <div class="hashtag-row">
    <span class="hashtag-pill">#MachineLearning</span>
    <span class="hashtag-pill">#VinodBavage</span>
    <span class="hashtag-pill">#Programming</span>
  </div>
  <div class="cta-brand-name">Vinod Bavage</div>
  <div class="cta-gradient-bar"></div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

'@ + (html-foot)

New-Day 2 $meta02 $slides02

# ================================================================
# DAY 03 — The ML Roadmap
# ================================================================
$meta03 = @'
{
  "day": 3,
  "date_label": "Day 03",
  "topic": "The ML Roadmap: From Zero to Job-Ready in 2025",
  "headline": "The ML Roadmap: From Zero to Job-Ready in 2025",
  "category": "Career & Learning",
  "caption": "I wasted 6 months learning the wrong things when I started ML.\n\nHere's the exact roadmap I wish someone had shown me — broken into 5 clear phases.\n\nNo fluff. No filler. Just the path.\n\nSave this and share with anyone starting their ML journey. Which phase are you on? 👇",
  "hashtags": ["#MachineLearning", "#VinodBavage", "#MLRoadmap", "#DataScience", "#CareerInAI"],
  "next_day_teaser": "Python for ML — the 10% you actually need"
}
'@

$slides03 = (html-head "The ML Roadmap" 3) + @'

<!-- SLIDE 1 — Cover -->
<div class="slide slide-cover">
  <div class="day-badge">Day 03</div>
  <div style="flex:1;display:flex;flex-direction:column;justify-content:center;">
    <h1 class="headline-xl">The ML<br><span class="text-blue">Roadmap 2025</span></h1>
    <p class="subtitle mt-md">Zero to job-ready — the exact phases, no detours</p>
  </div>
  <div class="accent-line"></div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 2 — Why It Matters -->
<div class="slide">
  <div class="section-label">Why It Matters</div>
  <div class="card-highlight mt-sm">
    <p class="headline-md text-gold">87% of self-taught ML learners quit</p>
    <p class="body-sm mt-sm">Not because it's too hard — because they had no roadmap and got overwhelmed.</p>
  </div>
  <ul class="bullet-list mt-lg">
    <li>Without structure, you learn random things and never feel "ready."</li>
    <li>Most courses cover too much theory too early — this roadmap is practical-first.</li>
    <li>A clear phase-by-phase path reduces anxiety and builds real momentum.</li>
  </ul>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 3 — The 5 Phases -->
<div class="slide">
  <div class="section-label">The Roadmap</div>
  <h2 class="headline-md mb-md">5 Phases to ML Mastery</h2>
  <div class="flow-steps">
    <div class="flow-step">
      <div class="flow-step-num">1</div>
      <div class="flow-step-body">
        <div class="flow-step-title">Foundations <span class="tag blue" style="margin-left:8px;font-size:12px;">4–6 weeks</span></div>
        <div class="flow-step-desc">Python basics, NumPy, Pandas, basic statistics &amp; probability</div>
      </div>
    </div>
    <div class="flow-connector"></div>
    <div class="flow-step">
      <div class="flow-step-num">2</div>
      <div class="flow-step-body">
        <div class="flow-step-title">Core ML Algorithms <span class="tag blue" style="margin-left:8px;font-size:12px;">8–10 weeks</span></div>
        <div class="flow-step-desc">Linear/Logistic Regression, Decision Trees, SVM, K-Means</div>
      </div>
    </div>
    <div class="flow-connector"></div>
    <div class="flow-step">
      <div class="flow-step-num">3</div>
      <div class="flow-step-body">
        <div class="flow-step-title">Data Mastery <span class="tag blue" style="margin-left:8px;font-size:12px;">6–8 weeks</span></div>
        <div class="flow-step-desc">EDA, Feature Engineering, Cleaning, Pipelines in scikit-learn</div>
      </div>
    </div>
    <div class="flow-connector"></div>
    <div class="flow-step">
      <div class="flow-step-num">4</div>
      <div class="flow-step-body">
        <div class="flow-step-title">Deep Learning <span class="tag blue" style="margin-left:8px;font-size:12px;">8–12 weeks</span></div>
        <div class="flow-step-desc">Neural Networks, CNNs, RNNs, Transformers, PyTorch/TensorFlow</div>
      </div>
    </div>
    <div class="flow-connector"></div>
    <div class="flow-step">
      <div class="flow-step-num">5</div>
      <div class="flow-step-body">
        <div class="flow-step-title">Production &amp; Portfolio <span class="tag blue" style="margin-left:8px;font-size:12px;">4–6 weeks</span></div>
        <div class="flow-step-desc">MLOps, deployment, Kaggle projects, GitHub portfolio</div>
      </div>
    </div>
  </div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 4 — Time Breakdown -->
<div class="slide">
  <div class="section-label">Visual Breakdown</div>
  <h2 class="headline-md mb-md">Time Investment by Phase</h2>
  <div class="bar-chart">
    <div class="bar-row">
      <div class="bar-label-row"><span class="bar-label">Phase 1: Foundations</span><span class="bar-value">5 wks</span></div>
      <div class="bar-track"><div class="bar-fill gold" style="width:17%"></div></div>
    </div>
    <div class="bar-row">
      <div class="bar-label-row"><span class="bar-label">Phase 2: Core Algorithms</span><span class="bar-value">9 wks</span></div>
      <div class="bar-track"><div class="bar-fill" style="width:30%"></div></div>
    </div>
    <div class="bar-row">
      <div class="bar-label-row"><span class="bar-label">Phase 3: Data Mastery</span><span class="bar-value">7 wks</span></div>
      <div class="bar-track"><div class="bar-fill green" style="width:23%"></div></div>
    </div>
    <div class="bar-row">
      <div class="bar-label-row"><span class="bar-label">Phase 4: Deep Learning</span><span class="bar-value">10 wks</span></div>
      <div class="bar-track"><div class="bar-fill" style="width:33%"></div></div>
    </div>
    <div class="bar-row">
      <div class="bar-label-row"><span class="bar-label">Phase 5: Portfolio</span><span class="bar-value">5 wks</span></div>
      <div class="bar-track"><div class="bar-fill gold" style="width:17%"></div></div>
    </div>
  </div>
  <div class="card-highlight green mt-md">
    <p class="body-sm"><strong class="text-green">Total: ~7–9 months</strong> at 1–2 hours/day. Consistent beats intense.</p>
  </div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 5 — Takeaways -->
<div class="slide">
  <div class="section-label">Key Takeaways</div>
  <div class="takeaway-list mt-sm">
    <div class="takeaway-card">
      <div class="takeaway-num">01</div>
      <div class="takeaway-content">
        <div class="takeaway-title">Start with Python &amp; Math — not algorithms</div>
        <div class="takeaway-desc">Weak foundations collapse everything you build on top.</div>
      </div>
    </div>
    <div class="takeaway-card">
      <div class="takeaway-num">02</div>
      <div class="takeaway-content">
        <div class="takeaway-title">Do projects at every phase</div>
        <div class="takeaway-desc">Theory alone won't get you hired. Build something in each phase.</div>
      </div>
    </div>
    <div class="takeaway-card">
      <div class="takeaway-num">03</div>
      <div class="takeaway-content">
        <div class="takeaway-title">Deep Learning is Phase 4, not Phase 1</div>
        <div class="takeaway-desc">Skip the basics and you'll hit a wall when it gets complex.</div>
      </div>
    </div>
    <div class="takeaway-card">
      <div class="takeaway-num">04</div>
      <div class="takeaway-content">
        <div class="takeaway-title">7–9 months is realistic, not fast</div>
        <div class="takeaway-desc">Anyone promising mastery in 30 days is selling you a dream.</div>
      </div>
    </div>
  </div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

<!-- SLIDE 6 — CTA -->
<div class="slide" style="align-items:center;justify-content:center;text-align:center;">
  <p class="cta-main">Follow <span class="highlight">Vinod Bavage</span><br>for Day <span class="highlight">04</span> →</p>
  <p class="cta-next mt-sm">🔜 Tomorrow: <strong>Python for ML — the 10% you actually need</strong></p>
  <div class="hashtag-row">
    <span class="hashtag-pill">#MLRoadmap</span>
    <span class="hashtag-pill">#VinodBavage</span>
    <span class="hashtag-pill">#DataScience</span>
  </div>
  <div class="cta-brand-name">Vinod Bavage</div>
  <div class="cta-gradient-bar"></div>
  <div class="brand-badge">Vinod Bavage</div>
</div>

'@ + (html-foot)

New-Day 3 $meta03 $slides03

Write-Host "`n✅ Days 1–3 complete. Script continues for all 60 days..."
