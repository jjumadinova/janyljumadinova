---
layout: page
title: Middle School
subtitle: Teaching Enrichment
date: 2024-09-04T00:00:00.000Z
author: Janyl Jumadinova
---

# Robotics Enrichment Program

## Middle School "Robot + Game = ?" Majors Schedule

What happens when robots and games collide? In Robot + Game = ?, you'll step into the role of a robotics engineer and game developer, using a game engine to bring intelligent machines to life in virtual worlds. Design and simulate autonomous robots - like drones that navigate through dynamic environments, avoiding obstacles in real time. Through hands-on projects, you'll integrate LiDAR-based sensing and learning algorithms to develop robotic behavior. 

Learning Outcomes:

- Ability to use a game engine-based simulation to create and test robotic systems.
- Problem-solving and teamwork through iterative development and testing.

### Session 5

**Goal:** Learn Unity game engine basics and create your first robot simulation.

---

#### Unity Tutorial

Reference this tutorial if you fall behind:

- [Unity Basics Tutorial](https://www.youtube.com/watch?v=XtQMytORBmM)

**Resources:**
- **[Download Unity Assets](https://github.com/jjumadinova/janyljumadinova/tree/main/content/middleschool/Unity_assets)** - Collection of images and assets for your first Unity project

Follow along with the video to:
1. Navigate the Unity interface
2. Add and manipulate 3D objects
3. Create basic movements
4. Build an executable game

### Session 4

**Goal:** Experiment with underwater robots using manual control and understand robot movements in aquatic environments.

---

#### Underwater Robot Exploration

1. **Introduction to Underwater Robotics**
   - Learn about ROVs (Remotely Operated Vehicles)
   - Understand how underwater robots differ from land robots
   - Discuss buoyancy, water resistance, and thruster systems

2. **Manual Control Practice**
   - Connect to the underwater robot system
   - Practice basic movements: forward, backward, up, down, rotate
   - Experiment with thruster control and navigation

3. **Movement Challenges**
   - Navigate through underwater obstacles
   - Practice maintaining depth and orientation
   - Test different movement patterns and speeds
   - Figure out optimal control strategies

4. **Observations and Discussion**
   - Compare underwater robot control to land robots
   - Discuss challenges faced during manual control
   - Share strategies that worked well

### Session 3

**Goal:** Program and control physical GoPiGo robots to perform autonomous movements.

---

#### Getting Started with GoPiGo

1. **Connect to Your Robot**
   - Turn on the GoPiGo robot
   - On your computer, connect to the robot's WiFi network
   - Open a web browser and navigate to **10.10.10.10**
   - You should see the Bloxter programming interface

2. **Explore the Bloxter Interface**
   - Familiarize yourself with the block categories
   - Look at Movement, Sensors, and Control blocks
   - Try the example programs provided

3. **Basic Movement Programming**
   - Make your robot drive forward for 2 seconds
   - Add a turn (left or right)
   - Create a simple path (square or triangle)
   - Test and debug your code

4. **Add Sensor Input**
   - Use the distance sensor to detect obstacles
   - Program the robot to stop when it senses a wall
   - Make it turn and continue exploring

5. **Challenge: Maze Navigation**
   - Set up a simple maze with obstacles
   - Program your robot to navigate through it
   - Use sensors to avoid collisions
   - Test and improve your solution

**Tips:**
- Save your programs frequently
- Start simple and add complexity gradually
- If something doesn't work, check your block connections
- Test small sections of code before combining them

### Session 2

**Goal:** Create a simple robot game where a robot character navigates a world, senses obstacles, collects goals, and has sound + music.

---

#### 1. Create Your Robot Character
1. Go to [MakeCode Arcade](https://arcade.makecode.com/).
2. Click **New Project**, name it.
3. From the **Sprites** category, drag out `set mySprite to sprite of kind Player`.
4. Click on the sprite image to draw your own robot character.
5. Run the game to see your robot appear.

#### 2. Build a Scene
1. From **Scene**, drag out a `set tilemap to` block.
2. Create a map with walls (e.g., maze or obstacle area).
3. Add a starting area and some open space for the robot to move.

#### 3. Add Autonomous Movement
1. From **Sprites**, drag `set mySprite vx to` and `set mySprite vy to`.
2. Give your robot an automatic velocity (e.g., vx = 50, vy = 0).
3. Run the game — your robot should move on its own.

#### 4. Simulate Sensing (Bumpers)
1. From **Sprites**, use `on sprite of kind Player hits wall`.
2. Inside, change the velocity so the robot turns (e.g., vx = 0, vy = 50).
3. Test it — your robot should bounce or turn when it “senses” a wall.

#### 5. Add a Goal
1. Create another sprite (goal, treasure, or object).
2. Place it on a random tile: use **Scene → place sprite on top of random tile**.
3. Add an overlap event: `on sprite of kind Player overlaps Goal`.
4. Inside, increase score by 1 and move the goal to a new random spot.

#### 6. Add Music and Sound
1. From **Music**, add `play melody` at the start of the game for background music.
2. Add a `play sound effect` inside the overlap event (when robot gets a goal).
3. Test - you should hear music and effects.

#### 7. Make It a Game
1. From **Info**, add a timer (e.g., 30 seconds).
2. Challenge: How many goals can your robot collect before time runs out?
3. Optional: Add hazards (enemies) that reduce score when touched.

### Session 1

- [Introduction to Robotics](https://docs.google.com/presentation/d/1lBvxaRCd3KU_Ci5lfe21iA764TSjV_uB2NCJ-5d7bz0/pub?start=false&loop=false&delayms=3000)
- [Virtual Robot Movements](https://vr.vex.com/)
  1. File -> Open Examples, select `Drivetrain Moves and Turns`
  2. Study the code blocks, run the example
  3. SELECT PLAYGROUND -> Wall Maze
  4. Modify the code to make it to the finish
  5. Save (Ctrl + S) your program
- Object Sensing
  1. Open a new project
  2. File -> Open Examples -> Coral Reef Cleanup 3
  3. Test the example code
  4. Improve it
