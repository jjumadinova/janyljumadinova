---
layout: page
title: Session 2
subtitle: Game Time - Click Speed and Gem Catcher
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 2: Game Time - Click Speed and Gem Catcher

**Goal:** Set up VS Code and GitHub, then complete two games by adding the key logic yourself
**Prerequisites:** Session 1 (HTML, CSS, JavaScript basics)

---

## What You Will Build Today

You will start with **starter code** that has the HTML, CSS, and structure already built. Your job is to fill in the **game logic** — the JavaScript that makes the games actually work.

**Game 1 - Click Speed Challenge:** Race against a 10-second timer to click as many times as possible.
You will add: the click handler, start game setup, and end game logic.

**Game 2 - Gem Catcher:** Catch colorful falling gems by moving a basket with your mouse or keyboard.
You will add: collision detection, scoring, lives tracking, and gem spawning — building on the same patterns from Game 1.

---

## Part 1: Set Up Your Developer Environment

In Session 1 we used CodePen to write code in the browser. Now we are switching to **VS Code** — a real code editor that professional developers use. This gives us files on our computer, Git version control, and the ability to build bigger projects.

### Open VS Code and Install Live Server

1. Open VS Code
2. Install the **Live Server** extension:
   - Click the Extensions icon in the left sidebar (or press `Cmd+Shift+X`)
   - Search for "Live Server" by Ritwick Dey
   - Click **Install**

### Clone the Starter Code

1. Open the VS Code terminal: **Terminal > New Terminal** (or press `` Ctrl+` ``)
2. Clone the starter code repository your teacher provided:

```bash
git clone <REPOSITORY-URL>
cd session2-starter
```

3. You should see these files in VS Code:
   - `click-game.html` — Click Speed Challenge (with TODOs)
   - `gem-catcher.html` — Gem Catcher (with TODOs)
   - `README.md` — Instructions

### Preview the Starter Code

1. Right-click `click-game.html` in the file explorer
2. Select **Open with Live Server**
3. You should see the game layout — but clicking does nothing yet! That is what you will fix.

---

## Part 2: Click Speed Challenge

Open `click-game.html` in VS Code. The HTML structure, CSS styling, element selectors, and game state variables are already written for you. Look for the `// TODO` comments — those are the parts you need to complete.

### Understanding What is Already There

Scroll through the code and notice:

| Already Built | What It Does |
|---------------|-------------|
| HTML structure | Buttons, score display, timer display |
| CSS styling | Colors, layout, animations |
| `document.getElementById()` | Grabs each element so JavaScript can control it |
| Game state variables | `score`, `timeLeft`, `highScore`, `gameRunning` |
| `updateTimer()` function | Counts down every 0.1 seconds |
| Start button event listener | Calls `startGame()` when clicked |

### TODO 1: Handle the Click Button

Find this section in the code:

```javascript
clickButton.addEventListener('click', function() {
    // TODO 1: Handle the click!
```

**Your task:** When the game is running, add 1 to the score and update the display.

**Write this code:**

```javascript
if (gameRunning) {
    score++;
    scoreDisplay.textContent = score;
}
```

**What you just learned:**
- `addEventListener('click', ...)` runs code when a button is clicked
- `score++` is shorthand for `score = score + 1`
- `.textContent` changes what text appears on screen

### TODO 2: Start the Game

Find:

```javascript
function startGame() {
    // TODO 2: Set up the game to start!
```

**Your task:** Reset everything and start the timer.

**Write this code:**

```javascript
score = 0;
timeLeft = 10;
gameRunning = true;
messageDisplay.textContent = '';

scoreDisplay.textContent = score;
timerDisplay.textContent = timeLeft.toFixed(1);

clickButton.disabled = false;
clickButton.textContent = 'CLICK ME!';

startButton.textContent = 'Game Running...';
startButton.disabled = true;

timerInterval = setInterval(updateTimer, 100);
```

**What you just learned:**
- Resetting variables to their starting values
- `.toFixed(1)` shows one decimal place (10.0 instead of 10)
- `.disabled = false` makes a button clickable again
- `setInterval(fn, 100)` calls a function every 100 milliseconds (0.1 seconds)

### TODO 3: End the Game

Find:

```javascript
function endGame() {
    // TODO 3: End the game!
```

**Your task:** Stop the timer, disable the button, and check for a high score.

**Write this code:**

```javascript
gameRunning = false;
clearInterval(timerInterval);

clickButton.disabled = true;
clickButton.textContent = "Time's Up!";

startButton.disabled = false;
startButton.textContent = 'PLAY AGAIN';

if (score > highScore) {
    highScore = score;
    highScoreDisplay.textContent = highScore;
    messageDisplay.textContent = 'NEW HIGH SCORE!';
} else {
    messageDisplay.textContent = 'Game Over! Your score: ' + score;
}

timerDisplay.textContent = '0.0';
```

**What you just learned:**
- `clearInterval()` stops a repeating timer
- `if/else` makes decisions based on conditions
- String concatenation with `+` combines text and numbers

### Test It!

Save the file and check your browser. The game should now work:
- Click START → timer counts down
- Click the big button → score goes up
- Time runs out → shows your score and tracks high score

### Quick Customizations

Pick one:
1. Change `timeLeft = 10` to `5` for hard mode
2. Change the button gradient colors in the CSS
3. Add `const cps = (score / 10).toFixed(1);` in endGame and display clicks-per-second

### Save Your Progress

```bash
git add click-game.html
git commit -m "Complete click speed challenge"
```

---

## Part 3: Gem Catcher - Expanding Your Skills

Now open `gem-catcher.html`. This game uses the **exact same patterns** you just learned — score tracking, conditional logic, game state — but adds **canvas animation**.

### What is Canvas?

The `<canvas>` element is like a blank drawing board. JavaScript paints shapes and animations on it frame by frame, just like a flipbook.

### What is Already Built

Take a look through the code:

| Already Built | What It Does |
|---------------|-------------|
| Canvas setup | `getContext('2d')` creates the drawing tool |
| Basket object | Position, size, speed, color stored in one object |
| `createGem()` | Makes a new gem with random position and color |
| Drawing functions | `drawBasket()`, `drawGem()`, `clearCanvas()` |
| Mouse + keyboard controls | Move the basket left and right |
| `startGame()` / `endGame()` | Reset and end the game |
| Game loop structure | The `gameLoop()` runs 60 times per second |

The game loop already moves gems downward and draws them. But gems pass right through the basket! You need to add the logic that makes catching and missing actually work.

### TODO 1: Collision Detection

Find:

```javascript
function checkCollision(gem, basket) {
    // TODO 1: Check if a gem is touching the basket!
```

**Your task:** Two rectangles overlap when all four of these conditions are true at the same time. Return `true` when they overlap.

**Replace `return false;` with:**

```javascript
return gem.x < basket.x + basket.width &&
       gem.x + gem.width > basket.x &&
       gem.y < basket.y + basket.height &&
       gem.y + gem.height > basket.y;
```

**What you just learned:**
- Collision detection = checking if two rectangles overlap
- `&&` means AND — all conditions must be true
- This is the same `if` logic from the Click Speed game, just with more conditions combined

### TODO 2: Score a Caught Gem

Find:

```javascript
// TODO 2: Update the score when a gem is caught!
```

**Your task:** Just like in the Click Speed game — add 1 to score and update the display. Then remove the gem.

**Write this code:**

```javascript
score++;
scoreDisplay.textContent = score;
gems.splice(i, 1);
continue;
```

**Connection to Game 1:** This is the exact same `score++` and `scoreDisplay.textContent = score` pattern! The new part is `splice(i, 1)` which removes the caught gem from the array.

### TODO 3: Handle a Missed Gem

Find:

```javascript
// TODO 3: Handle a missed gem!
```

**Your task:** When a gem falls off screen, lose a life. If lives hit zero, end the game.

**Write this code:**

```javascript
lives--;
livesDisplay.textContent = lives;
gems.splice(i, 1);

if (lives <= 0) {
    endGame();
    return;
}
continue;
```

**Connection to Game 1:** In the Click Speed game, the game ended when time ran out. Here it ends when lives run out — same pattern, different trigger.

### TODO 4: Spawn New Gems

Find:

```javascript
// TODO 4: Spawn new gems randomly!
```

**Your task:** Each frame, there is a small random chance a new gem appears.

**Write this code:**

```javascript
if (Math.random() < 0.02) {
    gems.push(createGem());
}
```

**What you just learned:**
- `Math.random()` returns a number between 0 and 1
- `< 0.02` means roughly 2% chance each frame ≈ 1-2 new gems per second
- `.push()` adds an item to an array

### Test It!

Save and check your browser:
1. Gems should fall from the top
2. Moving the basket under a gem catches it (score goes up)
3. Missing a gem costs a life
4. Game ends when lives reach 0

### Key Concepts Comparison

| Concept | Click Speed Game | Gem Catcher |
|---------|-----------------|-------------|
| Score tracking | `score++` on click | `score++` on catch |
| Game end condition | Time runs out | Lives run out |
| User input | Button click | Mouse / keyboard movement |
| Display update | `textContent` | `textContent` + canvas redraw |
| Timing | `setInterval` (fixed) | `requestAnimationFrame` (smooth) |

### Your Turn - Customize

Pick one or more:
1. **Change gem colors:** Edit the `colors` array in `createGem()`
2. **Adjust difficulty:** Change `0.02` (spawn rate) or gem `speed` values
3. **More lives:** Change `lives = 3` to `lives = 5` in `startGame()`
4. **Wider basket:** Change `basket.width` from `100` to `150`
5. **Golden gems (challenge):** Add rare gems worth 5 points:

```javascript
// In createGem(), before the return statement:
const isGolden = Math.random() < 0.1; // 10% chance

// Change the return to include:
return {
    x: Math.random() * (canvas.width - 30),
    y: -30,
    width: 30,
    height: 30,
    speed: 2 + Math.random() * 2,
    color: isGolden ? '#FFD700' : randomColor,
    points: isGolden ? 5 : 1,
    caught: false
};
// Then in TODO 2, change: score++ to: score += gem.points;
```

### Save and Push to GitHub

```bash
git add .
git commit -m "Complete click speed and gem catcher games"
git push origin main
```

---

## What You Learned Today

**Developer Tools:**
- VS Code with Live Server for instant preview
- Git for saving progress and pushing to GitHub

**JavaScript Patterns (used in BOTH games):**
- **Event listeners** — responding to clicks, mouse moves, and key presses
- **Game state variables** — tracking score, time, lives
- **Conditional logic** — `if/else` for decisions (high score check, collision, game over)
- **DOM updates** — changing what players see with `.textContent`

**New in Gem Catcher (building on Click Speed):**
- **HTML Canvas** — drawing graphics with JavaScript
- **Animation loops** — `requestAnimationFrame()` for smooth 60fps movement
- **Collision detection** — checking if rectangles overlap
- **Arrays** — managing multiple gems with `push()` and `splice()`

---

## Homework (Optional)

1. **Click Game:** Add difficulty levels (Easy: 15s, Medium: 10s, Hard: 5s)
2. **Click Game:** Save high score with `localStorage` so it persists after closing
3. **Gem Catcher:** Add "bomb" objects that cost a life if caught
4. **Gem Catcher:** Make gems fall faster as your score increases
5. **Both:** Change the visual theme (colors, gradients, title text)

---

## Common Issues

**Problem:** "Page looks right but clicking does nothing"
**Solution:** Check that your TODO code is inside the correct function, not outside the curly braces

**Problem:** "Timer does not count down"
**Solution:** Make sure `setInterval(updateTimer, 100)` is in your `startGame()` function

**Problem:** "Gems pass through the basket"
**Solution:** Check your collision detection — all four `&&` conditions must be correct

**Problem:** "Score does not go up when catching gems"
**Solution:** Make sure you have both `score++` and `scoreDisplay.textContent = score`

**Problem:** "Gems never appear"
**Solution:** Check TODO 4 — make sure `gems.push(createGem())` is inside the `if (Math.random() < 0.02)` block

**Problem:** "Git push failed"
**Solution:** `git remote -v` — if empty, add your remote: `git remote add origin YOUR-URL`

---

## Resources

- [addEventListener - MDN](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
- [setInterval - MDN](https://developer.mozilla.org/en-US/docs/Web/API/setInterval)
- [Canvas API - MDN](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API)
- [requestAnimationFrame - MDN](https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame)

---

**[← Session 1](/highschool/session1/) | [Back to GameCraft Home](/highschool/) | [Next: Session 3 - React →](/highschool/session3/)**
