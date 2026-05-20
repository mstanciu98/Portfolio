# Mihai Stanciu — Engineering Portfolio

A dark, industrial-style engineering portfolio inspired by the Valve Corporation website.
Built as a single `index.html` file — no build tools, no dependencies, ready for GitHub Pages.

---

## Quick Start

1. Put `index.html` in the root of your GitHub repository
2. Go to **Settings → Pages → Source** and set it to `main` branch, `/ (root)`
3. Your site will be live at `https://mstanciu98.github.io/Portfolio/`

---

## File Structure

```
your-repo/
├── index.html          ← the portfolio (edit this)
├── resume.pdf          ← your résumé (linked in Contact section)
└── images/
    ├── hero.jpg            ← hero background image
    ├── mihai.jpg           ← your photo in the About section
    ├── handhold.jpg        ← Handhold surgical clip project
    ├── inflatable-truss.jpg
    ├── continuum-arm.jpg
    ├── mars-rover.jpg
    ├── kuka-arm.jpg
    ├── ball-robot.jpg
    └── ski-optimizer.jpg
```

---

## Adding Images

Each project card has a placeholder `<div class="img-placeholder">`. Replace it with an `<img>` tag:

```html
<!-- BEFORE (placeholder) -->
<div class="img-placeholder">
  <svg ...></svg>
  Add image: images/handhold.jpg
</div>

<!-- AFTER (real image) -->
<img src="images/handhold.jpg" alt="Handhold surgical clip prototype">
```

### Multiple images per project

Use the `.img-grid-2` grid to show two images side by side:

```html
<div class="img-grid-2">
  <div class="project-images">
    <img src="images/handhold-1.jpg" alt="CAD render">
  </div>
  <div class="project-images">
    <img src="images/handhold-2.jpg" alt="Prototype">
  </div>
</div>
```

---

## Adding Personal Notes / Comments

Each project has a comment block showing where to add notes. Example:

```html
<!-- Find this comment in the Handhold project: -->
<!--
  ADD YOUR NOTES / COMMENTS HERE:
  <p class="project-desc" style="margin-top: 12px; font-style: italic; color: var(--text-dim);">
    Your personal notes, lessons learned, design decisions...
  </p>
-->

<!-- Replace it with: -->
<p class="project-desc" style="margin-top: 12px; font-style: italic; color: var(--text-dim);">
  The biggest challenge was balancing sterilization compatibility with the tight geometric
  constraints near the incision site. We ended up switching to PEEK for the clip body
  after the fourth design iteration.
</p>
```

---

## Updating Contact Info

Find the Contact section near the bottom and update:

```html
<a class="contact-link" href="mailto:your@email.com">
<a class="contact-link" href="https://www.linkedin.com/in/yourprofile" ...>
<a class="contact-link" href="https://github.com/yourusername" ...>
```

---

## Adding a New Project

Copy this block and paste it inside any `<div class="category-panel">`:

```html
<div class="project-card">
  <div class="project-images">
    <img src="images/your-project.jpg" alt="Project name">
  </div>
  <div class="project-info">
    <p class="project-role">Your Role / Course Name</p>
    <h3 class="project-name">Project Title</h3>
    <p class="project-org">Organization · Date Range</p>
    <p class="project-desc">
      Short description of what this project is and why it matters.
    </p>
    <ul class="project-highlights">
      <li>Key result or achievement</li>
      <li>Another highlight</li>
    </ul>
    <div class="project-tags">
      <span class="tag">Skill 1</span>
      <span class="tag">Skill 2</span>
    </div>
  </div>
</div>
```

### Adding an award badge

```html
<div class="award-badge">🏆 Award Name · Detail</div>
```

---

## Adding a New Category

Copy and paste a full `<div class="category-group">` block. Change:
- The button label
- The `cat-meta` subtitle
- The projects inside the panel

---

## Customization

All colors are CSS variables at the top of the `<style>` block:

```css
--accent:   #4d9de0;   /* blue highlight color */
--accent2:  #e07b4d;   /* orange (available for use) */
--gold:     #c9a84c;   /* award badge color */
--bg:       #1b1b1b;   /* page background */
--text:     #c8c8c8;   /* body text */
```

---

## Hero Background Image

The hero section uses `images/hero.jpg` as a background. 

Recommended: a high-contrast photo of a project, workspace, or engineering environment.
Dimensions: at least 1920×1080px. The CSS overlay will darken it automatically.


---

## For Mihai's Eyes Only

Private setup notes for getting the portfolio running locally.

### 1. Install Git

1. Go to [git-scm.com/install](https://git-scm.com/install/)
2. Select your operating system.
3. Download the standalone installer for your processor architecture.
4. Open the installer.
5. Use the default settings unless you know exactly what a setting changes.

### 2. Clone the Portfolio

Open a terminal, then navigate to the folder where you want the portfolio project to live.

```bash
git clone <paste-link-to-git-repo>
cd Portfolio
```

### 3. Open in VS Code

If the `code` command is available:

```bash
code .
```

If that command does not work, open VS Code manually and use **File → Open Folder** to select the `Portfolio` folder.
