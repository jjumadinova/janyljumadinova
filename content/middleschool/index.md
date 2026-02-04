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

#### Quick Review (10 minutes)

Let's review what we learned in Session 1:
- How to create programs in MakeCode
- Using variables to store data
- Displaying information on the LED grid
- Responding to button presses

**Quick Activity:** Can you make the micro:bit show a heart when you press button A?

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

#### Connecting the IR Sensor (15 minutes)

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

#### Understanding Digital vs Analog Readings (20 minutes)

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

#### Programming the IR Sensor (25 minutes)

**Activity 1: Digital Reading (Simple Detection)**

1. In MakeCode, create a `forever` loop
2. Add a block: `digital read pin P0`
3. Use an `if...then...else` statement:
   - If reading is **0**: show "X" (object detected!)
   - If reading is **1**: show "→" (path is clear)

```blocks
basic.forever(function () {
    if (pins.digitalReadPin(DigitalPin.P0) == 0) {
        basic.showIcon(IconNames.No)
    } else {
        basic.showIcon(IconNames.Yes)
    }
})
```

**Test it:** Wave your hand in front of the sensor!

**Activity 2: Analog Reading (Distance Detection)**

1. Create a new `forever` loop
2. Use `analog read pin P0` block
3. Store the value in a variable called `distance`
4. Display the value on the LED screen

```blocks
let distance = 0
basic.forever(function () {
    distance = pins.analogReadPin(AnalogPin.P0)
    basic.showNumber(distance)
})
```

**Experiment:**
- What number do you see when your hand is far away?
- What number when your hand is close?
- What's the range of values you observe?

**Activity 3: Creating Distance Zones**

Let's make the micro:bit show different images based on how close an object is:

```blocks
let distance = 0
basic.forever(function () {
    distance = pins.analogReadPin(AnalogPin.P0)
    if (distance < 300) {
        basic.showIcon(IconNames.Surprised)  // Very close!
    } else if (distance < 600) {
        basic.showIcon(IconNames.Happy)      // Medium distance
    } else {
        basic.showIcon(IconNames.Asleep)     // Far away
    }
    basic.pause(100)
})
```

**Tune the values:** Adjust 300 and 600 based on your sensor's readings!

#### Challenge: Build an Obstacle Alert System (30 minutes)

**Mission:** Create a system that warns when an obstacle is getting too close!

**Requirements:**
1. Use analog reading to measure distance
2. When object is FAR (>700): Show a checkmark, no sound
3. When object is MEDIUM (400-700): Show a small square, play a slow beep
4. When object is CLOSE (<400): Show a large square, play a fast beep
5. Add button A to pause/resume the system
6. *Bonus:* Add button B to display the current sensor reading

**Example starter code:**

```blocks
let distance = 0
let systemActive = true

input.onButtonPressed(Button.A, function () {
    systemActive = !(systemActive)
})

basic.forever(function () {
    if (systemActive) {
        distance = pins.analogReadPin(AnalogPin.P0)
        // Add your detection zones here!
    } else {
        basic.showString("OFF")
    }
})
```

**Testing Ideas:**
- Test with different objects (hand, book, wall)
- Find the maximum detection distance
- See if different colored objects give different readings

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

**Challenge:** Create a game where you shake the micro:bit to "roll a dice" and display a random number from 1 to 6.

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
