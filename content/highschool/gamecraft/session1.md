---
layout: page
title: Session 1
subtitle: Your First Interactive Web Page
date: 2026-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 1: Your First Interactive Web Page 🎨

**Time:** 1 hour  
**Goal:** Build a colorful button that responds to clicks - your first interactive web page!  
**No prerequisites needed** - we'll start from the very beginning.

---

## 🎯 What You'll Build Today

A web page with a button that changes color and text when you click it. Simple, but it introduces the **three core technologies** of web development!

**[See the finished example →](your-demo-link-here)**

---

## 🧰 Setup (5 minutes)

### Option A: Replit (Easiest - Works in Browser!)
1. Go to [replit.com](https://replit.com/)
2. Sign up/log in (use your GitHub account!)
3. Click **+ Create Repl**
4. Choose **HTML, CSS, JS** template
5. Name it: `gamecraft-session1`

### Option B: VS Code (Local Installation)
1. Download [VS Code](https://code.visualstudio.com/)
2. Create a new folder: `gamecraft-session1`
3. Create a file: `index.html`

**We'll use Option A in class for simplicity!**

---

## 📖 Part 1: HTML - The Structure (15 minutes)

HTML is like the **skeleton** of a web page. It defines what elements exist.

### Step 1: Create the Basic Structure

In your `index.html` file, type this (or paste it):

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My First Web Game</title>
</head>
<body>
    <h1>Welcome to GameCraft!</h1>
    <p>Click the button below:</p>
    <button id="magicButton">Click Me!</button>
</body>
</html>
```

### 🔍 What Does This Mean?

- `<!DOCTYPE html>` - Tells the browser "this is a web page"
- `<html>` - The container for everything
- `<head>` - Information ABOUT the page (title, settings)
- `<body>` - What you SEE on the page
- `<h1>` - A big heading
- `<p>` - A paragraph of text
- `<button>` - A clickable button!
- `id="magicButton"` - A name we'll use later to control this button

### ✅ Test It!

- **Replit:** Click the green "Run" button at the top
- **VS Code:** Right-click `index.html` → "Open with Live Server" (or just double-click to open in browser)

**You should see:** A plain page with a heading, text, and a button!

---

## 🎨 Part 2: CSS - The Style (15 minutes)

CSS is like **clothes and makeup** for your web page. It makes things look good!

### Step 2: Add Style

Inside your `<head>` section (between `<title>` and `</head>`), add this:

```html
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 50px;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    h1 {
        font-size: 48px;
        margin-bottom: 20px;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
    }

    p {
        font-size: 20px;
        margin-bottom: 30px;
    }

    button {
        font-size: 24px;
        padding: 20px 40px;
        background-color: #ff6b6b;
        color: white;
        border: none;
        border-radius: 50px;
        cursor: pointer;
        box-shadow: 0 8px 15px rgba(0,0,0,0.3);
        transition: all 0.3s ease;
    }

    button:hover {
        background-color: #ee5a52;
        transform: translateY(-3px);
        box-shadow: 0 12px 20px rgba(0,0,0,0.4);
    }
</style>
```

### 🔍 What Does This Do?

- `body { ... }` - Styles the entire page (gradient background, centered content)
- `h1 { ... }` - Makes the heading bigger and adds a shadow
- `button { ... }` - Makes the button colorful, rounded, and adds a shadow
- `button:hover` - Changes how the button looks when you move your mouse over it
- `transition` - Makes changes smooth and animated

### ✅ Test It!

Refresh your page. **WOW!** 🎨 Much better looking!

---

## ⚡ Part 3: JavaScript - The Interaction (20 minutes)

JavaScript is the **brain** of your web page. It makes things DO stuff!

### Step 3: Add Interactivity

Right before the closing `</body>` tag, add this:

```html
<script>
    // Step 1: Find the button on the page
    const button = document.getElementById('magicButton');
    
    // Step 2: Create a variable to count clicks
    let clickCount = 0;
    
    // Step 3: Define what happens when button is clicked
    function handleClick() {
        // Increase the count
        clickCount = clickCount + 1;
        
        // Change the button text
        button.textContent = 'Clicked ' + clickCount + ' times!';
        
        // Change the button color randomly
        const randomColor = getRandomColor();
        button.style.backgroundColor = randomColor;
    }
    
    // Step 4: Create a function to generate random colors
    function getRandomColor() {
        const colors = ['#ff6b6b', '#4ecdc4', '#45b7d1', '#f7b731', '#5f27cd', '#00d2d3'];
        const randomIndex = Math.floor(Math.random() * colors.length);
        return colors[randomIndex];
    }
    
    // Step 5: Tell the button to run handleClick when clicked
    button.addEventListener('click', handleClick);
</script>
```

### 🔍 Let's Break This Down!

1. **`const button = ...`** - Finds your button by its `id` and saves it in a variable
2. **`let clickCount = 0`** - Creates a counter starting at 0
3. **`function handleClick() { ... }`** - A recipe for what to do when clicked
4. **`clickCount = clickCount + 1`** - Adds 1 to the counter (like tallying scores!)
5. **`button.textContent = ...`** - Changes what the button says
6. **`button.style.backgroundColor = ...`** - Changes the button's color
7. **`addEventListener('click', ...)`** - Says "when someone clicks, run this function"

### ✅ Test It!

Click your button! It should:
- Count your clicks
- Change colors randomly
- Update the text

**Congratulations! You just made something interactive!** 🎉

---

## 🎮 Part 4: Make It Your Own (5 minutes)

### Challenges:

1. **Easy:** Change the starting button text to something fun
2. **Medium:** Add more colors to the `colors` array
3. **Hard:** Make the heading also change when you click the button

**Hint for #3:** You'll need to get the heading with `document.querySelector('h1')` and change its text!

---

## 📚 What You Learned Today

✅ **HTML** - Structure (headings, paragraphs, buttons)  
✅ **CSS** - Styling (colors, sizes, effects)  
✅ **JavaScript** - Interactivity (variables, functions, events)  
✅ **The Browser** - How to run and test web pages  
✅ **Three-part pattern** - Structure → Style → Behavior

---

## 🚀 Next Session Preview

**Session 2:** We'll build a **real click game** with a timer, score, and restart button. Get ready to level up!

---

## 📦 Homework (Optional)

1. Change the gradient background colors (find "135deg, #667eea" in the CSS)
2. Add another button that does something different
3. Share your page with a friend! (In Replit, just share the URL at the top)

---

## 🆘 Common Issues

**Problem:** "I don't see anything"  
**Solution:** Make sure you clicked Run (Replit) or opened the HTML file in a browser

**Problem:** "The button doesn't do anything"  
**Solution:** Check that the `<script>` is before the closing `</body>` tag

**Problem:** "I got an error in the console"  
**Solution:** Make sure the button's `id="magicButton"` matches what's in the JavaScript

---

## 📖 Resources

- [MDN HTML Basics](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/HTML_basics)
- [MDN CSS Basics](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/CSS_basics)
- [MDN JavaScript Basics](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/JavaScript_basics)

---

**[← Back to GameCraft Home](/highschool/gamecraft/) | [Next: Session 2 →](/highschool/gamecraft/session2/)**
