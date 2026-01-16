---
layout: page
title: Session 5
subtitle: Deploy and Share Your Games
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 5: Deploy Your Games to the World! 🚀

## 🎯 What You'll Accomplish Today

1. **Polish** - Add sound effects, animations, and final touches
2. **Deploy** - Put your games online with GitHub Pages
3. **Portfolio** - Create a showcase page with all your games
4. **Share** - Get a real URL to share with friends and family!

**[Example Portfolio →](your-demo-link-here)**

---

## 🎨 Part 1: Polish Your Games (20 minutes)

Let's add professional touches to make your games shine!

### 🔊 Add Sound Effects

**Step 1: Find Free Sounds**

Visit these sites for free game sounds:
- [Freesound.org](https://freesound.org/)
- [Zapsplat](https://www.zapsplat.com/)
- [Pixabay Sounds](https://pixabay.com/sound-effects/)

Download:
- `click.mp3` - Button click sound
- `win.mp3` - Victory sound
- `lose.mp3` - Game over sound

**Step 2: Add Sounds to Any Game**

Create a `sounds` folder in your project and add this to your JavaScript:

```javascript
// At the top of your script
const sounds = {
    click: new Audio('sounds/click.mp3'),
    win: new Audio('sounds/win.mp3'),
    lose: new Audio('sounds/lose.mp3')
};

// Play when clicking
function handleClick() {
    sounds.click.play();
    // ... rest of your code
}

// Play when winning
function endGame() {
    if (winner) {
        sounds.win.play();
    } else {
        sounds.lose.play();
    }
    // ... rest of your code
}
```

### ✨ Add CSS Animations

**Pulse Effect for Buttons:**

```css
@keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.05); }
}

.winning-button {
    animation: pulse 0.5s infinite;
}
```

**Fade-In for Messages:**

```css
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.message {
    animation: fadeIn 0.5s ease;
}
```

**Shake on Error:**

```css
@keyframes shake {
    0%, 100% { transform: translateX(0); }
    25% { transform: translateX(-10px); }
    75% { transform: translateX(10px); }
}

.error {
    animation: shake 0.3s ease;
}
```

### 🎯 Add localStorage High Scores

Track scores across sessions:

```javascript
// Load high score
let highScore = parseInt(localStorage.getItem('gameHighScore')) || 0;
document.getElementById('highScore').textContent = highScore;

// Save high score
function updateHighScore(newScore) {
    if (newScore > highScore) {
        highScore = newScore;
        localStorage.setItem('gameHighScore', highScore);
        return true; // New high score!
    }
    return false;
}
```

---

## 📦 Part 2: Prepare for Deployment (10 minutes)

### Step 1: Organize Your Projects

Create this folder structure:

```
my-gamecraft-portfolio/
├── index.html              (Portfolio homepage)
├── session1/
│   └── index.html         (Button clicker)
├── session2/
│   └── index.html         (Click speed game)
├── session3/
│   └── index.html         (Gem catcher)
└── session4/               (React tic-tac-toe)
    └── dist/              (Built React app)
```

### Step 2: Create Portfolio Homepage

Create `index.html` in the root:

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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: white;
            padding: 40px 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        header {
            text-align: center;
            margin-bottom: 60px;
        }

        h1 {
            font-size: 56px;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .subtitle {
            font-size: 24px;
            opacity: 0.9;
        }

        .games-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-bottom: 60px;
        }

        .game-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .game-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.4);
        }

        .game-card h2 {
            font-size: 28px;
            margin-bottom: 15px;
        }

        .game-card p {
            font-size: 16px;
            margin-bottom: 20px;
            opacity: 0.9;
            line-height: 1.6;
        }

        .play-button {
            display: inline-block;
            padding: 12px 30px;
            background-color: #4ecdc4;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-size: 18px;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .play-button:hover {
            background-color: #3dbdb3;
            transform: translateY(-2px);
            box-shadow: 0 7px 20px rgba(0, 0, 0, 0.4);
        }

        .skills {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 20px;
            text-align: center;
            backdrop-filter: blur(10px);
        }

        .skills h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .skills-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .skill-tag {
            background: rgba(255, 255, 255, 0.2);
            padding: 10px 20px;
            border-radius: 25px;
            font-size: 16px;
        }

        footer {
            text-align: center;
            margin-top: 60px;
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>🎮 My GameCraft Portfolio 🎮</h1>
            <p class="subtitle">Built with HTML, CSS, JavaScript, and React</p>
        </header>

        <div class="games-grid">
            <div class="game-card">
                <h2>⚡ Session 1: Interactive Button</h2>
                <p>My first web page with interactive elements! Click the button to see it change colors and count clicks.</p>
                <a href="session1/index.html" class="play-button">Play Now →</a>
            </div>

            <div class="game-card">
                <h2>⏱️ Session 2: Click Speed Challenge</h2>
                <p>A fast-paced clicking game with a timer! See how many clicks you can get in 10 seconds.</p>
                <a href="session2/index.html" class="play-button">Play Now →</a>
            </div>

            <div class="game-card">
                <h2>💎 Session 3: Gem Catcher</h2>
                <p>Catch falling gems using canvas animation! Features collision detection and smooth movement.</p>
                <a href="session3/index.html" class="play-button">Play Now →</a>
            </div>

            <div class="game-card">
                <h2>⭕ Session 4: Tic-Tac-Toe</h2>
                <p>Classic game built with React! Features components, state management, and win detection.</p>
                <a href="session4/dist/index.html" class="play-button">Play Now →</a>
            </div>
        </div>

        <div class="skills">
            <h2>💡 Skills I Learned</h2>
            <div class="skills-list">
                <span class="skill-tag">HTML5</span>
                <span class="skill-tag">CSS3</span>
                <span class="skill-tag">JavaScript</span>
                <span class="skill-tag">React</span>
                <span class="skill-tag">Canvas API</span>
                <span class="skill-tag">Event Handling</span>
                <span class="skill-tag">Animation</span>
                <span class="skill-tag">Game Logic</span>
                <span class="skill-tag">GitHub</span>
                <span class="skill-tag">Web Deployment</span>
            </div>
        </div>

        <footer>
            <p>Created during GameCraft: Build Your Own Web Game</p>
            <p>January 2026</p>
        </footer>
    </div>
</body>
</html>
```

### Step 3: Build React App for Deployment

For your Session 4 React app:

```bash
cd session4
npm run build
```

This creates a `dist/` folder with optimized files ready for deployment.

---

## 🚀 Part 3: Deploy to GitHub Pages (20 minutes)

### Option A: Using GitHub Desktop (Easiest)

**Step 1: Install GitHub Desktop**
- Download from [desktop.github.com](https://desktop.github.com/)
- Sign in with your GitHub account

**Step 2: Create Repository**
1. Open GitHub Desktop
2. Click **File → New Repository**
3. Name: `gamecraft-portfolio`
4. Choose your project folder location
5. Click **Create Repository**

**Step 3: Publish to GitHub**
1. Click **Publish repository** button
2. Uncheck "Keep this code private" (so it's public)
3. Click **Publish repository**

**Step 4: Enable GitHub Pages**
1. Go to your repository on GitHub.com
2. Click **Settings** tab
3. Scroll to **Pages** section (left sidebar)
4. Under "Source", select **main** branch
5. Select **/ (root)** folder
6. Click **Save**

**Wait 1-2 minutes**, then your site will be live at:
`https://YOUR-USERNAME.github.io/gamecraft-portfolio/`

### Option B: Using GitHub Organization (Teacher Setup)

**For Teacher:**
1. Create a GitHub Organization (e.g., `gamecraft-2026`)
2. Create classroom assignment repos for each student
3. Students push their code to assigned repos
4. Enable Pages for each repo

**For Students:**
```bash
# Initialize git
git init
git add .
git commit -m "Initial commit - my games"

# Connect to your classroom repo
git remote add origin https://github.com/gamecraft-2026/YOUR-NAME.git
git push -u origin main
```

### Option C: Using Command Line

```bash
# In your project folder
git init
git add .
git commit -m "My GameCraft portfolio"

# Create repo on GitHub.com first, then:
git remote add origin https://github.com/YOUR-USERNAME/gamecraft-portfolio.git
git branch -M main
git push -u origin main

# Enable GitHub Pages in Settings → Pages
```

---

## 🎉 Part 4: Test and Share (10 minutes)

### ✅ Testing Checklist:

Visit your deployed site and test:
1. Portfolio homepage loads
2. All game links work
3. Games function correctly online
4. No console errors (F12 to check)
5. Works on mobile (responsive design)

### 📱 Share Your Work!

**Get Your URL:**
`https://YOUR-USERNAME.github.io/gamecraft-portfolio/`

**Share it with:**
- Friends and family
- Social media
- Your resume/portfolio
- College applications
- Future employers!

### 🎨 Customize Your Portfolio

**Add personal touches:**
1. Change colors and gradients
2. Add your photo/avatar
3. Write about your learning journey
4. Add links to GitHub profile
5. Include contact information

---

## 🏆 Final Touches

### Add a README.md

Create `README.md` in your repo:

```markdown
# 🎮 GameCraft Portfolio

My collection of web games built during the GameCraft course!

## 🕹️ Games

1. **Interactive Button** - HTML/CSS/JS basics
2. **Click Speed Challenge** - Timers and game loops
3. **Gem Catcher** - Canvas animation and collision
4. **Tic-Tac-Toe** - React components and state

## 🛠️ Technologies

- HTML5, CSS3, JavaScript
- React + Vite
- Canvas API
- GitHub Pages

## 🚀 Play Now

[Visit Portfolio →](https://YOUR-USERNAME.github.io/gamecraft-portfolio/)

## 📚 What I Learned

- Building interactive web pages
- Game logic and state management
- Animation and collision detection
- React component architecture
- Deploying to the web

---

Created with ❤️ during GameCraft: Build Your Own Web Game
```

### Add Custom Domain (Optional)

If you have a domain name:
1. Add `CNAME` file to your repo with your domain
2. Configure DNS settings
3. Access via `www.yourdomain.com`

---

## 📚 What You Accomplished

✅ **Polished games** with sounds, animations, and high scores  
✅ **Created portfolio** showcasing all your work  
✅ **Deployed to web** with GitHub Pages  
✅ **Learned Git** version control basics  
✅ **Built real portfolio** to share with the world!

---

## 🎓 Certificate of Completion

**Congratulations!** You've completed GameCraft and built:
- 4 interactive web games
- A professional portfolio
- Real-world web development skills

**Next Steps:**
1. Keep building - try new game ideas!
2. Learn more React - build complex apps
3. Explore game engines - Phaser.js, PixiJS
4. Join coding communities - share and learn
5. Consider web development as a career path!

---

## 🚀 Where to Go From Here

### Continue Learning:

**Game Development:**
- [FreeCodeCamp - JavaScript](https://www.freecodecamp.org/)
- [Phaser.js - 2D Game Framework](https://phaser.io/)
- [Unity - 3D Game Development](https://unity.com/)

**Web Development:**
- [React Official Docs](https://react.dev/)
- [MDN Web Docs](https://developer.mozilla.org/)
- [JavaScript30](https://javascript30.com/)

**Portfolio Building:**
- Add more projects
- Learn backend (Node.js)
- Build full-stack apps
- Contribute to open source

### Join Communities:

- [Dev.to](https://dev.to/)
- [GitHub Discussions](https://github.com/)
- [Discord coding servers](https://discord.com/)
- [Stack Overflow](https://stackoverflow.com/)

---

## 📦 Final Homework

1. **Add one more game** - Build something original!
2. **Improve existing games** - Add features you always wanted
3. **Share your portfolio** - Get feedback from friends
4. **Write a blog post** - Document your learning journey
5. **Help others** - Teach someone else what you learned!

---

## 🆘 Deployment Troubleshooting

**Problem:** "GitHub Pages shows 404"  
**Solution:** Check Settings → Pages is enabled, wait 1-2 minutes, refresh

**Problem:** "Games don't work online but work locally"  
**Solution:** Check file paths - use relative paths (`./game.html` not `/game.html`)

**Problem:** "React app shows blank page"  
**Solution:** Build with `npm run build`, deploy the `dist/` folder contents

**Problem:** "CSS not loading"  
**Solution:** Check that CSS files are in the repo and paths are correct

---

## 📖 Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Git Basics](https://git-scm.com/book/en/v2)
- [Markdown Guide](https://www.markdownguide.org/)
- [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)

---

## 🎉 Thank You!

**You did it!** You went from zero programming experience to building and deploying real web games. That's amazing! 

Keep coding, keep learning, and most importantly - **keep having fun creating!**

---

**[← Session 4](/highschool/session4/) | [Back to GameCraft Home](/highschool/)**
