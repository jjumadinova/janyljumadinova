---
layout: page
title: Session 3
subtitle: Animation and Falling Objects
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 3: Catch the Falling Gems! 💎

## 🎯 What You'll Build Today

A "Gem Catcher" game where colorful gems fall from the sky and you move a basket to catch them!

**Features:**
- Moving gems that fall down the screen
- Player basket controlled by keyboard or mouse
- Collision detection (did we catch it?)
- Score tracking
- Game over when you miss 3 gems

**[See the finished example →](your-demo-link-here)**

---

## 🚀 Setup (5 minutes)

Create a new Repl or file: `gem-catcher.html`

---

## 📖 Part 1: HTML Canvas Setup (10 minutes)

### Step 1: The HTML Structure

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gem Catcher Game</title>
</head>
<body>
    <div class="container">
        <h1>💎 Gem Catcher 💎</h1>
        
        <div class="game-stats">
            <div class="stat">Score: <span id="score">0</span></div>
            <div class="stat">Lives: <span id="lives">3</span></div>
        </div>

        <canvas id="gameCanvas" width="600" height="500"></canvas>
        
        <div class="controls">
            <p>🖱️ Move your mouse to control the basket</p>
            <p>Or use ← → arrow keys</p>
            <button id="startButton">START GAME</button>
        </div>

        <div id="message" class="message"></div>
    </div>
</body>
</html>
```

### 🔍 What's New?

**`<canvas>`** - An HTML element where we can draw graphics with JavaScript!
- Think of it like a blank piece of paper
- We'll draw our gems and basket on it
- `width="600" height="500"` sets the size in pixels

---

## 🎨 Part 2: Styling (5 minutes)

### Step 2: Add CSS

```html
<style>
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
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
    }

    h1 {
        font-size: 42px;
        margin-bottom: 20px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }

    .game-stats {
        display: flex;
        justify-content: center;
        gap: 40px;
        margin-bottom: 20px;
        font-size: 24px;
        font-weight: bold;
    }

    .stat span {
        color: #4ecdc4;
    }

    #gameCanvas {
        border: 3px solid white;
        border-radius: 10px;
        background: linear-gradient(180deg, #87ceeb 0%, #f0e68c 100%);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        cursor: none; /* Hide cursor over canvas */
    }

    .controls {
        margin-top: 20px;
    }

    .controls p {
        margin: 5px 0;
        font-size: 16px;
        opacity: 0.9;
    }

    button {
        margin-top: 15px;
        font-size: 20px;
        padding: 12px 30px;
        background-color: #4ecdc4;
        color: white;
        border: none;
        border-radius: 50px;
        cursor: pointer;
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        transition: all 0.3s ease;
    }

    button:hover {
        background-color: #3dbdb3;
        transform: translateY(-2px);
    }

    .message {
        margin-top: 15px;
        font-size: 24px;
        font-weight: bold;
        min-height: 30px;
    }
</style>
```

---

## ⚡ Part 3: Game Logic with Canvas Animation (35 minutes)

### Step 3: JavaScript - The Animation Engine

```html
<script>
    // ========================================
    // 1. SETUP - Get elements and canvas context
    // ========================================
    const canvas = document.getElementById('gameCanvas');
    const ctx = canvas.getContext('2d'); // Drawing context
    const startButton = document.getElementById('startButton');
    const scoreDisplay = document.getElementById('score');
    const livesDisplay = document.getElementById('lives');
    const messageDisplay = document.getElementById('message');

    // ========================================
    // 2. GAME STATE
    // ========================================
    let score = 0;
    let lives = 3;
    let gameRunning = false;
    let animationId = null;

    // ========================================
    // 3. GAME OBJECTS
    // ========================================
    
    // The basket (player)
    const basket = {
        x: canvas.width / 2 - 50,  // Start in center
        y: canvas.height - 60,      // Near bottom
        width: 100,
        height: 40,
        speed: 8,
        color: '#8B4513'
    };

    // Array to hold falling gems
    let gems = [];

    // ========================================
    // 4. GEM FACTORY - Creates a new gem
    // ========================================
    function createGem() {
        const colors = ['#ff6b6b', '#4ecdc4', '#45b7d1', '#f7b731', '#5f27cd', '#00d2d3'];
        const randomColor = colors[Math.floor(Math.random() * colors.length)];
        
        return {
            x: Math.random() * (canvas.width - 30), // Random x position
            y: -30,                                   // Start above screen
            width: 30,
            height: 30,
            speed: 2 + Math.random() * 2,            // Random speed 2-4
            color: randomColor,
            caught: false
        };
    }

    // ========================================
    // 5. DRAWING FUNCTIONS
    // ========================================
    
    function drawBasket() {
        // Draw basket body
        ctx.fillStyle = basket.color;
        ctx.fillRect(basket.x, basket.y, basket.width, basket.height);
        
        // Draw basket handle (arc on top)
        ctx.strokeStyle = basket.color;
        ctx.lineWidth = 5;
        ctx.beginPath();
        ctx.arc(basket.x + basket.width/2, basket.y, 20, Math.PI, 0);
        ctx.stroke();
    }

    function drawGem(gem) {
        // Draw as a diamond shape
        ctx.fillStyle = gem.color;
        ctx.beginPath();
        ctx.moveTo(gem.x + gem.width/2, gem.y);              // Top point
        ctx.lineTo(gem.x + gem.width, gem.y + gem.height/2); // Right point
        ctx.lineTo(gem.x + gem.width/2, gem.y + gem.height); // Bottom point
        ctx.lineTo(gem.x, gem.y + gem.height/2);             // Left point
        ctx.closePath();
        ctx.fill();
        
        // Add sparkle effect
        ctx.fillStyle = 'rgba(255, 255, 255, 0.5)';
        ctx.fillRect(gem.x + gem.width/2 - 3, gem.y + gem.height/2 - 3, 6, 6);
    }

    function clearCanvas() {
        // Redraw gradient background
        const gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
        gradient.addColorStop(0, '#87ceeb');
        gradient.addColorStop(1, '#f0e68c');
        ctx.fillStyle = gradient;
        ctx.fillRect(0, 0, canvas.width, canvas.height);
    }

    // ========================================
    // 6. COLLISION DETECTION
    // ========================================
    
    function checkCollision(gem, basket) {
        return gem.x < basket.x + basket.width &&
               gem.x + gem.width > basket.x &&
               gem.y < basket.y + basket.height &&
               gem.y + gem.height > basket.y;
    }

    // ========================================
    // 7. GAME LOOP - The heart of the game!
    // ========================================
    
    function gameLoop() {
        if (!gameRunning) return;

        // Clear and redraw everything
        clearCanvas();
        drawBasket();

        // Update and draw each gem
        for (let i = gems.length - 1; i >= 0; i--) {
            const gem = gems[i];
            
            // Move gem down
            gem.y += gem.speed;
            
            // Check if caught
            if (checkCollision(gem, basket) && !gem.caught) {
                gem.caught = true;
                score++;
                scoreDisplay.textContent = score;
                gems.splice(i, 1); // Remove from array
                continue;
            }
            
            // Check if missed (fell off screen)
            if (gem.y > canvas.height) {
                lives--;
                livesDisplay.textContent = lives;
                gems.splice(i, 1);
                
                if (lives <= 0) {
                    endGame();
                    return;
                }
                continue;
            }
            
            // Draw the gem
            drawGem(gem);
        }

        // Spawn new gems randomly
        if (Math.random() < 0.02) { // 2% chance each frame
            gems.push(createGem());
        }

        // Continue the animation loop
        animationId = requestAnimationFrame(gameLoop);
    }

    // ========================================
    // 8. PLAYER CONTROLS
    // ========================================
    
    // Mouse control
    canvas.addEventListener('mousemove', (e) => {
        if (!gameRunning) return;
        
        const rect = canvas.getBoundingClientRect();
        const mouseX = e.clientX - rect.left;
        
        // Center basket on mouse, keep within bounds
        basket.x = mouseX - basket.width / 2;
        basket.x = Math.max(0, Math.min(canvas.width - basket.width, basket.x));
    });

    // Keyboard control
    const keys = {};
    document.addEventListener('keydown', (e) => {
        keys[e.key] = true;
    });
    document.addEventListener('keyup', (e) => {
        keys[e.key] = false;
    });

    function updateBasketKeyboard() {
        if (keys['ArrowLeft'] || keys['a']) {
            basket.x -= basket.speed;
        }
        if (keys['ArrowRight'] || keys['d']) {
            basket.x += basket.speed;
        }
        // Keep basket within bounds
        basket.x = Math.max(0, Math.min(canvas.width - basket.width, basket.x));
    }

    // ========================================
    // 9. GAME MANAGEMENT
    // ========================================
    
    function startGame() {
        score = 0;
        lives = 3;
        gems = [];
        gameRunning = true;
        
        scoreDisplay.textContent = score;
        livesDisplay.textContent = lives;
        messageDisplay.textContent = '';
        
        startButton.textContent = 'Game Running...';
        startButton.disabled = true;
        
        gameLoop();
    }

    function endGame() {
        gameRunning = false;
        cancelAnimationFrame(animationId);
        
        messageDisplay.textContent = '🎮 Game Over! Final Score: ' + score;
        startButton.textContent = 'PLAY AGAIN';
        startButton.disabled = false;
    }

    // ========================================
    // 10. EVENT LISTENERS
    // ========================================
    
    startButton.addEventListener('click', startGame);

    // Initial draw
    clearCanvas();
    drawBasket();
</script>
```

### 🔍 Key Concepts Explained

**1. Canvas Context (`ctx`)**
- Like a paintbrush that draws on the canvas
- `ctx.fillRect()` - Draw rectangles
- `ctx.beginPath()` - Start drawing a custom shape
- `ctx.arc()` - Draw curves/circles

**2. Game Loop with `requestAnimationFrame()`**
- Runs at ~60 frames per second
- Smoother than `setInterval`
- Browser optimizes it automatically

**3. Array Management**
- `gems.push(createGem())` - Add new gem
- `gems.splice(i, 1)` - Remove gem at position i
- Loop backwards to safely remove items

**4. Collision Detection**
- Check if rectangles overlap
- Classic "AABB" (Axis-Aligned Bounding Box) collision

**5. Keyboard State Tracking**
- Store pressed keys in an object
- Check state each frame for smooth movement

---

## 🎮 Part 4: Test and Customize (5 minutes)

### ✅ Testing:

1. Move your mouse - does the basket follow?
2. Try arrow keys - does it move?
3. Catch gems - does score increase?
4. Miss 3 gems - does game end?

### 🎨 Customization Ideas:

**Easy:**
1. Change gem colors in the `colors` array
2. Adjust gem spawn rate (change `0.02` in gameLoop)
3. Change basket size

**Medium:**
4. Add power-ups (bigger basket, slow-motion, extra life)
5. Increase difficulty over time (gems fall faster)
6. Add sound effects when catching gems

**Hard:**
7. Add different gem types worth different points
8. Create "bomb" objects that subtract points
9. Add particle effects when catching gems

---

## 💡 Challenge: Power-Up System

Add a golden gem worth 5 points:

```javascript
function createGem() {
    const colors = ['#ff6b6b', '#4ecdc4', '#45b7d1', '#f7b731', '#5f27cd', '#00d2d3'];
    const isGolden = Math.random() < 0.1; // 10% chance
    
    return {
        x: Math.random() * (canvas.width - 30),
        y: -30,
        width: 30,
        height: 30,
        speed: 2 + Math.random() * 2,
        color: isGolden ? '#FFD700' : colors[Math.floor(Math.random() * colors.length)],
        points: isGolden ? 5 : 1,
        caught: false
    };
}

// In gameLoop, when caught:
score += gem.points;
```

---

## 📚 What You Learned Today

✅ **HTML Canvas** - Drawing graphics with JavaScript  
✅ **Animation Loop** - `requestAnimationFrame()` for smooth movement  
✅ **Coordinate Systems** - X/Y positioning in 2D space  
✅ **Collision Detection** - Checking if objects overlap  
✅ **Array Manipulation** - Adding/removing items during gameplay  
✅ **Mouse Events** - `mousemove` to track cursor position  
✅ **Keyboard Input** - Tracking multiple keys simultaneously

---

## 🚀 Next Session Preview

**Session 4:** We'll learn **React** and build Tic-Tac-Toe with components, making our code more organized and reusable!

---

## 📦 Homework (Optional)

1. Add background clouds or stars that move
2. Create a difficulty selector (Easy/Medium/Hard)
3. Add a countdown timer mode (survive for 60 seconds)
4. Make the basket bounce when it hits screen edges

---

## 🆘 Common Issues

**Problem:** "Canvas is blank"  
**Solution:** Check that `ctx.getContext('2d')` is called and `clearCanvas()` runs

**Problem:** "Basket doesn't move with mouse"  
**Solution:** Verify `gameRunning` is true and event listener is attached

**Problem:** "Gems don't appear"  
**Solution:** Check `Math.random() < 0.02` - increase the number for more gems

**Problem:** "Collisions don't work"  
**Solution:** Verify basket and gem coordinates/sizes in `checkCollision()`

---

## 📖 Resources

- [Canvas API - MDN](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API)
- [requestAnimationFrame - MDN](https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame)
- [Collision Detection - MDN](https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection)

---

**[← Session 2](/highschool/session2/) | [Back to GameCraft Home](/highschool/) | [Next: Session 4 →](/highschool/session4/)**
