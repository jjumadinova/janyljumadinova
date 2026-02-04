---
layout: page
title: Session 2 Solution
subtitle: Complete Code for Click Speed Game
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 2: Complete Solution Code

This page contains the complete, working code for the Click Speed Challenge game. Use this if you need help or want to check your work.

---

## Complete HTML

In CodePen's HTML panel:

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

---

## Complete CSS

In CodePen's CSS panel:

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
    background-color: #27ae60;
    color: white;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
    transition: all 0.3s ease;
    margin-top: 20px;
}

.start-button:hover {
    background-color: #229954;
    transform: translateY(-2px);
}

.start-button:disabled {
    background-color: gray;
    cursor: not-allowed;
    opacity: 0.5;
}

.message {
    margin-top: 20px;
    font-size: 24px;
    font-weight: bold;
    min-height: 30px;
}
```

---

## Complete JavaScript

In CodePen's JS panel:

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

// 6. UPDATE TIMER FUNCTION
function updateTimer() {
    timeLeft -= 0.1;
    
    if (timeLeft <= 0) {
        endGame();
    } else {
        timerDisplay.textContent = timeLeft.toFixed(1);
    }
}

// 7. END GAME FUNCTION
function endGame() {
    gameRunning = false;
    clearInterval(timerInterval);
    
    clickButton.disabled = true;
    clickButton.textContent = "Time's Up!";
    
    startButton.disabled = false;
    startButton.textContent = 'PLAY AGAIN';
    
    // Check if this is a new high score
    if (score > highScore) {
        highScore = score;
        highScoreDisplay.textContent = highScore;
        messageDisplay.textContent = 'NEW HIGH SCORE!';
    } else {
        messageDisplay.textContent = 'Game Over! Your score: ' + score;
    }
    
    timerDisplay.textContent = '0.0';
}
```

---

## How to Use This Code

### In CodePen:
1. Copy the HTML code into the HTML panel
2. Copy the CSS code into the CSS panel
3. Copy the JavaScript code into the JS panel
4. The game should work immediately!

### In VS Code:
1. Create a new file called `click-game.html`
2. Paste the HTML code
3. Add the CSS inside `<style>` tags in the `<head>`
4. Add the JavaScript inside `<script>` tags before `</body>`

---

**[← Back to Session 2](/highschool/session2/)**
