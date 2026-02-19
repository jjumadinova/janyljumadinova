---
layout: page
title: Session 3
subtitle: Motors and Movement
date: 2025-01-22T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 3: Motors and Movement

**Goal:** Connect two yellow DC motors to the micro:bit using an L298N motor driver and learn to control speed and direction — the foundation of a differential-drive robot!

---

## What Are We Building?

By the end of this session you will have **two motors** wired up and controllable from the micro:bit. This is the same "differential drive" setup used in real warehouse robots, Mars rovers (simplified), and robot vacuum cleaners: two independently driven wheels that let the robot go forward, backward, and turn.

---

## Meet Your Components

### Yellow TT DC Motors

The yellow "TT" (transparent tire) gear motors are the workhorses of hobby robotics:
- **Operating voltage:** 3 V – 6 V (we'll use ~5–6 V from a battery pack)
- **Built-in gearbox** that trades speed for torque — perfect for driving wheels
- **Two solder tabs** for power (no polarity marking — swapping the wires just reverses the direction)

### L298N Motor Driver Board

The micro:bit's GPIO pins can only supply a tiny amount of current (about 5 mA on the edge connector). A motor can draw **100–200 mA** — way too much! The **L298N dual H-bridge driver** sits between the micro:bit and the motors and does the heavy lifting:

| L298N Terminal | What It Does |
|---|---|
| **OUT1 & OUT2** | Connect to **Motor A** (left motor) |
| **OUT3 & OUT4** | Connect to **Motor B** (right motor) |
| **+12V** (or **VMS**) | Motor power input — connect your battery pack positive (+) here |
| **GND** | Common ground — connect battery (–) **and** micro:bit GND here |
| **+5V** | Regulated 5 V output (leave the onboard jumper **on** when supply ≤ 12 V) |
| **ENA** | Enable / speed control for Motor A (PWM) |
| **ENB** | Enable / speed control for Motor B (PWM) |
| **IN1, IN2** | Direction control for Motor A |
| **IN3, IN4** | Direction control for Motor B |

> **Key idea:** IN1/IN2 set the *direction* of Motor A; ENA sets the *speed*. Same pattern for IN3/IN4 and ENB on Motor B.

---

## Wiring It Up

### Components You'll Need

- micro:bit + breakout board (edge connector)
- L298N motor driver module
- 2 × yellow TT DC motors (with wheels attached)
- 4 × AA battery holder (6 V) **or** a suitable USB power bank
- Jumper wires (male-to-female recommended)
- Small screwdriver for the L298N screw terminals

### Wiring Diagram

```
  Battery Pack (6 V)
      (+) ──────────► L298N  +12V (VMS)
      (–) ──────┬───► L298N  GND
                │
  micro:bit GND ┘

  L298N          micro:bit
  ─────          ─────────
  IN1  ◄──────── Pin 13 (P13)
  IN2  ◄──────── Pin 14 (P14)
  IN3  ◄──────── Pin 15 (P15)
  IN4  ◄──────── Pin 16 (P16)
  ENA  ◄──────── Pin 0  (P0)   ← PWM speed, Motor A
  ENB  ◄──────── Pin 1  (P1)   ← PWM speed, Motor B

  L298N          Motors
  ─────          ──────
  OUT1 / OUT2 ──► Left motor wires
  OUT3 / OUT4 ──► Right motor wires
```

### Step-by-Step Wiring

> ⚠️ **Keep the battery pack switched OFF (or disconnected) while wiring!**

1. **Remove the ENA and ENB jumper caps** on the L298N board — we will control speed with PWM from the micro:bit instead of running at full speed.

2. **Connect the motors**
   - Loosen the screw terminals on OUT1/OUT2 and insert the two wires from the **left motor**. Tighten.
   - Do the same for OUT3/OUT4 with the **right motor**.

3. **Connect power**
   - Battery pack **positive (+)** → L298N **+12V** terminal.
   - Battery pack **negative (–)** → L298N **GND** terminal.
   - Also run a wire from L298N **GND** to the micro:bit **GND** pin (common ground is essential!).

4. **Connect direction pins** (micro:bit → L298N)
   - P13 → IN1
   - P14 → IN2
   - P15 → IN3
   - P16 → IN4

5. **Connect speed pins** (micro:bit → L298N)
   - P0 → ENA
   - P1 → ENB

6. **Double-check** every connection with your partner, then have the teacher verify before powering on.

---

## How Motor Direction Works

The L298N uses two input pins per motor to set direction:

| IN1 | IN2 | Motor A Action |
|-----|-----|----------------|
| HIGH | LOW | Forward |
| LOW | HIGH | Backward |
| LOW | LOW | Stop (coast) |
| HIGH | HIGH | Stop (brake) |

Same logic applies to IN3/IN4 for Motor B.

---

## Programming the Motors

### Activity 1: Spin a Single Motor

**In MakeCode** — open a new project.

**On start:**
- Nothing special needed (pins default to LOW = motors off)

**On button A pressed:**
1. From **Pins**, add `digital write pin P13 to 1`
2. Add `digital write pin P14 to 0`
3. Add `analog write pin P0 to 600`

This sets Motor A to spin forward at moderate speed.

**On button B pressed:**
1. `digital write pin P13 to 0`
2. `digital write pin P14 to 0`
3. `analog write pin P0 to 0`

This stops Motor A.

**Test it!** Press A — the left motor should spin. Press B — it stops.

> **Troubleshooting:** If the motor doesn't turn, check:
> - Is the battery pack switched on?
> - Is GND shared between battery, L298N, and micro:bit?
> - Did you remove the ENA jumper cap?

### Activity 2: Forward and Backward

Add two more button handlers:

**On button A+B pressed (both together):**
1. Set Motor A **forward**: P13 = 1, P14 = 0
2. Set Motor B **forward**: P15 = 1, P16 = 0
3. Set speed for both: `analog write P0 to 700`, `analog write P1 to 700`

This drives **both motors forward**.

**On shake:**
1. Set Motor A **backward**: P13 = 0, P14 = 1
2. Set Motor B **backward**: P15 = 0, P16 = 1
3. Set speed: `analog write P0 to 700`, `analog write P1 to 700`

Shake to go in reverse!

**On logo down (tilt forward):**
1. Set all direction pins to 0
2. Set P0 and P1 to 0

Full stop!

### Activity 3: Turning with Differential Drive

A differential-drive robot turns by running its wheels at different speeds:

| Desired Turn | Left Motor (A) | Right Motor (B) |
|---|---|---|
| **Gentle left** | Slow (400) | Fast (800) |
| **Gentle right** | Fast (800) | Slow (400) |
| **Spin left (on the spot)** | Backward | Forward |
| **Spin right (on the spot)** | Forward | Backward |

**On tilt left:**
1. Motor A backward: P13 = 0, P14 = 1
2. Motor B forward: P15 = 1, P16 = 0
3. Speed both at 600

**On tilt right:**
1. Motor A forward: P13 = 1, P14 = 0
2. Motor B backward: P15 = 0, P16 = 1
3. Speed both at 600

**Try it!** Tilt the micro:bit left and right — your motors should spin in opposite directions, which would make a robot spin in place.

### Activity 4: Speed Control with a Variable

Create a variable called `speed` and set it to **500** on start.

**On button A pressed:**
- Increase `speed` by 100
- If `speed` > 1023, set `speed` to 1023
- Show `speed` on the LED display
- Update: `analog write P0 to speed`, `analog write P1 to speed`

**On button B pressed:**
- Decrease `speed` by 100
- If `speed` < 0, set `speed` to 0
- Show `speed` on the LED display
- Update: `analog write P0 to speed`, `analog write P1 to speed`

Now you have a **throttle** — A speeds up, B slows down!

---

## 🎯 Challenge: Motor Test Drive

> **Your Task:** Build a complete motor control program!

**Requirements:**
1. **Button A** — drive both motors **forward** at current speed
2. **Button B** — drive both motors **backward** at current speed
3. **Button A+B** — **stop** both motors
4. **Tilt left** — spin left (left motor backward, right motor forward)
5. **Tilt right** — spin right (left motor forward, right motor backward)
6. **Shake** — cycle through 3 speed levels (Slow → Medium → Fast) and display the level number (1, 2, 3) on the LEDs

**Bonus:**
- Add a startup animation on the LEDs when the program begins
- Play a beep when changing speed levels
- Display an arrow (↑ ↓ ← →) showing current direction on the LEDs

---

## Key Concepts You Learned

- How a **DC motor** converts electricity into rotation
- Why we need a **motor driver** (the micro:bit can't power motors directly)
- **L298N wiring**: direction pins (IN1–IN4) and speed pins (ENA/ENB)
- **PWM** (0–1023) to control motor speed like a dimmer switch
- **Differential drive** — turning a robot by varying left vs. right motor speed

**Think About It:**
- What would happen if one motor is slightly faster than the other? How could you fix it?
- How could you combine the IR sensor from Session 2 with motors to make a robot that avoids obstacles?
- What other sensors could help a robot navigate?

---

**Next Session Preview:** We'll mount everything onto a chassis and build a rolling robot! 🤖
