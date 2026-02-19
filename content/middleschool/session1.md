---
layout: page
title: Session 1
subtitle: Introduction to micro:bit
date: 2025-01-22T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 1: Introduction to micro:bit

**Goal:** Get familiar with the micro:bit, learn basic programming, and create your first interactive programs.

---

## What is a micro:bit?

The BBC micro:bit is a small, programmable computer with:
- LED display (5×5 grid)
- Two buttons (A and B)
- Built-in sensors (accelerometer, compass, temperature)
- GPIO pins for connecting external components

## Getting Started

1. **Access the Editor**
   - Go to [makecode.microbit.org](https://makecode.microbit.org/)
   - Click **New Project** and give it a name

2. **Interface Overview**
   - **Left:** Simulator showing your micro:bit
   - **Middle:** Block categories
   - **Right:** Programming workspace

3. **First Program: Hello World**
   - From **Basic**, drag `show string` into the `on start` block
   - Type "Hello!" in the text field
   - Click the simulator to see it run
   - Download to a real micro:bit (connect via USB)

4. **Interactive Program: Button Counter**
   - From **Input**, drag `on button A pressed`
   - Inside it, add `show number` with a variable
   - Use **Variables** to create a counter that increases each press
   - Add button B to decrease the counter

5. **Sensor Exploration**
   - Use the accelerometer to detect shaking
   - Display different images when tilted left/right
   - Show temperature readings on the LED display

---

## 🎯 Challenge: Dice Rolling Game

> Create a game where you shake the micro:bit to "roll a dice" and display a random number from 1 to 6.

**Hints:**
- Use the `on shake` input block
- Use `pick random 1 to 6` from the **Math** category
- Display the result with `show number`
- Add a short animation before showing the result for fun!

---

## Key Concepts You Learned

- What a micro:bit is and what it can do
- How to use the MakeCode editor
- Programming with blocks: `on start`, `forever`, `on button pressed`, `on shake`
- Using variables to keep track of values
- Displaying text, numbers, and icons on the LED grid

**Think About It:**
- What other programs could you make with just the built-in buttons and sensors?
- How might you use the micro:bit to solve a real-world problem?
- What happens if you combine multiple inputs (buttons + sensors)?
