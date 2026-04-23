---
layout: page
title: Session 4
subtitle: React Without npm
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 4: Tic-Tac-Toe with React, No npm Required

**Goal:** Learn React by building a Tic-Tac-Toe game in a single HTML file using CDN scripts instead of `npm`  
**Prerequisites:** Sessions 1-3 (HTML, CSS, JavaScript, GitHub Pages)

---

## Before You Start

Sync your repo to get the latest files:

**If you already cloned your repo:**

```bash
git pull origin main
```

**If you haven't cloned it yet:**

```bash
git clone https://github.com/HSWebGame/webgame-v2-YOURNAME.git
cd webgame-v2-YOURNAME
code .
```

> **What's new in your repo:**
> - A **Home** button has been added to your click game and gem catcher pages. Open either game to see it in the top-left corner.
> - A starter file `react-tictactoe.html` has been added. You will build on it today.

Open `react-tictactoe.html` with Live Server to confirm it loads before continuing. You should see a "Tic-Tac-Toe" heading.

---

## Why This Version of React?

Normally React projects use tools like Vite and `npm`, but that only works when students can install packages.

For this class, we can still teach the important React ideas without any installs:
- We load React from a CDN
- We write everything in one `react-tictactoe.html` file
- Students can run it with Live Server or open the file directly
- GitHub Pages can publish it just like the earlier games

This is a good teaching setup even if it is not the full production workflow.

---

## What You Will Build Today

A Tic-Tac-Toe game with:
- Reusable React components
- State that updates the screen automatically
- Win and draw detection
- A reset button
- A file that is already part of the existing portfolio

---

## Part 1: Look at the Starter File

Open `react-tictactoe.html` from your repo. The HTML structure, styles, and CDN script tags are already set up — you don't need to write any of that.

Scroll to the bottom and find this section:

```html
<script type="text/babel">
    const { useState } = React;

    function App() {
        return (
            <div className="game">
                <h1>Tic-Tac-Toe</h1>
                <p>React can run in one HTML file too.</p>
            </div>
        );
    }

    const root = ReactDOM.createRoot(document.getElementById('root'));
    root.render(<App />);
</script>
```

This is your starting point. In **Part 3** you will replace this script block with the full game. But first — the concepts.

---

## Part 2: Understand the Three React Pieces

### 1. Components

Components are functions that return UI.

```jsx
function Welcome() {
    return <h2>Hello!</h2>;
}
```

### 2. JSX

JSX lets us write HTML-like code inside JavaScript.

```jsx
const name = 'Player 1';
return <p>Hello, {name}</p>;
```

### 3. State

State is data that can change and update the page automatically.

```jsx
const [count, setCount] = useState(0);
```

When `setCount(...)` runs, React redraws the page with the new value.

---

## Part 3: Add the Game Logic

Replace **the entire `<script type="text/babel">` block** in your file with this:

```html
<script type="text/babel">
    const { useState } = React;

    function calculateWinner(squares) {
        const lines = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ];

        for (let i = 0; i < lines.length; i++) {
            const [a, b, c] = lines[i];
            if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
                return squares[a];
            }
        }

        return null;
    }

    function Square({ value, onSquareClick }) {
        return (
            <button className="square" onClick={onSquareClick}>
                {value}
            </button>
        );
    }

    function Board({ squares, xIsNext, onPlay }) {
        function handleClick(index) {
            if (squares[index] || calculateWinner(squares)) {
                return;
            }

            const nextSquares = squares.slice();
            nextSquares[index] = xIsNext ? 'X' : 'O';
            onPlay(nextSquares);
        }

        const winner = calculateWinner(squares);
        let status;

        if (winner) {
            status = 'Winner: ' + winner;
        } else if (squares.every(square => square)) {
            status = 'Draw!';
        } else {
            status = 'Next player: ' + (xIsNext ? 'X' : 'O');
        }

        return (
            <>
                <div className="status">{status}</div>
                <div className="board">
                    <Square value={squares[0]} onSquareClick={() => handleClick(0)} />
                    <Square value={squares[1]} onSquareClick={() => handleClick(1)} />
                    <Square value={squares[2]} onSquareClick={() => handleClick(2)} />
                    <Square value={squares[3]} onSquareClick={() => handleClick(3)} />
                    <Square value={squares[4]} onSquareClick={() => handleClick(4)} />
                    <Square value={squares[5]} onSquareClick={() => handleClick(5)} />
                    <Square value={squares[6]} onSquareClick={() => handleClick(6)} />
                    <Square value={squares[7]} onSquareClick={() => handleClick(7)} />
                    <Square value={squares[8]} onSquareClick={() => handleClick(8)} />
                </div>
            </>
        );
    }

    function App() {
        const [squares, setSquares] = useState(Array(9).fill(null));
        const [xIsNext, setXIsNext] = useState(true);

        function handlePlay(nextSquares) {
            setSquares(nextSquares);
            setXIsNext(!xIsNext);
        }

        function resetGame() {
            setSquares(Array(9).fill(null));
            setXIsNext(true);
        }

        return (
            <div className="game">
                <h1>Tic-Tac-Toe</h1>
                <p>Built with React, but no package install needed.</p>
                <Board squares={squares} xIsNext={xIsNext} onPlay={handlePlay} />
                <button className="reset-button" onClick={resetGame}>New Game</button>
            </div>
        );
    }

    const root = ReactDOM.createRoot(document.getElementById('root'));
    root.render(<App />);
</script>
```

Save and refresh. You should have a working Tic-Tac-Toe game.

---

## How This Connects to Earlier Sessions

Students already know:
- Variables
- Functions
- Arrays
- Conditionals
- Event-driven logic

React adds a cleaner structure on top of those ideas:
- `Square` is a reusable piece of UI
- `Board` groups multiple squares together
- `App` stores the main game state
- `useState` replaces manual DOM updates in many cases

So this is not starting over. It is reorganizing the same JavaScript ideas in a more scalable way.

---

## Part 4: Publish to Your Portfolio

Your `index.html` already has a "Coming Next" card for the React game. Update it to link to the file you just finished:

Find the coming-next card and change it to:

```html
<section class="game-card">
    <h2>React Tic-Tac-Toe</h2>
    <p>A classic game rebuilt with React components and state.</p>
    <div class="tech-tags">
        <span>React</span>
        <span>Components</span>
        <span>JSX</span>
    </div>
    <a class="play-button" href="react-tictactoe.html">Play</a>
</section>
```

Then push everything:

```bash
git add .
git commit -m "Add React tic-tac-toe"
git push origin main
```

Because the React version is still just an HTML file, GitHub Pages can host it directly.

---

## Customize Your Game

Once the game works, make it your own. Here are some ideas with the exact changes to make:

### Change the color scheme

In the `<style>` block, find the `body` rule and change the gradient colors:

```css
body {
    background: linear-gradient(135deg, #1a1a2e, #16213e, #0f3460);
}
```

Try any combination — pick colors at [coolors.co](https://coolors.co).

### Use emoji instead of X and O

In the `handleClick` function inside `Board`, change:

```js
nextSquares[index] = xIsNext ? 'X' : 'O';
```

to something like:

```js
nextSquares[index] = xIsNext ? '⭐' : '🔥';
```

### Change the square and button colors

In `<style>`, find `.square` and `.reset-button`:

```css
.square {
    background: #1e293b;
    color: #38bdf8;
}

.reset-button {
    background: #f59e0b;
}
```

### Add a score tracker

Inside `App`, add a score state and update it when there's a winner:

```jsx
const [scores, setScores] = useState({ X: 0, O: 0 });
```

Then in `handlePlay`, check if the move caused a win and call `setScores`.

---

## Common Issues

**Problem:** "The page is blank"  
**Solution:** Check that the script tag uses `type="text/babel"` and that all CDN script tags loaded correctly.

**Problem:** "React is not defined"  
**Solution:** Make sure the React CDN scripts are above the Babel script block.

**Problem:** "Nothing happens when I click a square"  
**Solution:** Check that `onSquareClick={() => handleClick(...)}` is passed to each `Square`.

**Problem:** "The game never resets to X first"  
**Solution:** In `resetGame()`, set both the board and `xIsNext` back to their starting values.

---

## Resources

- [React Official Tutorial](https://react.dev/learn/tutorial-tic-tac-toe)
- [React `useState`](https://react.dev/reference/react/useState)
- [Babel Standalone](https://babeljs.io/docs/babel-standalone)

---

**[Session 3](/highschool/session3/) | [Back to GameCraft Home](/highschool/)**
