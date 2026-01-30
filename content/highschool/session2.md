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

**[See the finished example →](your-demo-link-here)**

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

### New Concepts:

- **`<div class="container">`** - Groups related elements together
- **`disabled`** - Makes a button unclickable until we are ready
- **Multiple elements with `id`s** - So we can control each one separately

### Your Turn:

Before moving on, try this:
1. Change the title text to something creative
2. Add another stat display (maybe "Best Time" or "Lives")
3. Save and open your HTML file in a browser - what do you see?

---

## Style Your Game

### Add CSS Inside `<head>`

```html
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #4a5fc1 0%, #5a3a7a 100%);
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
        background: linear-gradient(135deg, #e74c3c, #c0392b);
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
        background-color: #16a085;
        color: white;
        border: none;
        border-radius: 50px;
        cursor: pointer;
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        transition: all 0.3s ease;
        margin-top: 20px;
    }

    .start-button:hover {
        background-color: #138d75;
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

### Test It

You should see a beautiful game interface with a big round button.

### Your Turn:

Experiment with the styles:
1. Change the background gradient colors (try different color codes)
2. Make the click button a different size (change width and height)
3. Change the button shape by modifying `border-radius` (try `20px` instead of `50%`)
4. Pick your favorite design before moving to the next section

---

## Add Game Logic

### JavaScript - The Game Brain

Add this JavaScript code:

```javascript
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
            messageDisplay.textContent = 'NEW HIGH SCORE!';
        } else {
            messageDisplay.textContent = 'Game Over! Your score: ' + score;
        }
        
        // Reset timer display to 0
        timerDisplay.textContent = '0.0';
    }
```

### Understanding the Key Concepts

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

### Your Turn:

Now customize the game:
1. Change the game duration to 15 seconds (find `timeLeft = 10` and change it)
2. Modify the click button text to say something different when the game is running
3. Test your game - does it work?
4. Try to beat your own high score

---

## Test and Customize

### Full Testing Checklist:

1. Click START - does the timer count down?
2. Click the big button - does the score increase?
3. Wait for time to run out - does it show "Time's Up!"?
4. Play again and beat your score - does it say "NEW HIGH SCORE"?

### Challenge Yourself:

Pick one or more to try:

**Make it yours:**
1. Add sound effects when clicking (hint: look up HTML `<audio>` tag)
2. Make the click button pulse or animate between clicks
3. Add encouraging messages based on score ranges (0-10: "Keep trying!", 11-20: "Good job!", 21+: "Amazing!")

**Level up:**
4. Make the button change color as you click it (hint: use an array of colors!)
5. Add a clicks-per-second calculator that displays at the end
6. Create difficulty buttons: Easy (15 sec), Medium (10 sec), Hard (5 sec)

**Advanced:**
7. Save high score in `localStorage` so it persists even after refreshing
8. Make the button shrink slightly with each click, then reset when time is up

---

## Challenge Solutions

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

**[← Session 1](/highschool/session1/) | [Back to GameCraft Home](/highschool/) | [Next: Session 3 →](/highschool/session3/)**
