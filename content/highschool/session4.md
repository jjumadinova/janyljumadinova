---
layout: page
title: Session 4
subtitle: Build Tic-Tac-Toe with React
date: 2025-01-15T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 4: Tic-Tac-Toe with React ⭕❌

## 🎯 What You'll Build Today

A fully functional Tic-Tac-Toe game built with **React** - a modern framework used by Facebook, Netflix, and thousands of professional developers!

**Features:**
- Interactive game board
- Win detection
- Reset button
- Turn indicator
- Component-based architecture

**[See the finished example →](your-demo-link-here)**

---

## 🤔 What is React?

**React** is a JavaScript library for building user interfaces with **reusable components**.

Think of it like LEGO blocks:
- Instead of one giant HTML file, you build small pieces (components)
- Each piece has its own structure, style, and behavior
- You combine pieces to make complete applications

**Why React?**
- ✅ Reusable components (write once, use everywhere)
- ✅ Automatic UI updates when data changes
- ✅ Industry-standard (used by top companies)
- ✅ Makes complex UIs easier to manage

---

## 🚀 Setup (10 minutes)

### Use Vite (Modern React Setup)

**In Replit:**
1. Create a new Repl
2. Choose **"React + Vite"** template
3. Name it: `gamecraft-session4-tictactoe`
4. Replit will auto-install everything!

**Or in your terminal:**
```bash
npm create vite@latest tictactoe -- --template react
cd tictactoe
npm install
npm run dev
```

### 🔍 What Just Happened?

Vite created a React project with:
- `src/App.jsx` - Main React component (we'll edit this!)
- `src/main.jsx` - Entry point
- `package.json` - Dependencies list
- `.jsx` files - JavaScript + XML (JSX) = React syntax

---

## 📖 Part 1: Understanding Components (10 minutes)

### React Concepts

**1. Components** - Reusable UI pieces (like functions that return HTML)

```jsx
function Button() {
    return <button>Click Me</button>;
}
```

**2. JSX** - HTML-like syntax in JavaScript

```jsx
const name = "Player";
return <h1>Hello, {name}!</h1>; // Outputs: Hello, Player!
```

**3. State** - Data that can change (triggers re-render)

```jsx
const [count, setCount] = useState(0); // count = 0 initially
setCount(5); // Updates count to 5 and re-renders
```

**4. Props** - Pass data between components (like function parameters)

```jsx
<Square value="X" />
```

---

## 🎮 Part 2: Build the Game (35 minutes)

### Step 1: Clear the Template

Open `src/App.jsx` and **replace everything** with:

```jsx
import { useState } from 'react';
import './App.css';

function App() {
  return (
    <div className="game">
      <h1>⭕ Tic-Tac-Toe ❌</h1>
      <p>Let's build this together!</p>
    </div>
  );
}

export default App;
```

### Step 2: Create a Square Component

A square is a single button in the grid.

```jsx
function Square({ value, onSquareClick }) {
  return (
    <button className="square" onClick={onSquareClick}>
      {value}
    </button>
  );
}
```

**🔍 What's happening?**
- `{ value, onSquareClick }` - Props (data passed from parent)
- `{value}` - Shows X, O, or nothing
- `onClick={onSquareClick}` - Calls function when clicked

### Step 3: Create the Board Component

The board is 9 squares arranged in a grid.

```jsx
function Board({ xIsNext, squares, onPlay }) {
  // Handle when a square is clicked
  function handleClick(i) {
    // Don't allow clicks if:
    // 1. Square is already filled
    // 2. Someone already won
    if (squares[i] || calculateWinner(squares)) {
      return;
    }

    // Copy the squares array
    const nextSquares = squares.slice();
    
    // Set X or O depending on whose turn it is
    if (xIsNext) {
      nextSquares[i] = 'X';
    } else {
      nextSquares[i] = 'O';
    }

    // Send the new board state up to parent
    onPlay(nextSquares);
  }

  // Determine game status
  const winner = calculateWinner(squares);
  let status;
  if (winner) {
    status = '🎉 Winner: ' + winner;
  } else if (squares.every(square => square)) {
    status = '🤝 Draw!';
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
```

**🔍 Key Concepts:**
- `squares` array holds the board state: `['X', null, 'O', ...]`
- `.slice()` creates a copy (React best practice - don't mutate state)
- `.every()` checks if all squares are filled (draw condition)
- We pass `handleClick(i)` to each square with the index

### Step 4: Update the App Component (Main Logic)

Replace your `App` function with:

```jsx
function App() {
  // Game state
  const [history, setHistory] = useState([Array(9).fill(null)]);
  const [currentMove, setCurrentMove] = useState(0);
  const xIsNext = currentMove % 2 === 0; // Even moves = X, odd = O
  const currentSquares = history[currentMove];

  // Handle a play
  function handlePlay(nextSquares) {
    const nextHistory = [...history.slice(0, currentMove + 1), nextSquares];
    setHistory(nextHistory);
    setCurrentMove(nextHistory.length - 1);
  }

  // Reset game
  function resetGame() {
    setHistory([Array(9).fill(null)]);
    setCurrentMove(0);
  }

  return (
    <div className="game">
      <h1>⭕ Tic-Tac-Toe ❌</h1>
      <Board xIsNext={xIsNext} squares={currentSquares} onPlay={handlePlay} />
      <button className="reset-button" onClick={resetGame}>
        🔄 New Game
      </button>
    </div>
  );
}
```

**🔍 State Management:**
- `history` - Array of board states (allows time travel!)
- `currentMove` - Which move we're viewing
- `xIsNext` - Calculated from current move (even = X's turn)

### Step 5: Add the Win Detection Function

At the **top of the file**, after imports:

```jsx
function calculateWinner(squares) {
  // All possible winning lines
  const lines = [
    [0, 1, 2], // Top row
    [3, 4, 5], // Middle row
    [6, 7, 8], // Bottom row
    [0, 3, 6], // Left column
    [1, 4, 7], // Middle column
    [2, 5, 8], // Right column
    [0, 4, 8], // Diagonal \
    [2, 4, 6], // Diagonal /
  ];

  for (let i = 0; i < lines.length; i++) {
    const [a, b, c] = lines[i];
    if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
      return squares[a]; // Return 'X' or 'O'
    }
  }
  return null; // No winner yet
}
```

---

## 🎨 Part 3: Styling (5 minutes)

### Replace `src/App.css` with:

```css
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

## ✅ Test Your Game!

Click Run (Replit) or check the local server. You should have a fully working Tic-Tac-Toe game!

**Test these scenarios:**
1. X and O alternate turns
2. Winning shows the winner
3. Filled board shows draw
4. Reset button clears the board
5. Can't click filled squares

---

## 🎨 Customization Challenges

**Easy:**
1. Change colors in CSS
2. Add emojis instead of X/O (🌟 vs 🌙)
3. Change board size in `.board` CSS

**Medium:**
4. Add a score tracker (X wins vs O wins)
5. Add sound effects on click and win
6. Highlight the winning line

**Hard:**
7. Add a move history list (time travel!)
8. Add AI opponent (hint: minimax algorithm)
9. Make it 4x4 with different win conditions

---

## 💡 Challenge: Score Tracker

Add this to `App` component:

```jsx
const [scores, setScores] = useState({ X: 0, O: 0 });

// In handlePlay, after detecting a win:
const winner = calculateWinner(nextSquares);
if (winner) {
  setScores(prev => ({ ...prev, [winner]: prev[winner] + 1 }));
}

// Display scores:
<div className="scores">
  <p>X: {scores.X} | O: {scores.O}</p>
</div>
```

---

## 📚 What You Learned Today

✅ **React Components** - Building reusable UI pieces  
✅ **JSX Syntax** - Mixing HTML and JavaScript  
✅ **useState Hook** - Managing component state  
✅ **Props** - Passing data between components  
✅ **Event Handling** - onClick in React  
✅ **Conditional Rendering** - Showing different UI based on state  
✅ **Array Methods** - `.map()`, `.slice()`, `.every()`

---

## 🚀 Next Session Preview

**Session 5:** Deploy your games to the web with **GitHub Pages** and add polish (animations, sounds, high scores)!

---

## 📦 Homework (Optional)

1. Add player name inputs (let users choose names instead of X/O)
2. Create a best-of-3 match system
3. Add animations when someone wins
4. Build a different game in React (Rock-Paper-Scissors, Memory Match)

---

## 🆘 Common Issues

**Problem:** "Can't click squares"  
**Solution:** Check that `onSquareClick` prop is passed and `handleClick` is defined

**Problem:** "Winner not detected"  
**Solution:** Verify `calculateWinner` function and winning line indices

**Problem:** "State not updating"  
**Solution:** Make sure you're using `setHistory`, not modifying `history` directly

**Problem:** "npm errors"  
**Solution:** Delete `node_modules` folder and `package-lock.json`, then run `npm install`

---

## 📖 Resources

- [React Official Tutorial](https://react.dev/learn/tutorial-tic-tac-toe)
- [React Hooks - useState](https://react.dev/reference/react/useState)
- [Thinking in React](https://react.dev/learn/thinking-in-react)
- [Vite Documentation](https://vitejs.dev/)

---

**[← Session 3](/highschool/session3/) | [Back to GameCraft Home](/highschool/) | [Next: Session 5 →](/highschool/session5/)**
