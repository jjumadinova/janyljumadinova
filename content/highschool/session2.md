---
layout: page
title: Session 2
subtitle: Build a Click Speed Game
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 2: Build a Click Speed Game ⚡

**Time:** 1 hour  
**Goal:** Build a real game with a timer, score tracking, and restart functionality  
**Prerequisites:** Session 1 (HTML, CSS, JavaScript basics)

---

## 🎯 What You'll Build Today

A "Click Speed Challenge" game where players race against a 10-second timer to click as many times as possible!

**Features:**
- 10-second countdown timer
- Click counter
- Start/Restart button
- High score tracking
- Victory message

**[See the finished example →](your-demo-link-here)**

---

## 🚀 Setup (5 minutes)

### Create a New Project

**In Replit:**
1. Click **+ Create Repl**
2. Choose **HTML, CSS, JS**
3. Name it: `gamecraft-session2`

**Or continue in VS Code:** Create a new file `click-game.html`

---

## 📖 Part 1: Build the Game Structure (10 minutes)

### Step 1: HTML Structure

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
        <h1>⚡ Click Speed Challenge ⚡</h1>
        
        <div class="game-info">
            <div class="stat">
                <p class="label">Time Left:</p>
                <p id="timer" class="value">10.0</p>
            </div>
            <div class="stat">
                <p class="label">Clicks:</p>
                <p id="score" class="value">0</p>
            </div>
            <div class="stat">
                <p class="label">High Score:</p>
                <p id="highScore" class="value">0</p>
            </div>
        </div>

        <button id="clickButton" class="click-button" disabled>
            Click START to Begin!
        </button>

        <button id="startButton" class="start-button">
            START GAME
        </button>

        <div id="message" class="message"></div>
    </div>
</body>
</html>
```

### 🔍 New Concepts:

- **`<div class="container">`** - Groups related elements together
- **`disabled`** - Makes a button unclickable until we're ready
- **Multiple elements with `id`s** - So we can control each one separately

---

## 🎨 Part 2: Style Your Game (10 minutes)

### Step 2: Add CSS Inside `<head>`

```html
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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

    .click-button {
        width: 300px;
        height: 300px;
        font-size: 28px;
        font-weight: bold;
        background: linear-gradient(135deg, #ff6b6b, #ee5a52);
        color: white;
        border: none;
        border-radius: 50%;
        cursor: pointer;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
        transition: all 0.1s ease;
        margin: 20px 0;
    }

    .click-button:hover:not(:disabled) {
        transform: scale(1.05);
    }

    .click-button:active:not(:disabled) {
        transform: scale(0.95);
    }

    .click-button:disabled {
        background: gray;
        cursor: not-allowed;
        opacity: 0.5;
    }

    .start-button {
        font-size: 20px;
        padding: 15px 40px;
        background-color: #4ecdc4;
        color: white;
        border: none;
        border-radius: 50px;
        cursor: pointer;
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        transition: all 0.3s ease;
        margin-top: 20px;
    }

    .start-button:hover {
        background-color: #3dbdb3;
        transform: translateY(-2px);
    }

    .message {
        margin-top: 20px;
        font-size: 24px;
        font-weight: bold;
        min-height: 30px;
        animation: fadeIn 0.5s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
</style>
```

### ✅ Test It!

You should see a beautiful game interface with a big round button!

---

## ⚡ Part 3: Add Game Logic (25 minutes)

### Step 3: JavaScript - The Game Brain

Add this right before `</body>`:

```html
<script>
    // 1. GET ALL THE ELEMENTS WE NEED
    const clickButton = document.getElementById('clickButton');
    const startButton = document.getElementById('startButton');
    const timerDisplay = document.getElementById('timer');
    const scoreDisplay = document.getElementById('score');
    const highScoreDisplay = document.getElementById('highScore');
    const messageDisplay = document.getElementById('message');

    // 2. GAME STATE VARIABLES
    let score = 0;              // Current clicks
    let timeLeft = 10;          // Seconds remaining
    let highScore = 0;          // Best score ever
    let gameRunning = false;    // Is the game active?
    let timerInterval = null;   // Stores the timer so we can stop it

    // 3. HANDLE CLICK BUTTON
    clickButton.addEventListener('click', function() {
        if (gameRunning) {
            // Add 1 to the score
            score++;
            scoreDisplay.textContent = score;
            
            // Fun feedback: briefly change color
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
        // Reset everything
        score = 0;
        timeLeft = 10;
        gameRunning = true;
        messageDisplay.textContent = '';
        
        // Update displays
        scoreDisplay.textContent = score;
        timerDisplay.textContent = timeLeft.toFixed(1);
        
        // Enable click button
        clickButton.disabled = false;
        clickButton.textContent = 'CLICK ME!';
        
        // Change start button to show game is running
        startButton.textContent = 'Game Running...';
        startButton.disabled = true;
        
        // Start the countdown timer
        timerInterval = setInterval(updateTimer, 100); // Update every 0.1 seconds
    }

    // 6. UPDATE TIMER FUNCTION
    function updateTimer() {
        timeLeft -= 0.1; // Subtract 0.1 seconds
        
        if (timeLeft <= 0) {
            // Time's up!
            endGame();
        } else {
            // Update the display
            timerDisplay.textContent = timeLeft.toFixed(1);
        }
    }

    // 7. END GAME FUNCTION
    function endGame() {
        gameRunning = false;
        
        // Stop the timer
        clearInterval(timerInterval);
        
        // Disable click button
        clickButton.disabled = true;
        clickButton.textContent = 'Time\'s Up!';
        
        // Re-enable start button
        startButton.disabled = false;
        startButton.textContent = 'PLAY AGAIN';
        
        // Check if this is a high score
        if (score > highScore) {
            highScore = score;
            highScoreDisplay.textContent = highScore;
            messageDisplay.textContent = '🎉 NEW HIGH SCORE! 🎉';
        } else {
            messageDisplay.textContent = 'Game Over! Your score: ' + score;
        }
        
        // Reset timer display to 0
        timerDisplay.textContent = '0.0';
    }
</script>
```

### 🔍 Let's Understand the Magic!

**Key Concepts:**

1. **Variables store game state:**
   - `let score = 0` - Tracks current clicks
   - `let gameRunning = false` - Tells us if the game is active

2. **`setInterval(function, time)`** - Runs a function repeatedly
   - We use it to countdown the timer every 0.1 seconds
   - `setInterval(updateTimer, 100)` means "run updateTimer every 100 milliseconds"

3. **`clearInterval(timerInterval)`** - Stops the repeating function
   - Called when time runs out

4. **`.toFixed(1)`** - Rounds numbers to 1 decimal place
   - Turns `9.9999` into `"10.0"`

5. **Enabling/Disabling buttons:**
   - `button.disabled = true` - Makes button gray and unclickable
   - `button.disabled = false` - Makes button active again

---

## 🎮 Part 4: Test and Customize (10 minutes)

### ✅ Full Testing Checklist:

1. Click START - does the timer count down?
2. Click the big button - does the score increase?
3. Wait for time to run out - does it show "Time's Up!"?
4. Play again and beat your score - does it say "NEW HIGH SCORE"?

### 🎨 Customization Challenges:

**Easy:**
1. Change the game duration (change `timeLeft = 10` to a different number)
2. Change the button colors in CSS

**Medium:**
3. Make the button change color as you click it (hint: use an array of colors!)
4. Add a clicks-per-second calculator

**Hard:**
5. Add difficulty levels: Easy (15 seconds), Medium (10 seconds), Hard (5 seconds)
6. Save high score in `localStorage` so it persists even after refreshing

---

## 💡 Challenge Solutions

### Challenge #4: Clicks Per Second

Add this to the `endGame()` function:

```javascript
const clicksPerSecond = (score / 10).toFixed(1);
messageDisplay.textContent += ' (' + clicksPerSecond + ' clicks/sec)';
```

### Challenge #6: Persistent High Score

Add this at the TOP of your script (after getting elements):

```javascript
// Load high score from browser storage
highScore = parseInt(localStorage.getItem('clickGameHighScore')) || 0;
highScoreDisplay.textContent = highScore;
```

And in `endGame()`, after updating high score:

```javascript
// Save to browser storage
localStorage.setItem('clickGameHighScore', highScore);
```

---

## 📚 What You Learned Today

✅ **Intervals and Timers** - `setInterval()`, `clearInterval()`  
✅ **Game State Management** - Tracking multiple variables  
✅ **Conditional Logic** - `if` statements to control game flow  
✅ **Enable/Disable UI** - Controlling when buttons work  
✅ **Number Formatting** - `.toFixed()` for decimals  
✅ **Game Loop Concept** - Repeating functions that update the game

---

## 🚀 Next Session Preview

**Session 3:** We'll add **animation and movement** - build a "Catch the Falling Objects" game with moving elements!

---

## 📦 Homework (Optional)

1. Add a "Best Time" feature - track the fastest time to reach 50 clicks
2. Create sound effects (hint: use the Web Audio API or `<audio>` tag)
3. Add a lives system where missing clicks costs a life
4. Make the button move around the screen randomly!

---

## 🆘 Common Issues

**Problem:** "Timer doesn't count down"  
**Solution:** Check that `setInterval(updateTimer, 100)` is called in `startGame()`

**Problem:** "Can't click button after starting"  
**Solution:** Make sure `clickButton.disabled = false;` is in `startGame()`

**Problem:** "High score doesn't update"  
**Solution:** Check the `if (score > highScore)` condition in `endGame()`

---

## 📖 Resources

- [setInterval() - MDN](https://developer.mozilla.org/en-US/docs/Web/API/setInterval)
- [Event Listeners - MDN](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
- [localStorage - MDN](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)

---

**[← Session 1](/highschool/session1/) | [Back to GameCraft Home](/highschool/) | [Next: Session 3 →](/highschool/session3/)**
