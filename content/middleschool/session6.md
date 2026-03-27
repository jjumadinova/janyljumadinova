---
layout: page
title: Session 6
subtitle: Code Your Robot
date: 2026-03-12T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 6: Code Your Robot

**Goal:** Use everything you learned in Sessions 1–3 — micro:bit programming, IR sensor logic, and motor control — to write a MakeCode program that makes your completed robot chassis move, turn, and respond to the world around it.

---

## Putting It All Together

In the first three sessions you built up three core skills:

| Session | What You Learned | How You'll Use It Today |
|---|---|---|
| Session 1 | micro:bit basics — MakeCode, LEDs, buttons, variables | Program structure, button controls, display feedback |
| Session 2 | IR sensors — wiring, digital readings, conditional logic | Obstacle detection to stop or turn the robot |
| Session 3 | Motors — L298N driver, PWM speed control, differential drive | Drive the robot forward, backward, and turn |

Today all three come together in one robot program.

---

## Part 1: Review Your Motor Setup

Your robot now uses the **Motor:bit Breakout Board** instead of the L298N from Session 3. The pin mapping is the same:

| Function | Pin in code | What it controls |
|---|---|---|
| Motor M1 direction A | `digital write pin P1` | Left motor direction |
| Motor M2 direction B | `digital write pin P2` | Right motor direction |
| Speed (both motors) | `analog write pin P0` | 0 = stop, 1023 = full speed |

If a wheel spins the wrong direction when you test, swap the `1` and `0` values for that motor's direction pin.

---

## Part 2: Write Your Drive Program

Open [MakeCode](https://makecode.microbit.org/) and create a new project called **My Robot**.

### Step 1: Create helper functions

Use the **Make a Function** block (under Advanced → Functions) to create reusable move commands:

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

---

### Step 2: Basic button controls

Wire up button A and B (from Session 1) to your new functions:

- **`on button A pressed`** → call `moveForward`
- **`on button B pressed`** → call `stopRobot`
- **`on button A+B pressed`** → call `turnLeft`

Test this first — download the program, turn on the battery pack, and press the buttons to confirm each motor behaves as expected.

---

### Step 3: Add IR sensor obstacle detection

Connect your IR sensor (from Session 2) to **pin P8** (or the same pin you used in Session 2).

Add a **`forever`** loop:

```
forever:
    if digital read pin P8 = 0:
        stopRobot
        show icon (sad face)
        pause 500 ms
        turnLeft
        pause 400 ms
    else:
        (do nothing / keep current movement)
```

> **Recall from Session 2:** The IR sensor outputs `0` when it detects an obstacle close in front. Use that same logic here to make the robot stop and turn away automatically.

---

### Step 4: Combine manual and automatic control

A complete robot program lets you **start moving with a button** and **stop automatically when it hits an obstacle**:

- **`on button A pressed`** → set a variable `driving` to `true`, call `moveForward`
- **`on button B pressed`** → set `driving` to `false`, call `stopRobot`
- **`forever`** loop:
  - `if driving = true and IR sensor reads 0` → `stopRobot`, show icon, pause, `turnLeft`, pause, `moveForward`

---

## Part 3: Test and Tune

Work through these tests in order. Fix one issue before moving to the next.

### Test 1 — Straight line
Place the robot on a flat surface. Press A. Does it drive forward in a straight line?
- If it veers left → reduce the speed on the left motor (lower the P0 value while P1 is active, or swap wires for fine-tuning)
- If it veers right → adjust the right motor the same way

### Test 2 — Turn accuracy
Test `turnLeft` and `turnRight`. Does the robot turn roughly 90°?
- Adjust the `pause` duration inside the turn functions (shorter pause = smaller turn angle)

### Test 3 — Obstacle stop
Hold a book in front of the IR sensor. Does the robot stop and turn away?
- If not, check your IR sensor wiring from Session 2 and the pin number in your code

### Test 4 — Full run
Clear a space on the floor. Start the robot with button A and let it drive. It should stop and turn whenever it detects an obstacle and continue on its own.

---

## Design Challenges

Once your robot passes all four tests, try one or more of these:

**A — Speed Ramp**
Make the robot gradually speed up from 0 to 800 over 1 second using a loop that increases `analog write pin P0` in steps of 100.

**B — Three-obstacle avoidance**
If the robot has attempted to turn 3 times in a row without clearing an obstacle, make it drive backward for 1 second before trying again.

**C — Figure Eight**
Program the robot to drive forward for 2 seconds, turn right for 0.5 seconds, and repeat 8 times to trace a figure-eight shape. Tune the timing until the path closes cleanly.

**D — Sensor display**
Show the IR sensor reading live on the micro:bit LED display — a filled square when an obstacle is detected, an empty square when the path is clear.

---

## Key Concepts You Used Today

- **Applying prior knowledge**: combining micro:bit, IR sensors, and motors from Sessions 1–3 into a single working system
- **Functions**: reusable blocks that make programs easier to read and modify
- **Variables for state**: using a `driving` variable to track whether the robot should be moving
- **Sensor-driven behavior**: reading the IR sensor to change the robot's action automatically
- **Iterative testing**: testing each feature in isolation before combining them

---

## Congratulations!

You have designed, built, wired, and programmed a working autonomous robot from scratch. You moved from blinking LEDs in Session 1 all the way to a robot that drives itself and avoids obstacles — great work!
