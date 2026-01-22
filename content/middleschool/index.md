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

[Assessment form](https://forms.gle/r4KBwPLqnJ79C6bDA)

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

**Challenge:** Create a game where you shake the micro:bit to "roll a dice" and display a random number from 1 to 6.

---

### Session 2: micro:bit Circuits and External Components

**Goal:** Learn about GPIO pins, circuits, and connect external LEDs to your micro:bit.

---

#### Understanding GPIO Pins

- **GPIO** = General Purpose Input/Output
- micro:bit has pins numbered 0, 1, 2, 3V, and GND
- These pins can send signals to or receive signals from external components

#### Circuit Basics

1. **Safety First**
   - Always disconnect power when wiring
   - Check connections before powering on
   - Use correct resistor values to protect LEDs

2. **Components You'll Use**
   - LEDs (Light Emitting Diodes)
   - Resistors (typically 100-220 ohms)
   - Jumper wires
   - Breadboard

#### Building Your First Circuit

1. **Simple LED Circuit**
   - Connect GND pin to the negative rail on breadboard
   - Connect Pin 0 to a resistor
   - Connect resistor to the long leg (positive) of an LED
   - Connect short leg (negative) of LED to GND rail

2. **Programming the LED**
   - Use `digital write pin P0 to 1` to turn LED on
   - Use `digital write pin P0 to 0` to turn LED off
   - Create a blinking pattern with `pause` blocks

3. **Multiple LEDs**
   - Add LEDs to pins 1 and 2
   - Create a traffic light sequence (red → yellow → green)
   - Add button controls to change the pattern

**Challenge:** Create a "robot status indicator" with 3 LEDs showing different colors for different modes (standby, moving, stopped).

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

---

## Resources

- [micro:bit Official Website](https://microbit.org/)
- [MakeCode micro:bit Editor](https://makecode.microbit.org/)
- [micro:bit GPIO Pin Guide](https://microbit.org/get-started/user-guide/pins/)
- [DC Motors Tutorial](https://learn.sparkfun.com/tutorials/motors-and-selecting-the-right-one)

---

## Safety Reminders

- Always disconnect power before making circuit changes
- Check all connections with teacher before powering on
- Keep wires away from moving parts
- Use appropriate resistors to protect components
- Work carefully and ask questions if unsure
