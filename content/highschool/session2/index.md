---
layout: page
title: Session 2
subtitle: Build a Click Speed Game
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 2: Build a Click Speed Game

## What You Will Build Today

A "Click Speed Challenge" game where players race against a 10-second timer to click as many times as possible.

**Features:**
- 10-second countdown timer
- Click counter
- Start/Restart button
- High score tracking
- Victory message

---

## Setup

### Create a New Project

**In CodePen:**
1. Go to [codepen.io](https://codepen.io/)
2. Click **Start Coding**
3. Name it: `click-speed-challenge`
4. You will use all three panels: HTML, CSS, and JS

---

## Build the Game Structure

### HTML Structure

Start by creating the basic structure. In CodePen's HTML panel, type:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Click Speed Challenge</title>
</head>
<body>
    <div class="container">
        <h1>Click Speed Challenge</h1>
        
        <!-- Stats display -->
        <div class="game-info">
            <div class="stat">
                <p class="label">Time Left:</p>
                <p id="timer" class="value">10.0</p>
            </div>
            <!-- Add two more stat boxes for Clicks and High Score -->
        </div>

        <!-- Main click button -->
        <button id="clickButton" class="click-button" disabled>
            Click START to Begin!
        </button>

        <!-- Add a start button with id="startButton" -->

        <!-- Message display -->
        <div id="message" class="message"></div>
    </div>
</body>
</html>
```

### New Concepts:

- **`<div class="container">`** - Groups related elements together
- **`disabled`** - Makes a button unclickable until we are ready
- **Multiple elements with `id`s** - So we can control each one separately

### Your Turn - Complete the HTML:

1. **Add the Clicks stat:** Copy the "Time Left" stat box and modify it to show "Clicks" with `id="score"`
2. **Add the High Score stat:** Create another one for "High Score" with `id="highScore"`
3. **Add the start button:** Create a button with `id="startButton"` and text "START GAME"
4. **Customize:** Change the title to something creative ("Speed Clicker Pro"? "Finger Fury"?)
5. **Preview:** Check CodePen's preview - you should see your structure (plain for now)

---

## Style Your Game

### Add CSS Styling

In CodePen's CSS panel, add these styles. Notice we are using a dark background so colors show up clearly:

```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
}

.container {
    text-align: center;
    background: rgba(255, 255, 255, 0.1);
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
    backdrop-filter: blur(10px);
}

h1 {
    font-size: 42px;
    margin-bottom: 30px;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

.game-info {
    display: flex;
    justify-content: space-around;
    margin-bottom: 30px;
    gap: 20px;
}

.stat {
    background: rgba(255, 255, 255, 0.2);
    padding: 15px 25px;
    border-radius: 12px;
    min-width: 120px;
}

.label {
    font-size: 14px;
    opacity: 0.9;
    margin-bottom: 5px;
}

.value {
    font-size: 32px;
    font-weight: bold;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
}

/* You will style the click button - make it big and round! */
.click-button {
    width: 300px;
    height: 300px;
    font-size: 28px;
    font-weight: bold;
    /* Add your button colors here */
    color: white;
    border: none;
    border-radius: 50%;
    cursor: pointer;
    margin: 20px 0;
}

/* Add hover and active effects for your button */

/* Style the start button */
.start-button {
    font-size: 20px;
    padding: 15px 40px;
    /* Add your button color here */
    color: white;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    margin-top: 20px;
}

.message {
    margin-top: 20px;
    font-size: 24px;
    font-weight: bold;
    min-height: 30px;
}
```

### Your Turn - Complete the Styling:

1. **Style the click button:** Add a background color or gradient (try `background: #e74c3c;` or `background: linear-gradient(135deg, #ff6b6b, #ee5252);`)
2. **Add button effects:** Make it scale on hover: `.click-button:hover { transform: scale(1.05); }`
3. **Style the start button:** Pick a color (try `background-color: #27ae60;` for green)
4. **Experiment:** Try different colors, sizes, or border-radius values
5. **Preview:** Your game should look colorful and inviting now

---

## Add Game Logic

### JavaScript - The Game Brain

In CodePen's JS panel, let us build the game logic step by step:

```javascript
// 1. GET ALL THE ELEMENTS
const clickButton = document.getElementById('clickButton');
const startButton = document.getElementById('startButton');
const timerDisplay = document.getElementById('timer');
const scoreDisplay = document.getElementById('score');
const highScoreDisplay = document.getElementById('highScore');
const messageDisplay = document.getElementById('message');

// 2. GAME STATE VARIABLES
let score = 0;
let timeLeft = 10;
let highScore = 0;
let gameRunning = false;
let timerInterval = null;

// 3. HANDLE CLICK BUTTON
clickButton.addEventListener('click', function() {
    if (gameRunning) {
        score++;
        scoreDisplay.textContent = score;
        
        // Add animation feedback
        clickButton.style.transform = 'scale(0.95)';
        setTimeout(() => {
            clickButton.style.transform = 'scale(1)';
        }, 100);
    }
});

// 4. HANDLE START BUTTON
startButton.addEventListener('click', function() {
    startGame();
});

// 5. START GAME FUNCTION
function startGame() {
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
    
    // Start the countdown (calls updateTimer every 0.1 seconds)
    timerInterval = setInterval(updateTimer, 100);
}

// 6. UPDATE TIMER - YOU COMPLETE THIS
function updateTimer() {
    timeLeft -= 0.1;
    
    if (timeLeft <= 0) {
        endGame();
    } else {
        // Update the timer display (use .toFixed(1) to show one decimal)
        // YOUR CODE HERE
    }
}

// 7. END GAME - YOU COMPLETE THIS
function endGame() {
    gameRunning = false;
    clearInterval(timerInterval);
    
    clickButton.disabled = true;
    clickButton.textContent = "Time's Up!";
    
    startButton.disabled = false;
    startButton.textContent = 'PLAY AGAIN';
    
    // Check if this is a new high score
    // If score > highScore:
    //   - Update highScore
    //   - Display high score
    //   - Show "NEW HIGH SCORE!" message
    // Otherwise:
    //   - Show regular game over message
    // YOUR CODE HERE
    
    timerDisplay.textContent = '0.0';
}
```

### Understanding the Key Concepts

**Important concepts:**

1. **Variables store game state:** `score`, `timeLeft`, `gameRunning`
2. **`setInterval(updateTimer, 100)`** - Runs `updateTimer` every 100 milliseconds (0.1 seconds)
3. **`clearInterval()`** - Stops the repeating timer
4. **`.toFixed(1)`** - Rounds numbers to 1 decimal place (9.9999 becomes "10.0")

### Your Turn - Complete the JavaScript:

1. **Fix `updateTimer()`:** Make it update the timer display using `timerDisplay.textContent = timeLeft.toFixed(1);`
2. **Fix `endGame()`:** Add the high score logic:
   ```javascript
   if (score > highScore) {
       highScore = score;
       highScoreDisplay.textContent = highScore;
       messageDisplay.textContent = 'NEW HIGH SCORE!';
   } else {
       messageDisplay.textContent = 'Game Over! Your score: ' + score;
   }
   ```
3. **Test it:** Click START and play the game - does everything work?
4. **Customize:** Change the button text, game duration, or add your own message

---

## Test and Extend Your Game

### Full Testing Checklist:

1. Click START - does the timer count down?
2. Click the big button - does the score increase?
3. Wait for time to run out - does it show the correct message?
4. Play again and beat your score - does it say "NEW HIGH SCORE"?

### Extra Challenges:

Once your game works, try adding these features:

**Polish and Effects:**

1. Make the button change colors randomly with each click
2. Add a pulsing animation to the button during the game
3. Display different messages based on score (0-15: "Keep trying!", 16-25: "Good!", 26+: "Amazing!")

**New Features:**

4. Add difficulty levels with different time limits (Easy: 15s, Medium: 10s, Hard: 5s)
5. Show clicks-per-second at the end: `const cps = (score / 10).toFixed(1);`
6. Add sound effects when clicking (hint: look up HTML `<audio>` tag)

**Advanced:**

7. Save high score in `localStorage` so it persists even after refreshing (see solution below)
8. Make the button shrink slightly with each click, then reset when time is up

---

## Advanced: Save High Score Forever

Want your high score to persist even after closing the browser? Use `localStorage`:

**At the top of your JavaScript (after getting elements):**
```javascript
// Load saved high score
highScore = parseInt(localStorage.getItem('clickGameHighScore')) || 0;
highScoreDisplay.textContent = highScore;
```

**In `endGame()`, after updating the high score:**
```javascript
localStorage.setItem('clickGameHighScore', highScore);
```

Now your high score saves automatically!

---

## What You Learned Today

- **Intervals and Timers** - `setInterval()`, `clearInterval()`  
- **Game State Management** - Tracking multiple variables  
- **Conditional Logic** - `if` statements to control game flow  
- **Enable/Disable UI** - Controlling when buttons work  
- **Number Formatting** - `.toFixed()` for decimals  
- **Game Loop Concept** - Repeating functions that update the game

---

## Next Session Preview

**Session 3:** We will add **animation and movement** - build a "Catch the Falling Objects" game with moving elements.

---

## Homework (Optional)

1. Add a "Best Time" feature - track the fastest time to reach 50 clicks
2. Create sound effects (hint: use the Web Audio API or `<audio>` tag)
3. Add a lives system where missing clicks costs a life
4. Make the button move around the screen randomly!

---

## Common Issues

**Problem:** "Timer does not count down"  
**Solution:** Check that `setInterval(updateTimer, 100)` is called in `startGame()`

**Problem:** "Cannot click button after starting"  
**Solution:** Make sure `clickButton.disabled = false;` is in `startGame()`

**Problem:** "High score does not update"  
**Solution:** Check the `if (score > highScore)` condition in `endGame()`

---

## Resources

- [setInterval() - MDN](https://developer.mozilla.org/en-US/docs/Web/API/setInterval)
- [Event Listeners - MDN](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
- [localStorage - MDN](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)

---

## Need Help?

**[View Complete Solution Code →](/highschool/session2-solution/)**

If you are stuck or need to catch up, check out the complete working code with all the missing parts filled in.

---

**[← Session 1](/highschool/session1/) | [Back to GameCraft Home](/highschool/) | [Next: Session 3 →](/highschool/session3/)**
