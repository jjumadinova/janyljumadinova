---
layout: page
title: Session 4
subtitle: Polish, Deploy, and Share
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 4: Polish, Deploy, and Share

**Goal:** Add finishing touches to your games, build a portfolio page, and publish everything to the web with a real URL
**Prerequisites:** Sessions 1-3 (HTML, CSS, JavaScript, React)

---

## What You Will Accomplish Today

By the end of this session, you will have:
- **Polished games** with animations and persistent high scores
- **A portfolio homepage** that links to all your projects
- **A live website** anyone can visit at `https://YOUR-USERNAME.github.io`
- **Real developer skills** you can keep building on

This is where everything comes together.

---

## Part 1: Add Polish to Your Games

### Add CSS Animations

Open your `click-game.html` (from Session 2) and add these animations inside the existing `<style>` block:

```css
@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}

@keyframes celebrate {
    0% { transform: scale(1); }
    25% { transform: scale(1.2) rotate(5deg); }
    50% { transform: scale(1.2) rotate(-5deg); }
    75% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

.click-button:not(:disabled) {
    animation: pulse 1.5s infinite;
}
```

Now the click button gently pulses while the game is running, drawing the player's eye.

**How it works:**
- `@keyframes` defines an animation sequence (like a flipbook)
- `pulse` scales the button up and back over 1.5 seconds
- `infinite` makes it repeat forever
- `:not(:disabled)` only animates when the button is clickable

### Add a Celebration Effect

In the `endGame()` function in your click game, add this after the high score check:

```javascript
if (score > highScore) {
    highScore = score;
    highScoreDisplay.textContent = highScore;
    messageDisplay.textContent = 'NEW HIGH SCORE!';
    // Trigger celebration animation
    clickButton.style.animation = 'celebrate 0.6s ease';
    setTimeout(() => {
        clickButton.style.animation = '';
    }, 600);
}
```

### Add Persistent High Scores with localStorage

Right now, your high score resets when you refresh the page. Let us fix that.

In your click game, find the game state variables section and update:

```javascript
// Load saved high score (or start at 0)
let highScore = localStorage.getItem('clickGameHighScore')
    ? parseInt(localStorage.getItem('clickGameHighScore'))
    : 0;

// Display the saved high score on load
highScoreDisplay.textContent = highScore;
```

Then in `endGame()`, after updating `highScore`, save it:

```javascript
if (score > highScore) {
    highScore = score;
    highScoreDisplay.textContent = highScore;
    messageDisplay.textContent = 'NEW HIGH SCORE!';
    // Save to localStorage so it persists
    localStorage.setItem('clickGameHighScore', highScore);
}
```

**What is localStorage?**
- A small storage area in your browser that persists between page refreshes
- `setItem(key, value)` saves data
- `getItem(key)` retrieves it
- Data stays until you clear it or the user clears their browser data

### Test Your Polish

1. Open the click game with Live Server
2. Play a few rounds - verify the pulse animation works
3. Get a high score, then refresh the page - it should still be there
4. Open the browser console (`F12` > Console) and type `localStorage` to see your saved data

---

## Part 2: Build Your Portfolio Homepage

Now let us create a single page that ties all your work together.

### Create the Portfolio Page

Create a new file in your project root called `index.html`:

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
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            color: white;
            min-height: 100vh;
        }

        header {
            text-align: center;
            padding: 60px 20px 40px;
        }

        header h1 {
            font-size: 48px;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        header p {
            font-size: 20px;
            opacity: 0.8;
        }

        .games-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px 40px 60px;
        }

        .game-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            padding: 30px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .game-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
        }

        .game-card h2 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .game-card p {
            font-size: 16px;
            opacity: 0.8;
            margin-bottom: 15px;
            line-height: 1.5;
        }

        .game-card .tech-tags {
            margin-bottom: 20px;
        }

        .tech-tags span {
            display: inline-block;
            background: rgba(78, 205, 196, 0.3);
            color: #4ecdc4;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 13px;
            margin: 3px;
        }

        .play-button {
            display: inline-block;
            padding: 12px 30px;
            background: linear-gradient(135deg, #4ecdc4, #44a8a0);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .play-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(78, 205, 196, 0.4);
        }

        footer {
            text-align: center;
            padding: 30px;
            opacity: 0.6;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <header>
        <h1>My GameCraft Portfolio</h1>
        <p>Web games built with HTML, CSS, JavaScript, and React</p>
    </header>

    <div class="games-grid">
        <div class="game-card">
            <h2>Click Speed Challenge</h2>
            <p>Race against a 10-second timer. How fast can you click?</p>
            <div class="tech-tags">
                <span>HTML</span>
                <span>CSS</span>
                <span>JavaScript</span>
            </div>
            <a href="click-game.html" class="play-button">Play Now</a>
        </div>

        <div class="game-card">
            <h2>Gem Catcher</h2>
            <p>Catch falling gems with your basket before they hit the ground.</p>
            <div class="tech-tags">
                <span>HTML Canvas</span>
                <span>Animation</span>
                <span>JavaScript</span>
            </div>
            <a href="gem-catcher.html" class="play-button">Play Now</a>
        </div>

        <div class="game-card">
            <h2>Tic-Tac-Toe</h2>
            <p>A classic two-player strategy game built with React.</p>
            <div class="tech-tags">
                <span>React</span>
                <span>JSX</span>
                <span>Vite</span>
            </div>
            <a href="tictactoe/" class="play-button">Play Now</a>
        </div>
    </div>

    <footer>
        <p>Built during GameCraft &mdash; High School Web Game Development</p>
    </footer>
</body>
</html>
```

### Personalize It

1. Change the heading from "My GameCraft Portfolio" to your name or a creative title
2. Update the game descriptions to match what you built
3. If you customized a game (different colors, golden gems, etc.), mention that
4. Add any extra games you built during homework as new cards

---

## Part 3: Deploy to GitHub Pages

GitHub Pages turns your repository into a live website for free.

### Step 1: Make Sure Everything is Committed

```bash
git add .
git commit -m "Add portfolio page and polish games"
git push origin main
```

### Step 2: Enable GitHub Pages

1. Go to your repository on [github.com](https://github.com)
2. Click **Settings** (gear icon near the top)
3. In the left sidebar, click **Pages**
4. Under **Source**, select **Deploy from a branch**
5. Under **Branch**, select **main** and folder **/ (root)**
6. Click **Save**

### Step 3: Wait and Visit

- GitHub takes 1-2 minutes to build your site
- Your site will be live at: `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/`
- The URL appears at the top of the Pages settings when ready

### Step 4: Test Your Live Site

1. Visit your URL in the browser
2. Verify the portfolio page loads
3. Click each "Play Now" link to make sure the games work
4. Share the link with someone and have them try it

**Note about the React game:** The Tic-Tac-Toe game built with Vite needs to be built for production first. If you want it linked from your portfolio, run:

```bash
cd tictactoe
npm run build
```

Then copy the contents of the `dist/` folder into a `tictactoe/` folder in your main project. Or simply link to it as a separate GitHub Pages site.

---

## Part 4: Add a README

A good README tells other developers (and future you) what this project is about.

Create or edit `README.md` in your project root:

```markdown
# GameCraft Portfolio

A collection of web games built during the GameCraft high school program.

## Games

| Game | Description | Technologies |
|------|-------------|-------------|
| Click Speed Challenge | Race against the clock clicking game | HTML, CSS, JavaScript |
| Gem Catcher | Catch falling gems with a basket | HTML Canvas, JavaScript |
| Tic-Tac-Toe | Classic two-player strategy game | React, Vite |

## Play Online

Visit the live site: [https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/](https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/)

## Built With

- HTML5 and CSS3
- JavaScript (ES6+)
- React with Vite
- GitHub Pages for hosting

## What I Learned

- Building interactive web pages from scratch
- Game logic: timers, collision detection, win conditions
- Canvas animation with requestAnimationFrame
- React components, state, and props
- Version control with Git and GitHub
- Deploying websites with GitHub Pages
```

### Final Push

```bash
git add .
git commit -m "Add README and final polish"
git push origin main
```

---

## Your Turn - Keep Building

Now that you have a live portfolio and the skills to build web games, here are ideas for what to build next:

**Expand your existing games:**
- Add sound effects to the click game or gem catcher
- Build an AI opponent for tic-tac-toe
- Add difficulty levels that unlock as you play
- Create a leaderboard using localStorage

**Build something new:**
- **Snake Game** - Classic snake on a canvas grid
- **Memory Match** - Flip cards to find matching pairs (great for React)
- **Typing Speed Test** - Like the click game but with typing
- **Platformer** - A simple side-scrolling jump game with canvas

**Each new game you build:**
1. Create the HTML file in your project
2. Add a new card to your portfolio `index.html`
3. Commit and push to GitHub
4. It automatically appears on your live site

---

## What You Learned Today

- **CSS Animations** - `@keyframes` for visual polish
- **localStorage** - Saving data that persists between sessions
- **Portfolio Design** - Presenting your work professionally
- **GitHub Pages** - Deploying a website for free with a real URL
- **README Files** - Documenting your projects

---

## What You Learned Across All Four Sessions

| Session | Skills |
|---------|--------|
| Session 1 | HTML structure, CSS styling, JavaScript basics, CodePen |
| Session 2 | Event listeners, game state, timers, canvas animation, collision detection, VS Code, Git |
| Session 3 | React components, JSX, useState, props, modern tooling with Vite |
| Session 4 | CSS animations, localStorage, portfolio building, GitHub Pages deployment |

**You now have:**
- A working web game that runs in any browser
- Your own GitHub portfolio with published games
- Skills in HTML, CSS, JavaScript, and React
- The ability to turn your game ideas into reality

---

## Homework (Optional)

1. Build one more game and add it to your portfolio
2. Customize your portfolio design (background, fonts, layout)
3. Add a "dark mode / light mode" toggle to your portfolio
4. Share your portfolio URL with friends and family

---

## Common Issues

**Problem:** "GitHub Pages shows a 404"
**Solution:** Make sure your main page is named `index.html` (not `home.html` or another name). Check that Pages is enabled in Settings > Pages.

**Problem:** "Changes are not showing on the live site"
**Solution:** Push your changes (`git push origin main`) and wait 1-2 minutes. Hard refresh with `Cmd+Shift+R`.

**Problem:** "localStorage is not saving"
**Solution:** Make sure you are using `localStorage.setItem('key', value)` and `localStorage.getItem('key')`. Open DevTools > Application > Local Storage to inspect.

**Problem:** "The React game does not load on GitHub Pages"
**Solution:** React apps built with Vite need `npm run build` first. Copy the `dist/` folder output into your project, or deploy the React app as a separate GitHub Pages repo.

**Problem:** "My portfolio links are broken"
**Solution:** Use relative paths in `href` (e.g., `click-game.html` not `/click-game.html`). Make sure the file names match exactly, including capitalization.

---

## Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [CSS Animations - MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animations/Using_CSS_animations)
- [localStorage - MDN](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)
- [How to Write a Good README](https://www.makeareadme.com/)

---

**[Session 3](/highschool/session3/) | [Back to GameCraft Home](/highschool/)**
