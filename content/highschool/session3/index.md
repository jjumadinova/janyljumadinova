---
layout: page
title: Session 3
subtitle: Modern Web with React
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 3: Tic-Tac-Toe with React

**Goal:** Learn React by building a classic Tic-Tac-Toe game with components  
**Prerequisites:** Sessions 1-2 (HTML, CSS, JavaScript)

---

## What You Will Build Today

A fully functional Tic-Tac-Toe game built with **React** - a modern framework used by Facebook, Netflix, and thousands of professional developers.

**Features:**
- Interactive game board
- Win detection
- Draw detection
- Reset button
- Turn indicator
- Component-based architecture

---

## What is React?

**React** is a JavaScript library for building user interfaces with **reusable components**.

Think of it like LEGO blocks:
- Instead of one giant HTML file, you build small pieces (components)
- Each piece has its own structure, style, and behavior
- You combine pieces to make complete applications

**Why React?**
- Reusable components (write once, use everywhere)
- Automatic UI updates when data changes
- Industry-standard (used by top companies)
- Makes complex UIs easier to manage

---

## Setup

### Create a React Project with Vite

1. Open VS Code and open your terminal (`Terminal > New Terminal`)
2. Navigate to your `gamecraft` folder (or wherever your projects live)
3. Run these commands:

```bash
npm create vite@latest tictactoe -- --template react
cd tictactoe
npm install
npm run dev
```

4. Open your browser to `http://localhost:5173` - you should see a React welcome page

### What Just Happened?

Vite created a React project with:
- `src/App.jsx` - Main React component (we will edit this)
- `src/main.jsx` - Entry point
- `package.json` - Dependencies list
- `.jsx` files - JavaScript + XML (JSX) = React\'s syntax for mixing HTML and JavaScript

---

## Understanding Components

Before we build, let us understand four key React concepts:

### 1. Components - Reusable UI Pieces

```jsx
function Button() {
    return <button>Click Me</button>;
}
```

A component is a function that returns HTML-like code. You can reuse it anywhere.

### 2. JSX - HTML Inside JavaScript

```jsx
const name = "Player";
return <h1>Hello, {name}!</h1>; // Outputs: Hello, Player!
```

Curly braces `{}` let you put JavaScript values inside HTML.

### 3. State - Data That Can Change

```jsx
const [count, setCount] = useState(0); // count starts at 0
setCount(5); // Updates count to 5 and re-renders the component
```

When state changes, React automatically updates what you see on screen.

### 4. Props - Passing Data Between Components

```jsx
<Square value="X" />
```

Props are like function parameters - they let parent components send data to children.

---

## Build the Game

### Step 1: Clear the Template

Open `src/App.jsx` and **replace everything** with:

```jsx
import { useState } from \'react\';
import \'./App.css\';

function App() {
  return (
    <div className="game">
      <h1>Tic-Tac-Toe</h1>
      <p>Let us build this together!</p>
    </div>
  );
}

export default App;
```

Save and check your browser - you should see the heading.

### Step 2: Add the Win Detection Function

At the **top of the file**, right after the imports, add:

```jsx
function calculateWinner(squares) {
  const lines = [
    [0, 1, 2], // Top row
    [3, 4, 5], // Middle row
    [6, 7, 8], // Bottom row
    [0, 3, 6], // Left column
    [1, 4, 7], // Middle column
    [2, 5, 8], // Right column
    [0, 4, 8], // Diagonal
    [2, 4, 6], // Diagonal
  ];

  for (let i = 0; i < lines.length; i++) {
    const [a, b, c] = lines[i];
    if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
      return squares[a];
    }
  }
  return null;
}
```

This checks all 8 possible winning combinations.

### Step 3: Create a Square Component

Add this function **above** the `App` function:

```jsx
function Square({ value, onSquareClick }) {
  return (
    <button className="square" onClick={onSquareClick}>
      {value}
    </button>
  );
}
```

Each square receives:
- `value` - what to display (X, O, or nothing)
- `onSquareClick` - what to do when clicked

### Step 4: Create the Board Component

Add this function **above** `App` but **below** `Square`:

```jsx
function Board({ xIsNext, squares, onPlay }) {
  function handleClick(i) {
    // Don\'t allow clicks if square is filled or game is won
    if (squares[i] || calculateWinner(squares)) {
      return;
    }

    const nextSquares = squares.slice(); // Copy the array

    if (xIsNext) {
      nextSquares[i] = \'X\';
    } else {
      nextSquares[i] = \'O\';
    }

    onPlay(nextSquares);
  }

  const winner = calculateWinner(squares);
  let status;
  if (winner) {
    status = \'Winner: \' + winner + \'!\';
  } else if (squares.every(square => square)) {
    status = \'Draw!\';
  } else {
    status = \'Next player: \' + (xIsNext ? \'X\' : \'O\');
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
```

**Key ideas:**
- `squares.slice()` creates a copy (React best practice - never modify state directly)
- `.every()` checks if all squares are filled (draw condition)
- Each `Square` gets its own click handler with the correct index

### Step 5: Update the App Component

Replace your `App` function with:

```jsx
function App() {
  const [history, setHistory] = useState([Array(9).fill(null)]);
  const [currentMove, setCurrentMove] = useState(0);
  const xIsNext = currentMove % 2 === 0;
  const currentSquares = history[currentMove];

  function handlePlay(nextSquares) {
    const nextHistory = [...history.slice(0, currentMove + 1), nextSquares];
    setHistory(nextHistory);
    setCurrentMove(nextHistory.length - 1);
  }

  function resetGame() {
    setHistory([Array(9).fill(null)]);
    setCurrentMove(0);
  }

  return (
    <div className="game">
      <h1>Tic-Tac-Toe</h1>
      <Board xIsNext={xIsNext} squares={currentSquares} onPlay={handlePlay} />
      <button className="reset-button" onClick={resetGame}>
        New Game
      </button>
    </div>
  );
}
```

**State management explained:**
- `history` stores every board state (enables undo in the future)
- `currentMove` tracks which move we are on
- `xIsNext` is calculated: even moves = X, odd moves = O

### Step 6: Add Styling

Replace everything in `src/App.css` with:

```css
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: \'Segoe UI\', Tahoma, Geneva, Verdana, sans-serif;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
}

.game {
  text-align: center;
  background: rgba(255, 255, 255, 0.1);
  padding: 40px;
  border-radius: 20px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
  backdrop-filter: blur(10px);
}

h1 {
  font-size: 48px;
  margin-bottom: 20px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

.status {
  font-size: 28px;
  font-weight: bold;
  margin-bottom: 20px;
  min-height: 40px;
}

.board {
  display: grid;
  grid-template-columns: repeat(3, 120px);
  grid-template-rows: repeat(3, 120px);
  gap: 10px;
  margin: 0 auto 30px;
  width: fit-content;
}

.square {
  width: 120px;
  height: 120px;
  font-size: 48px;
  font-weight: bold;
  background-color: white;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  transition: all 0.2s ease;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  color: #667eea;
}

.square:hover {
  background-color: #f0f0f0;
  transform: translateY(-3px);
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.square:active {
  transform: translateY(0);
}

.reset-button {
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

.reset-button:hover {
  background-color: #3dbdb3;
  transform: translateY(-2px);
}
```

---

## Test Your Game

Check your browser at `http://localhost:5173`. You should have a fully working game!

**Test these scenarios:**
1. X and O alternate turns
2. Winning shows the winner message
3. Filling all squares shows "Draw!"
4. Reset button clears the board
5. You cannot click a filled square

---

## Your Turn - Customize

**Easy:**
1. Change colors in the CSS
2. Use emojis instead of X and O (try replacing `\'X\'` with a star emoji and `\'O\'` with a moon emoji)
3. Change the title text

**Medium:**
4. Add a score tracker:
   ```jsx
   // In App, add:
   const [scores, setScores] = useState({ X: 0, O: 0 });

   // In handlePlay, after setting history:
   const winner = calculateWinner(nextSquares);
   if (winner) {
     setScores(prev => ({ ...prev, [winner]: prev[winner] + 1 }));
   }

   // In the return, add above the Board:
   <div className="scores">X: {scores.X} | O: {scores.O}</div>
   ```

**Hard:**
5. Add a move history list with "Go to move #" buttons
6. Highlight the winning squares with a different color
7. Add animations when placing X or O

---

## Save and Push to GitHub

Stop the dev server with `Ctrl+C`, then:

```bash
git add .
git commit -m "Add React tic-tac-toe game"
git push origin main
```

---

## What You Learned Today

- **React Components** - Building reusable UI pieces
- **JSX Syntax** - Mixing HTML and JavaScript
- **useState Hook** - Managing data that changes
- **Props** - Passing data between components
- **Event Handling** - `onClick` in React
- **Conditional Rendering** - Showing different UI based on game state
- **Modern Tooling** - Vite for fast React development

---

## Homework (Optional)

1. Add player name inputs (type names instead of X/O)
2. Create a best-of-3 match system
3. Add CSS animations when someone wins
4. Build a different game in React (Connect Four, Memory Match)

---

## Common Issues

**Problem:** "Cannot click squares"  
**Solution:** Check that `onSquareClick` prop is passed correctly and `handleClick` is defined

**Problem:** "Winner not detected"  
**Solution:** Verify `calculateWinner` is defined and the winning line indices are correct

**Problem:** "State not updating"  
**Solution:** Use `setHistory()` - never modify `history` directly

**Problem:** "npm errors on setup"  
**Solution:** Delete `node_modules` folder and `package-lock.json`, then run `npm install` again

**Problem:** "Page is blank"  
**Solution:** Check the browser console (F12) for error messages - usually a typo in JSX

---

## Resources

- [React Official Tutorial](https://react.dev/learn/tutorial-tic-tac-toe)
- [React Hooks - useState](https://react.dev/reference/react/useState)
- [Thinking in React](https://react.dev/learn/thinking-in-react)
- [Vite Documentation](https://vitejs.dev/)

---

**[Session 2](/highschool/session2/) | [Back to GameCraft Home](/highschool/) | [Next: Session 4 - Deploy](/highschool/session4/)**
