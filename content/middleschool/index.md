---
layout: page
title: Middle School
subtitle: Teaching Enrichment
date: 2025-01-22T00:00:00.000Z
author: Janyl Jumadinova
---

# Robotics Enrichment Program

## Engineering Robots: Build, Wire, Code!

Get ready to build your own robots from the ground up! In **Engineering Robots: Build, Wire, Code!** you'll design, assemble, and program robots that move, sense, and respond to the world around them. You will learn how different parts, including motors, sensors, and circuits, work together and bring your robot ideas to life through hands-on building and coding. No experience needed—just curiosity and creativity!

### Skills You'll Develop

- Building and wiring real robots using motors, sensors, and controllers
- Programming robots to move and react to their surroundings
- Problem-solving and teamwork through design challenges
- Creative thinking and perseverance while engineering your own designs

---

### Session 2: Sensing the World with IR Sensors

**Goal:** Connect an IR (Infrared) sensor to the micro:bit and learn the difference between analog and digital readings.

---

#### What is an IR Sensor?

An **IR (Infrared) sensor** can detect objects in front of it using infrared light. It's like giving your micro:bit the ability to "see"! IR sensors are used in:
- Robots to avoid obstacles
- Automatic doors
- Line-following robots
- Proximity detection

Your IR sensor has **3 pins**:
- **VCC** - Power (connects to 3V)
- **GND** - Ground (connects to GND)
- **OUT** - Signal output (connects to Pin 0, 1, or 2)

#### Connecting the IR Sensor

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

#### Understanding Digital vs Analog Readings

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

#### Programming the IR Sensor

**Activity 1: Digital Reading (Simple Detection)**

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

**Activity 2: Analog Reading with Sound Alert**

**Setup:**
1. Create a new project or delete the previous code
2. From **Variables**, create a variable called `distance`

**In the forever block:**
1. Set `distance` to `analog read pin P0` (from **Pins** → **Advanced**)
2. Add an `if...then...else` statement
3. Set the condition to: if `distance` < **300**
4. **Then** (object is close):
   - Show icon "X"
   - Play a sound (from **Music**)
5. **Else** (object is far):
   - Show icon "✓" (checkmark)
6. Add a `pause 100 ms` block at the end

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

#### Key Concepts You Learned

- How to connect a 3-pin sensor to micro:bit
- Difference between **digital (0 or 1)** and **analog (0-1023)** readings
- Using conditional statements to create detection zones
- Building a practical sensing system

**Think About It:**
- Where could you use an obstacle detector in real life?
- What other sensors could you add to make it better?
- How could this help a robot navigate?

---

### Session 1: Introduction to micro:bit

**Goal:** Get familiar with the micro:bit, learn basic programming, and create your first interactive programs.

---

#### What is a micro:bit?

The BBC micro:bit is a small, programmable computer with:
- LED display (5×5 grid)
- Two buttons (A and B)
- Built-in sensors (accelerometer, compass, temperature)
- GPIO pins for connecting external components

#### Getting Started

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

---

<!--
---

### Session 3: Motors and Movement Basics

**Goal:** Understand how DC motors work and control them with the micro:bit.

---

#### Introduction to DC Motors

- **DC Motor:** Converts electrical energy into rotational motion
- Used for wheels, propellers, and other moving parts
- Requires more current than micro:bit pins can provide directly
- Need a motor driver to control them safely

#### Motor Control Concepts

1. **Speed Control**
   - PWM (Pulse Width Modulation) controls motor speed
   - Values from 0 (stopped) to 1023 (full speed)

2. **Direction Control**
   - Reversing polarity changes direction
   - Motor drivers handle this electronically

#### Hands-On with a Single Motor

1. **Connect Motor to Motor Driver**
   - Teacher will demonstrate safe wiring
   - Connect power supply (batteries)
   - Connect control wires to micro:bit pins

2. **Basic Motor Control**
   - Use `analog write` to control speed
   - Start with low speed values (300-500)
   - Gradually increase speed with button presses
   - Test motor response at different speeds

3. **Direction Control**
   - Program forward and reverse directions
   - Use buttons A and B for forward/backward
   - Add a stop function

**Challenge:** Create a motor control program that:
- Speeds up gradually when button A is pressed
- Slows down gradually when button B is pressed
- Displays current speed level on the LED display

---

### Session 4: Building the Robot Chassis

**Goal:** Assemble the physical robot with motors, wheels, and micro:bit controller.

---

#### Robot Components

- Chassis (robot body/frame)
- Two DC motors
- Two wheels
- Battery pack
- micro:bit
- Motor driver (L298N if compatible, or alternative)
- Wires and mounting hardware

#### Assembly Steps

1. **Mount the Motors**
   - Attach motors to the chassis on left and right sides
   - Ensure motors are aligned and secure
   - Connect wheels to motor shafts

2. **Install the Motor Driver**
   - Mount motor driver on chassis
   - Connect motors to driver outputs
   - Keep wires organized and secured

3. **Connect Power**
   - Attach battery pack to chassis
   - Wire power to motor driver
   - Test power connections (motors should NOT run yet)

4. **Mount the micro:bit**
   - Secure micro:bit in accessible location
   - Connect control wires from micro:bit to motor driver
   - Keep USB port accessible for programming

5. **Wire Organization**
   - Use zip ties or tape to secure loose wires
   - Keep wires away from wheels and moving parts
   - Label connections if helpful

**Testing:**
- DO NOT connect power yet
- Verify all connections with teacher
- Check for loose wires or components
- Prepare for programming in next session

---

### Session 5: Programming the Robot

**Goal:** Write code to make your robot move, turn, and respond to commands.

---

#### Basic Movement Functions

1. **Forward Movement**
   ```blocks
   function move_forward() {
       pins.analogWritePin(AnalogPin.P0, 700)
       pins.analogWritePin(AnalogPin.P1, 700)
   }
   ```

2. **Backward Movement**
   - Reverse motor polarity through motor driver
   - Use different pin combinations or values

3. **Turning**
   - **Left turn:** Right motor faster than left
   - **Right turn:** Left motor faster than right
   - **Spin turn:** One motor forward, one backward

4. **Stop Function**
   - Set both motor speeds to 0
   - Important for safety!

#### Creating Movement Patterns

1. **Drive Forward and Stop**
   - Move forward for 2 seconds
   - Stop for 1 second
   - Test and adjust timing

2. **Square Path**
   - Forward for a set time
   - Turn 90 degrees
   - Repeat 4 times

3. **Button Control**
   - Button A: Move forward
   - Button B: Move backward
   - A+B together: Stop
   - Tilt left/right: Turn

#### Calibration

- Motors may not be exactly the same speed
- Adjust PWM values to make robot drive straight
- Test and tune turn durations for accurate angles

**Challenge:** Program your robot to:
1. Drive in a figure-8 pattern
2. Return to approximately the starting position
3. Stop and display a smiley face when complete

---

### Session 6: Final Challenge and Showcase

**Goal:** Complete a design challenge and demonstrate your robot's capabilities.

---

#### Robot Challenge: Obstacle Course

**Mission:** Navigate your robot through a course with:
- Straight sections
- Turns (left and right)
- A finish zone

**Challenge Options (Choose Your Level):**

**Level 1: Remote Control**
- Use buttons to manually drive through the course
- Focus on precise control and timing

**Level 2: Pre-Programmed Path**
- Program a sequence of moves to complete the course
- Run the program and see if robot reaches the finish

**Level 3: Sensor Enhancement (Advanced)**
- If time allows, add a distance sensor
- Make robot stop when it detects obstacles
- Attempt autonomous navigation

#### Development Process

1. **Plan Your Approach**
   - Study the course layout
   - Sketch out movement sequence
   - Estimate timing for each section

2. **Write and Test Code**
   - Break problem into small sections
   - Test each movement separately
   - Combine movements into full program

3. **Debug and Improve**
   - Adjust speed and timing values
   - Calibrate turns for accuracy
   - Iterate until successful

4. **Document Your Design**
   - What worked well?
   - What challenges did you face?
   - How did you solve problems?

#### Showcase

- Demonstrate your robot to the class
- Explain your programming approach
- Share what you learned
- Discuss ideas for future improvements

**Reflection Questions:**
- What was the most challenging part of building your robot?
- How did you solve problems when things didn't work?
- What would you add to your robot if you had more time?
- How could robots like this be useful in the real world?
-->

## Resources

- [micro:bit Official Website](https://microbit.org/)
- [MakeCode micro:bit Editor](https://makecode.microbit.org/)
- [micro:bit Pins Guide](https://tech.microbit.org/hardware/edgeconnector/)
- [DC Motors Tutorial](https://learn.sparkfun.com/tutorials/motors-and-selecting-the-right-one)

---

## Safety Reminders

- Always disconnect power before making circuit changes
- Check all connections with teacher before powering on
- Keep wires away from moving parts
- Use appropriate resistors to protect components
- Work carefully and ask questions if unsure
