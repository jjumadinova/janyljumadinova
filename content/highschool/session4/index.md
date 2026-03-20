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
- A file that can be added directly to the existing portfolio

---

## Part 1: Create the File

Create a new file named `react-tictactoe.html`.

Paste this starter structure:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>React Tic-Tac-Toe</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #312e81, #1d4ed8, #0891b2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            padding: 24px;
        }

        .game {
            text-align: center;
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.16);
            border-radius: 20px;
            padding: 32px;
            box-shadow: 0 24px 50px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
        }

        h1 {
            font-size: 42px;
            margin-bottom: 10px;
        }

        .status {
            min-height: 32px;
            font-size: 22px;
            font-weight: bold;
            margin: 18px 0;
        }

        .board {
            display: grid;
            grid-template-columns: repeat(3, 110px);
            gap: 10px;
            margin: 0 auto 20px;
            width: fit-content;
        }

        .square {
            width: 110px;
            height: 110px;
            border: none;
            border-radius: 14px;
            font-size: 42px;
            font-weight: bold;
            cursor: pointer;
            background: white;
            color: #1d4ed8;
            box-shadow: 0 10px 18px rgba(0, 0, 0, 0.2);
        }

        .reset-button {
            border: none;
            border-radius: 999px;
            background: #22c55e;
            color: white;
            font-size: 18px;
            font-weight: bold;
            padding: 12px 22px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div id="root"></div>

    <script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
    <script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

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
</body>
</html>
```

Open it with Live Server. If students see the heading, the setup is working.

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

Replace the code inside `<script type="text/babel">` with this full version:

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

## Part 4: Add It to the Portfolio

Go back to the portfolio `index.html` from Session 3 and change the "Coming Next" card.

Replace it with:

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

Then publish the update:

```bash
git add .
git commit -m "Add React tic-tac-toe"
git push origin main
```

Because the React version is still just an HTML file, GitHub Pages can host it directly.

---

## Customization Ideas

1. Use emoji instead of X and O
2. Change the board colors
3. Add a score tracker for multiple rounds
4. Add player name inputs
5. Highlight the winning line

---

## What Students Learned Today

- **React components**: splitting UI into pieces
- **JSX**: writing HTML-like syntax inside JavaScript
- **State**: updating the UI by changing data
- **Props**: passing data to child components
- **CDN workflow**: using a library without package installation
- **Portfolio growth**: adding a new project to an existing published site

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
