---
layout: page
title: Session 2
subtitle: Sensing the World with IR Sensors
date: 2025-01-22T00:00:00.000Z
author: Janyl Jumadinova
---

# Session 2: Sensing the World with IR Sensors

**Goal:** Connect an IR (Infrared) sensor to the micro:bit and learn the difference between analog and digital readings.

---

## What is an IR Sensor?

An **IR (Infrared) sensor** can detect objects in front of it using infrared light. It's like giving your micro:bit the ability to "see"! IR sensors are used in:
- Robots to avoid obstacles
- Automatic doors
- Line-following robots
- Proximity detection

Your IR sensor has **3 pins**:
- **VCC** - Power (connects to 3V)
- **GND** - Ground (connects to GND)
- **OUT** - Signal output (connects to Pin 0, 1, or 2)

## Connecting the IR Sensor

**Components You'll Need:**
- micro:bit
- IR sensor module
- 3 alligator clips or jumper wires
- Battery pack (optional, for portability)

**Wiring Steps:**

1. **Connect Power**
   - Connect IR sensor **VCC** pin to micro:bit **3V** pin (using red wire/clip)

2. **Connect Ground**
   - Connect IR sensor **GND** pin to micro:bit **GND** pin (using black wire/clip)

3. **Connect Signal**
   - Connect IR sensor **OUT** pin to micro:bit **Pin 0** (using yellow/white wire/clip)

**Safety Check:** Before powering on, verify all connections with your teacher!

## Understanding Digital vs Analog Readings

Sensors can send data in two ways:

**Digital Reading:**
- Only two values: **0** (LOW/False) or **1** (HIGH/True)
- Like an on/off switch
- **0** = Object detected
- **1** = No object detected

**Analog Reading:**
- Range of values: **0 to 1023**
- Like a dimmer switch
- Higher numbers = object is farther away
- Lower numbers = object is closer
- More precise than digital!

## Programming the IR Sensor

### Activity 1: Digital Reading (Simple Detection)

**Setup:**
1. In MakeCode, go to **Advanced** → **Pins**
2. In the `on start` block, add `show number` to display which pin you're using
3. Create a `forever` loop

**In the forever block:**
1. Add an `if...then...else` statement
2. From **Pins**, drag `digital read pin P0` into the if condition
3. Set the condition to: if `digital read pin P0` = **0**
4. **Then** (object detected):
   - Show icon "X"
   - Play a sound (from **Music**)
5. **Else** (path is clear):
   - Show icon "✓" (checkmark)

**Test it:** Wave your hand in front of the sensor! You should see an X and hear a sound when an object is detected, and a checkmark when the path is clear.

### Activity 2: Analog Reading with Sound Alert

**Setup:**
1. Create a new project or delete the previous code

**In the forever block:**
1. Add an `if...then...else` statement
2. Set the condition to: if `analog read pin P0` < **300**
3. **Then** (object is close):
   - Show icon "X"
   - Play a sound (from **Music**)
4. **Else** (object is far):
   - Show icon "✓" (checkmark)
5. Add a `pause 100 ms` block at the end

**Experiment:**
- What happens when you move your hand closer or farther?
- Try adjusting the 300 value - what happens if you use 500? Or 200?
- Can you find the best threshold value for detecting objects?

---

## 🎯 Challenge: Build an Obstacle Alert System

> **Your Task:** Create a system that warns when an obstacle is getting too close!

**Requirements:**
1. Use analog reading to measure distance
2. When object is **FAR** (>700): Show a checkmark, no sound
3. When object is **MEDIUM** (400-700): Show a small square, play a slow beep
4. When object is **CLOSE** (<400): Show a large square, play a fast beep
5. Add button A to display the current sensor reading as a number
6. Add button B to pause/resume the system

**Hints:**
- You'll need multiple `if...then...else if...else` statements
- Use the **Music** blocks for different beep speeds
- Use **Input** blocks for button presses
- Create a variable called `systemActive` to track if the system is on or off

**Testing Ideas:**
- Test with different objects (hand, book, wall)
- Find the maximum detection distance
- See if different colored objects give different readings

---

## Key Concepts You Learned

- How to connect a 3-pin sensor to micro:bit
- Difference between **digital (0 or 1)** and **analog (0-1023)** readings
- Using conditional statements to create detection zones
- Building a practical sensing system

**Think About It:**
- Where could you use an obstacle detector in real life?
- What other sensors could you add to make it better?
- How could this help a robot navigate?
