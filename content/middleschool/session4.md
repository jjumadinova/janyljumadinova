---
layout: page
title: Sessions 4 and 5
subtitle: Design and Build Your Robot Chassis
date: 2026-03-12T00:00:00.000Z
author: Janyl Jumadinova
---

# Sessions 4 and 5: Design and Build Your Robot Chassis

**Goal:** Plan and build a cardboard chassis that fits all your robot's components — two motors, two wheels, a battery pack, and the Motor:bit Breakout Board with the micro:bit mounted on top.

---

## Why We're Switching to the Motor:bit Board

In Session 3 you used an L298N motor driver — a large board wired up with many jumper wires. Today we're upgrading to the **Motor:bit Breakout Board**, which is a much better fit for a compact robot.

| Feature | L298N Motor Driver | Motor:bit Breakout Board |
|---|---|---|
| Connects to micro:bit | Many jumper wires | micro:bit plugs directly into board |
| Size | Large / bulky | Small and compact |
| Mounting | Harder to attach | Flat board, easy to platform-mount |
| Wiring complexity | High | Low |

**How the Motor:bit works:**
- Your **micro:bit slides directly into the edge-connector slot** on the Motor:bit board — no wires needed between them
- The board has built-in motor driver circuits — no separate L298N
- **M1 terminals** → left motor; **M2 terminals** → right motor
- It accepts power from a battery pack (4 × AA recommended)
- All micro:bit pins are still accessible for sensors

---

## Part 1: Connect the Motor:bit Board

### Step 1: Plug in the micro:bit

Slide your micro:bit into the edge-connector slot on the Motor:bit board. The LED display should face up and away from the board. Press it in firmly until it seats fully.

### Step 2: Connect the motors

The Motor:bit has screw terminals labeled **M1+**, **M1−**, **M2+**, and **M2−**.

For each motor:
1. Use a small screwdriver to **loosen** the two screws on the terminal slightly.
2. Insert the wires:
   - **Red wire** from the motor → **M1+** (left motor) or **M2+** (right motor)
   - **Black wire** from the motor → **M1−** (left motor) or **M2−** (right motor)
3. **Tighten** the screws firmly so the wires cannot be pulled out.

> **Which motor is M1 and which is M2?** It doesn't matter yet — you can swap them later if a wheel spins the wrong way. For now, use M1 for the left motor and M2 for the right motor.

### Step 3: Connect the battery pack

The Motor:bit has power terminals labeled **VIN** and **GND**.

1. **Loosen** the VIN and GND screws.
2. Insert the wires:
   - **Red wire** from the battery pack → **VIN**
   - **Black wire** from the battery pack → **GND**
3. **Tighten** both screws.

> ⚠️ **Keep the battery pack switched OFF while connecting wires.** Only turn it on when you are ready to test.

### Step 5: Test the motors with code

Open [MakeCode](https://makecode.microbit.org/) and create a new project or use your code from Session 3. Use the same pin blocks from Session 3 — the Motor:bit exposes the same pins:

| Function | Pin in code | What it controls |
|---|---|---|
| Motor M1 direction A | `digital write pin P1` | Left motor direction |
| Motor M2 direction B | `digital write pin P2` | Right motor direction |
| Speed (both motors) | `analog write pin P0` | 0 = stop, 1023 = full speed |

**Quick test program:**

Test one motor:

- **`on button A pressed`**
  1. `digital write pin P1 to 1`
  2. `digital write pin P2 to 0`
  3. `analog write pin P0 to 600`

Download the code, switch the battery on, and press **A** — motor should forward spin. 

---

## Part 2: Build the Chassis

A **two-wheeled robot chassis** made from cardboard. Your finished chassis must hold every component securely:

| Component | Notes |
|---|---|
| 2 × DC motors | One per side, each driving one wheel |
| 2 × wheels | Attached directly to motor shafts |
| 1 × battery pack | Powers everything |
| 1 × Motor:bit board + micro:bit | The robot's brain, sitting on a raised platform |

---

## Step 1: Sketch Your Design 

Before cutting anything, **draw a top-down blueprint** of your chassis on paper.

**Questions to answer in your sketch:**

1. **How big does the base need to be?** Lay all your components on a piece of paper and trace around them first — add ~2 cm margin on each side.
2. **Where do the motors go?** Motors go on opposite left and right sides, near the back, so wheels drive from the rear.
3. **Where does the battery pack go?** Heavy things should sit low and centered so the robot doesn't tip. Make sure you can still flip the switch.
4. **Where does the Motor:bit platform go?** It needs a flat raised surface near the center; the micro:bit LED display should face up so you can read it.
5. **Where do wires run?** Sketch rough paths from the motors and battery to the Motor:bit board so wires won't get caught in wheels.

**Sketch checklist before you continue:**
- [ ] Base plate dimensions marked
- [ ] Left motor location
- [ ] Right motor location
- [ ] Battery pack location (switch side accessible)
- [ ] Motor:bit platform location
- [ ] Wire routing paths sketched

> **Tip:** There is no single right answer — compare your design with teammates and discuss the trade-offs!

---

## Step 2: Gather Your Materials

Each team needs:

- Several sheets of **corrugated cardboard** (cardboard boxes are best; cereal boxes work for smaller pieces)
- **Scissors** and/or a box cutter 
- **Masking tape** and **hot glue** 
- **Ruler** and **pencil/marker** for measuring and marking
- All robot components: 2 motors, 2 wheels, battery pack, Motor:bit board, micro:bit

---

## Step 3: Cut Your Base Plate

1. Using your sketch measurements, mark a rectangle on cardboard.
2. Add **at least 1 cm margin** on all sides so nothing hangs off the edge.
3. Cut along the lines. Ask the teacher if you need help with the box cutter.
4. **Strength test:** Hold the base by one corner. Does it flex? If yes, cut a second identical piece and glue the two layers together — this doubles the stiffness.

> **Check:** Place all components on the cut base plate. Do they all fit with room to spare? Adjust before moving on.

---

## Step 4: Mount the Motors

Motors must be held firmly — they twist hard when driving wheels and will pop loose if just taped flat.

**Method A — Cardboard bracket:**
1. Cut two strips of cardboard (~3 cm × 10 cm each).
2. Fold each strip into a U-shape that wraps snugly around the motor body.
3. Glue and tape the bracket flat to the base plate.
4. Slide the motor into the bracket and tape or glue it in place.

**Method B — Side wall with shaft notch:**
1. Cut two side-wall panels and glue them vertically along the left and right edges of the base.
2. Cut a circular notch in each wall just large enough for the motor shaft to pass through.
3. Slot the motor in so the shaft sticks out through the notch; glue/tape the motor body to the wall.

**Rules for both methods:**
- Motors go on **opposite sides** (one left, one right).
- Motor shafts point **outward** so wheels mount on the outside of the chassis.
- Both motors must be at the **same height** so the robot rolls flat.

---

## Step 5: Add a Front Skid

Two drive wheels alone will let the front of the robot drag on the ground. Add a simple skid:

1. Cut a small cardboard square (~4 cm × 4 cm).
2. Stack and glue 2–3 layers until it's the same height as the bottom of the wheels.
3. Tape or glue it to the underside of the **front center** of the base plate.
4. Optional: tape a smooth bottle cap or a small piece of packing tape on the bottom of the skid to reduce friction.

> This is your **third contact point** with the ground — it keeps the front from nose-diving!

---

## Step 6: Build a Raised Platform for the Motor:bit Board

The Motor:bit board (with micro:bit plugged in) needs to sit **flat, stable, and easy to reach**.

1. Cut a cardboard platform about 1 cm larger than the Motor:bit board on all sides.
2. Cut **4 cardboard pillars** (~2–3 cm tall each) and glue one under each corner of the platform piece.
3. Glue the assembled platform (pillars + top) onto your chassis base in your planned location.
4. Set the Motor:bit board on top — do **not** glue the board itself, since you need to plug/unplug the micro:bit and connect motor wires.

> **Why raised?** It protects the board from floor bumps, keeps wires accessible, and lets you read the micro:bit LED display.

---

## Step 7: Secure the Battery Pack

1. Set the battery pack in its planned location on the base.
2. Create **two strap loops** using strips of tape or thin cardboard fed through small slots cut in the base plate — like a seatbelt for the battery.
3. Alternatively, build a cardboard pocket around three sides and tape across the top.

**Must-haves:**
- The **on/off switch** remains accessible without tools.
- The **connector cable** has enough slack to reach the Motor:bit board.

---

## Step 8: Route and Tidy Your Wires

Before everything is sealed up:

1. Lay motor wires flat along the base and tape them at intervals so they cannot sag below the chassis.
2. Route all wires toward the Motor:bit platform — leave a small loop of slack near the board so it can be lifted slightly without ripping a connection.
3. Check that **no wire dangles below the base plate** — wires on the floor will drag and get caught.

---

## ✅ Chassis Checklist

Run through every item before calling the build done:

- [ ] Base plate is stiff (holds its shape when picked up by one corner)
- [ ] Both motors are firmly attached and don't wobble
- [ ] Both wheels attach to motor shafts and spin freely by hand
- [ ] Front skid is the correct height — robot sits level on a flat surface
- [ ] Motor:bit platform is flat and the board sits securely on top
- [ ] micro:bit can be plugged into and unplugged from the Motor:bit board without disassembly
- [ ] Battery pack is strapped down and the switch is reachable
- [ ] All wires are routed away from wheels and above floor level

---

## 🎯 Design Challenges

Once your chassis passes the checklist, try one or more of these:

**A — Straight Roll Test**
Set the robot down on a flat surface and give it a gentle push. Does it roll in a straight line? If it veers, check whether both motors are perfectly parallel to each other. Realign and retest.

**B — Stress Test**
Pick the assembled robot up by the Motor:bit platform. Does anything shift, flex, or fall off? Reinforce weak spots with extra tape or a folded cardboard gusset in the corner.

**C — Ground Clearance Check**
Measure the gap between the bottom of the base plate and the floor. Aim for at least **5 mm of clearance** — too little and the robot will high-center on uneven ground.

---

## Key Concepts You Learned

- **Chassis design**: sketching and planning component placement before cutting
- **Motor:bit Breakout Board**: how it replaces the L298N and hosts the micro:bit directly
- **Structural cardboard engineering**: layers, brackets, pillars, and gussets for rigidity
- **Cable management**: routing and securing wires so they don't interfere with moving parts
- **Iterative design process**: sketch → build → test → improve

---

## What's Next?

In **Session 6** you'll use everything you learned in Sessions 1–3 — micro:bit programming, sensor logic, and motor control — to write the full MakeCode program that makes your robot drive forward, turn, and stop under its own power!

**Think About It:**
- What would you change about your chassis design now that it's built?
- How does placing heavy components low and centered affect balance?
- Why is it important to keep every component accessible even after the robot is assembled?
