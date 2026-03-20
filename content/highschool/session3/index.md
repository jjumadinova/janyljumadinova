---
layout: page
title: Session 3
subtitle: Polish, Portfolio, and Publish
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 3: Polish, Portfolio, and Publish

**Goal:** Expand the games from Session 2, make them feel more professional, and publish them with GitHub Pages  
**Prerequisites:** Sessions 1-2 (HTML, CSS, JavaScript, VS Code, GitHub)

---

## What You Will Accomplish Today

By the end of this session, you will have:
- Better versions of the games you already built
- A simple portfolio homepage that links to your projects
- A live GitHub Pages URL you can share with anyone
- A workflow for updating and republishing your work

This session keeps building on the exact tools the students already used. No extra installs are required.

---

## Part 1: Improve Your Existing Games

Instead of starting a new framework today, we are going deeper with plain HTML, CSS, and JavaScript.

### Upgrade 1: Save High Scores in Click Speed Challenge

Open `click-game.html` and find the game state variables.

Replace the old high score line with:

```javascript
let highScore = localStorage.getItem('clickGameHighScore')
    ? parseInt(localStorage.getItem('clickGameHighScore'))
    : 0;

highScoreDisplay.textContent = highScore;
```

Then in `endGame()`, save the new score when a record is set:

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

**Why this matters:**
- `localStorage` keeps data even after refresh
- The game now remembers progress between play sessions
- Students see that browser apps can store useful information

### Upgrade 2: Add a Little Motion

Inside the existing `<style>` block, add:

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

Then in `endGame()`, after a new high score, add:

```javascript
clickButton.style.animation = 'celebrate 0.6s ease';
setTimeout(() => {
    clickButton.style.animation = '';
}, 600);
```

### Upgrade 3: Make Gem Catcher More Interesting

Choose one feature and build it as a class challenge.

**Option A: Golden gem bonus**

Update `createGem()` so some gems are special:

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

When a gem is caught, add:

```javascript
score += gem.points;
```

**Option B: Difficulty increase**

As the score gets higher, make gems fall faster:

```javascript
gem.y += gem.speed + score * 0.05;
```

**Option C: Show a restart hint**

In `endGame()`, update the message:

```javascript
messageDisplay.textContent = 'Game Over! Click START GAME to try again.';
```

---

## Part 2: Build a Portfolio Homepage

Now create one page that links all student projects together.

Create a file named `index.html` in the root of the project.

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
                <span>UI</span>
            </div>
            <a class="play-button" href="#">Soon</a>
        </section>
    </main>
</body>
</html>
```

### Personalization Ideas

1. Replace "My GameCraft Portfolio" with the student name
2. Change the colors to match the style of the games
3. Add a short bio or favorite game
4. Add screenshots later if there is time

---

## Part 3: Deploy with GitHub Pages

This is the best time to deploy because the project is still plain HTML files.

### Step 1: Commit Your Work

```bash
git add .
git commit -m "Polish games and add portfolio"
git push origin main
```

### Step 2: Turn On GitHub Pages

1. Open the repository on GitHub
2. Click **Settings**
3. Click **Pages** in the left sidebar
4. Under **Source**, choose **Deploy from a branch**
5. Choose branch **main** and folder **/ (root)**
6. Click **Save**

### Step 3: Open the Published Site

After a minute or two, GitHub will show a URL that looks like:

`https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/`

Test the portfolio and make sure each game link works.

### Step 4: Update and Republish

Every time students change their files, they republish with:

```bash
git add .
git commit -m "Update portfolio"
git push origin main
```

---

## Part 4: Add a README

Create or update `README.md` in the project root.

```markdown
# GameCraft Portfolio

A collection of browser games built during GameCraft.

## Games

- Click Speed Challenge
- Gem Catcher
- More coming soon

## Built With

- HTML
- CSS
- JavaScript
- GitHub Pages

## Play Online

Add your GitHub Pages link here.
```

---

## What Students Learned Today

- **Polish matters**: small UI details make projects feel complete
- **localStorage**: browser apps can remember information
- **Portfolio thinking**: one homepage can connect multiple projects
- **Deployment**: pushing to GitHub can publish a real website
- **Iteration**: existing projects can keep improving instead of being thrown away

---

## Homework (Optional)

1. Add one more improvement to Click Speed Challenge
2. Add one more improvement to Gem Catcher
3. Customize the portfolio homepage design
4. Share the GitHub Pages link with a friend or family member

---

## Common Issues

**Problem:** "GitHub Pages shows a 404"  
**Solution:** Make sure the main page is named `index.html` and Pages is enabled for the `main` branch root folder.

**Problem:** "My new changes are not live yet"  
**Solution:** Push your changes and wait 1-2 minutes, then hard refresh with `Cmd+Shift+R`.

**Problem:** "My portfolio links are broken"  
**Solution:** Use relative paths like `click-game.html` and `gem-catcher.html`, not full local file paths.

**Problem:** "The score does not stay after refresh"  
**Solution:** Check that `localStorage.setItem(...)` is inside the code path that runs when a new high score is reached.

---

## Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [localStorage - MDN](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)
- [CSS Animations - MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animations/Using_CSS_animations)

---

**[Session 2](/highschool/session2/) | [Back to GameCraft Home](/highschool/) | [Next: Session 4 - React Without npm](/highschool/session4/)**
