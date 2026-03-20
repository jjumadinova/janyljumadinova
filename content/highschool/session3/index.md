---
layout: page
title: Session 3
subtitle: Polish, Portfolio, and Publish
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 3: Polish, Portfolio, and Publish

**Goal:** Get your games live on the web, build a portfolio homepage, then keep improving the games  
**Prerequisites:** Sessions 1-2 (HTML, CSS, JavaScript, VS Code, GitHub)

---

## What You Will Accomplish Today

By the end of this session, you will have:
- A live GitHub Pages URL you can share with anyone
- A portfolio homepage that links to all your games
- Better versions of the games from Session 2

No extra installs needed — just the tools you already used.

---

## Part 1: Deploy with GitHub Pages

Your repo already has the games and a README, so the site is ready to publish immediately.

### Step 1: Turn On GitHub Pages

1. Open your repository on GitHub
2. Click **Settings**
3. Click **Pages** in the left sidebar
4. Under **Source**, choose **Deploy from a branch**
5. Under **Branch**, choose **main** and folder **/ (root)**
6. Click **Save**

### Step 2: Visit Your Live Site

After about a minute, GitHub shows a URL at the top of the Pages settings:

`https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/`

Open it. Your games are already accessible at their normal filenames — for example:

`https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/click-game.html`

Share the link. These URLs work for anyone, anywhere.

---

## Part 2: Build a Portfolio Homepage

Right now the site root either shows a directory listing or a 404. An `index.html` file in the root folder becomes the landing page automatically.

Create a new file named `index.html` in the root of your project and paste this:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My GameCraft Portfolio</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f172a, #1e293b, #0f172a);
            color: white;
            min-height: 100vh;
        }

        header {
            text-align: center;
            padding: 56px 20px 32px;
        }

        header h1 {
            font-size: 44px;
            margin-bottom: 12px;
        }

        header p {
            opacity: 0.8;
            font-size: 18px;
        }

        .games-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 24px;
            max-width: 960px;
            margin: 0 auto;
            padding: 20px 24px 56px;
        }

        .game-card {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 18px;
            padding: 24px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
        }

        .game-card h2 {
            margin-bottom: 10px;
            font-size: 28px;
        }

        .game-card p {
            line-height: 1.5;
            opacity: 0.85;
            margin-bottom: 16px;
        }

        .tech-tags {
            margin-bottom: 18px;
        }

        .tech-tags span {
            display: inline-block;
            margin: 4px 6px 0 0;
            padding: 5px 10px;
            border-radius: 999px;
            background: rgba(56, 189, 248, 0.2);
            color: #7dd3fc;
            font-size: 13px;
        }

        .play-button {
            display: inline-block;
            text-decoration: none;
            color: white;
            background: linear-gradient(135deg, #06b6d4, #2563eb);
            padding: 12px 22px;
            border-radius: 999px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <header>
        <h1>My GameCraft Portfolio</h1>
        <p>Games I built with HTML, CSS, and JavaScript</p>
    </header>

    <main class="games-grid">
        <section class="game-card">
            <h2>Click Speed Challenge</h2>
            <p>Race the timer and see how fast you can click in 10 seconds.</p>
            <div class="tech-tags">
                <span>HTML</span>
                <span>CSS</span>
                <span>JavaScript</span>
            </div>
            <a class="play-button" href="click-game.html">Play</a>
        </section>

        <section class="game-card">
            <h2>Gem Catcher</h2>
            <p>Move the basket and catch as many falling gems as you can.</p>
            <div class="tech-tags">
                <span>Canvas</span>
                <span>Animation</span>
                <span>JavaScript</span>
            </div>
            <a class="play-button" href="gem-catcher.html">Play</a>
        </section>

        <section class="game-card">
            <h2>Coming Next</h2>
            <p>Session 4 will add a React game to this portfolio.</p>
            <div class="tech-tags">
                <span>React</span>
                <span>Components</span>
                <span>JSX</span>
            </div>
            <a class="play-button" href="#">Soon</a>
        </section>
    </main>
</body>
</html>
```

### Preview Locally First

Right-click `index.html` in the VS Code file explorer and choose **Open with Live Server**. Check that both game links work.

### Commit and Push

```bash
git add index.html
git commit -m "Add portfolio homepage"
git push origin main
```

Wait about a minute and reload the GitHub Pages root URL — the portfolio should now load as the landing page instead of a 404.

### Personalize

After confirming it works, try one quick customization:

1. Change "My GameCraft Portfolio" to your name
2. Update the game descriptions to match what you actually built
3. Push again and see the live site update

---

## Part 3: Improve Your Existing Games

Now that the site is live, every improvement is immediately visible to anyone with your link.

### Upgrade 1: Persistent High Score in Click Speed Challenge

Right now the high score resets every time the page refreshes. `localStorage` fixes that.

Open `click-game.html` and find where the high score variable is declared. Replace it with:

```javascript
let highScore = localStorage.getItem('clickGameHighScore')
    ? parseInt(localStorage.getItem('clickGameHighScore'))
    : 0;

highScoreDisplay.textContent = highScore;
```

Then in `endGame()`, save the score when it is a new record:

```javascript
if (score > highScore) {
    highScore = score;
    highScoreDisplay.textContent = highScore;
    messageDisplay.textContent = 'NEW HIGH SCORE!';
    localStorage.setItem('clickGameHighScore', highScore);
} else {
    messageDisplay.textContent = 'Game Over! Your score: ' + score;
}
```

Test it: get a high score, refresh the page — it should still be there. Open DevTools (`F12`) → **Application** → **Local Storage** to see the value saved.

Commit:

```bash
git add click-game.html
git commit -m "Add persistent high score"
git push origin main
```

### Upgrade 2: Add a Pulse Animation to the Click Button

Inside the existing `<style>` block in `click-game.html`, add:

```css
@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}

@keyframes celebrate {
    0% { transform: scale(1); }
    25% { transform: scale(1.15) rotate(4deg); }
    50% { transform: scale(1.15) rotate(-4deg); }
    100% { transform: scale(1); }
}

.click-button:not(:disabled) {
    animation: pulse 1.5s infinite;
}
```

Then in `endGame()`, right after a new high score is saved, add:

```javascript
clickButton.style.animation = 'celebrate 0.6s ease';
setTimeout(() => {
    clickButton.style.animation = '';
}, 600);
```

The button gently pulses during play and does a small celebration shake on a record.

Commit:

```bash
git add click-game.html
git commit -m "Add button animations"
git push origin main
```

### Upgrade 3: Make Gem Catcher More Interesting

Pick one option and try it.

**Option A: Golden gem bonus** — Update `createGem()`:

```javascript
function createGem() {
    const isGolden = Math.random() < 0.15;

    return {
        x: Math.random() * (canvas.width - 30),
        y: -30,
        width: 30,
        height: 30,
        speed: 2 + Math.random() * 3,
        color: isGolden ? '#ffd700' : ['#ff6b6b', '#4ecdc4', '#45b7d1', '#f7b731'][Math.floor(Math.random() * 4)],
        points: isGolden ? 5 : 1
    };
}
```

Then where a gem is caught, use `score += gem.points` instead of `score++`.

**Option B: Difficulty scaling** — Make gems fall faster as score increases:

```javascript
gem.y += gem.speed + score * 0.05;
```

**Option C: Clearer game-over hint** — In `endGame()`:

```javascript
messageDisplay.textContent = 'Game Over! Click START GAME to try again.';
```

Commit whichever you chose:

```bash
git add gem-catcher.html
git commit -m "Improve gem catcher"
git push origin main
```

---

## What You Learned Today

- **GitHub Pages** — turn a GitHub repo into a live website instantly
- **Portfolio homepage** — one `index.html` ties all your projects together
- **localStorage** — browsers can store data that survives page refreshes
- **CSS animations** — small motion details make games feel more polished
- **The push → publish loop** — every commit updates the live site automatically

---

## Homework (Optional)

1. Customize the portfolio with your name and different colors
2. Implement all three Gem Catcher upgrades
3. Share the GitHub Pages link with someone and have them play

---

## Common Issues

**Problem:** "GitHub Pages shows a 404 at the root"  
**Solution:** Make sure the file is named exactly `index.html` (lowercase) and Pages is enabled for the `main` branch root folder.

**Problem:** "My changes are not showing on the live site"  
**Solution:** Make sure you pushed (`git push origin main`) and waited 1-2 minutes. Hard refresh with `Cmd+Shift+R`.

**Problem:** "The game links on my portfolio are broken"  
**Solution:** Use relative paths — `href="click-game.html"` not `href="/click-game.html"` or a full file path.

**Problem:** "The high score resets after refresh"  
**Solution:** Confirm `localStorage.setItem(...)` is inside the `if (score > highScore)` branch in `endGame()`.

---

## Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [localStorage — MDN](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)
- [CSS Animations — MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animations/Using_CSS_animations)

---

**[Session 2](/highschool/session2/) | [Back to GameCraft Home](/highschool/) | [Next: Session 4 - React Without npm](/highschool/session4/)**
