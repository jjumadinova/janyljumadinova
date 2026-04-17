---
layout: page
title: Session 6
subtitle: Code Your Robot
date: 2026-03-12T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 6: Make Your Robot Move!

**Goal:** Use what you learned in Sessions 1–3 — micro:bit programming, buttons, and motor control — to write a MakeCode program that makes your robot move in a motion pattern of your choice.

---

## Requirements

Your final program must meet these three rules:

1. **At least two functions** — for example `moveForward` and `stopRobot`, or `turnLeft` and `turnRight`. Functions make your code reusable and easier to read.
2. **At least one working button** — even if all it does is act as an emergency stop (`on button B pressed` → `stopRobot`). You may use both buttons for more control.
3. **A motion pattern** — pick one of the options below (or propose your own to an instructor).

---

## Choose Your Motion Pattern

Read through all three options, then pick the one that interests you most.

### Option A — Wall Following

Drive the robot along a wall (or a line of boxes).

| Button | Action |
|---|---|
| **A** | Start driving forward |
| **B** | Turn left **or** right (whichever steers the robot away from the wall) |

**How it works:**

1. Place the robot next to a wall.
2. Press **A** to start moving forward.
3. When the robot reaches a corner or gets too close, press **B** to turn it away from the wall.
4. Press **A** again to continue forward along the next stretch.

> Tip: You can add **A+B** as an emergency stop, or make **B** alternate between turning left and turning right each time it is pressed.

---

### Option B — Predefined Pattern

Program the robot to follow a fixed route automatically — no button presses needed after starting it.

**Ideas:**

- **Drive around a table** — forward, turn 90°, forward, turn 90°, repeat four times to make a rectangle.
- **Navigate the hallway** — drive forward for a set time, turn around, and come back.
- **Figure eight** — forward, turn right, forward, turn left, repeat.

**How it works:**

1. Use a sequence of function calls with `pause` blocks between them to control timing:

```
on button A pressed:
    moveForward
    pause 2000 ms
    turnRight
    pause 500 ms
    moveForward
    pause 2000 ms
    turnRight
    pause 500 ms
    ... (repeat for the full shape)
    stopRobot
```

2. Press **A** to start the pattern. Use **B** as an emergency stop at any time.

> Tip: Adjust the `pause` durations to tune distances and turn angles. Shorter pause = shorter distance or smaller turn.

---

### Option C — Button-Controlled Driving

Drive the robot entirely by hand using the micro:bit buttons — like a remote control.

| Button | Action |
|---|---|
| **A** | Move forward |
| **B** | Turn left or right (your choice) |
| **A+B** | Stop the robot |

Each button press triggers the action for a short burst (e.g., 500 ms of movement, then stop), so you tap repeatedly to steer the robot through a space.

> Tip: You can use a variable to toggle between turning left and turning right each time **B** is pressed.

---

## Part 1: Review Your Motor Setup

Your robot uses the **Motor:bit Breakout Board**. The pin mapping:

| Function | Pin in code | What it controls |
|---|---|---|
| Motor M1 direction A | `digital write pin P1` | Left motor direction |
| Motor M2 direction B | `digital write pin P2` | Right motor direction |
| Speed (both motors) | `analog write pin P0` | 0 = stop, 1023 = full speed |

If a wheel spins the wrong direction, swap the `1` and `0` values for that motor's direction pin.

---

## Part 2: Build Your Functions

Open [MakeCode](https://makecode.microbit.org/) and create a new project called **My Robot**.

Use **Make a Function** (Advanced → Functions) to create at least two of these:

**`moveForward`**
- `digital write pin P1 to 1`
- `digital write pin P2 to 1`
- `analog write pin P0 to 600`

**`moveBackward`**
- `digital write pin P1 to 0`
- `digital write pin P2 to 0`
- `analog write pin P0 to 600`

**`turnLeft`**
- `digital write pin P1 to 0`
- `digital write pin P2 to 1`
- `analog write pin P0 to 600`

**`turnRight`**
- `digital write pin P1 to 1`
- `digital write pin P2 to 0`
- `analog write pin P0 to 600`

**`stopRobot`**
- `analog write pin P0 to 0`

You do not need all five — just the ones your chosen motion pattern requires (minimum two).

---

## Part 3: Wire Up Your Buttons

Add button handlers based on your chosen option. At minimum you need **one button that stops the robot** so you can halt it in an emergency:

```
on button B pressed:
    call stopRobot
    show icon (square)
```

Then add your movement button(s). For example, if you chose **Option A — Wall Following**:

```
on button A pressed:
    call moveForward
    show icon (arrow north)

on button B pressed:
    call turnLeft
    pause 400 ms
    call stopRobot
```

---

## Part 4: Test and Tune

Work through these tests in order. Fix one issue before moving to the next.

### Test 1 — Straight line
Place the robot on a flat surface. Press **A**. Does it drive forward in a roughly straight line?
- If it veers left → try reducing the speed or swapping wires on the left motor
- If it veers right → adjust the right motor the same way

### Test 2 — Turns
Test your turn function(s). Does the robot turn roughly 90°?
- Adjust the `pause` duration after a turn call (shorter pause = smaller turn angle)

### Test 3 — Emergency stop
While the robot is moving, press your stop button. Does it stop immediately?

### Test 4 — Full run
Run your complete motion pattern in an open space. Does the robot complete the pattern as expected?

---

## Extension Challenges

If you finish early, try one or more of these:

**A — Add the IR Sensor for Obstacle Detection**
Connect your IR sensor from Session 2 to **pin P8**. Add a `forever` loop that checks the sensor and stops the robot automatically when an obstacle is detected:

```
forever:
    if digital read pin P8 = 0:
        stopRobot
        show icon (sad face)
        pause 500 ms
        turnLeft
        pause 400 ms
```

This turns your robot into an autonomous obstacle-avoider — combining everything from Sessions 1–3.

**B — Speed Ramp**
Make the robot gradually speed up from 0 to 800 over 1 second using a loop that increases `analog write pin P0` in steps of 100.

**C — LED Feedback**
Show different icons on the micro:bit display for each state: an arrow for forward, a turning arrow for turns, a square for stopped.

**D — Combine Options**
Already finished one motion pattern? Try a second one in a new project.

---

## Key Concepts You Used Today

- **Applying prior knowledge**: combining micro:bit buttons and motor control from earlier sessions into a working robot program
- **Functions**: reusable blocks that make programs easier to read and modify
- **Button input**: using physical buttons to control robot behavior
- **Iterative testing**: testing each feature in isolation before combining them
- **Timing and tuning**: adjusting pause durations to control distances and turn angles

---

## Congratulations!

You have designed, built, wired, and programmed a working robot from scratch. You moved from blinking LEDs in Session 1 all the way to a robot that drives and turns on command — great work!
