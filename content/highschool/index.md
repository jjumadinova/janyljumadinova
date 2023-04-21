---
layout: page
title: Meadville Area Senior High School
subtitle: Teaching MASH
date: 2023-03-21T00:00:00.000Z
author: Janyl Jumadinova
---

# Crawford Central MASH

## High School Game Development

###  Tasks

- Have a playable 2D game based on the [First 2D Game tutorial](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html).

%- Last time we finished [Coding the player](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/03.coding_the_player.html)
%- First, please verify your player is able to move around appropriately.
%- Then, move on to [Creating the enemy](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/04.creating_the_enemy.html) and the following sections. 
%- By the end of the session, you should aim to have a 2D game that is playable.

%### Supplemental Task: Enhancing the game

- Enhance the 2D game you have developed. How can you make the game your own to some degree?
%- If you have time, start putting those ideas to practice. 
	
## High School Robotics %: Tasks for March 31st

%### Task 1: Robotic Races

%We will hold robotic racing challenges! Last time you programmed your robot to be able to complete in a sprint and box pushing races. You could elect to develop either an ethical (e.g., respectful) or an aggressive (e.g., interfering) robot behavior. Today, we will actually run those races. **Everyone must participate for evaluation.**

%#### Race Rules

%All robots will begin on the same line. The end line will be marked with tape. 

%1. **Sprint race:** Robots will race along a straight path for three meters until the end line is reached. The robot that reaches the end line _first_ wins.
%2. **Push race:** Each robot will have a small box right in front of it (front center). The robot needs to push the box along a straight path for three meters until it pushes the box across the end line. The robot that pushes the small box across the end line _first_ wins.

### Tasks %2: Implement a dancing gopigo robot

%After races are complete, use the remainder of the session, to begin 

Developing a dancing `gopigo` robot. %You will finish this project during our next session and will demonstrate it for evaluation.

#### Requirements

- Your robot must use a speaker and play music.
- Your code must use an `if` statement. Ask a teaching assistant for help with this task!
- Your code must use a loop (such as `for` or `while` loop). Ask a teaching assistant for help with this task!

Below is the sample code using a distance sensor and a speaker:
```
import easygopigo3 as easy
import time
import pygame

gpg = easy.EasyGoPiGo3()
my_distance_sensor = gpg.init_distance_sensor() # init the distance sensor, the distance will be measure in millimeter
max_dis_t = 25 # maximum steps the robot can go
min_distance = 250 # the min distance to a curtain object is 250mm
t = 0  # init the number of steps

# Play music
pygame.mixer.init()    
pygame.mixer.music.load("music.mp3")
pygame.mixer.music.set_volume(1)
pygame.mixer.music.play()
     
while t <= max_dis_t:
    # Directly print the values of the sensor.
    print("Distance Sensor Reading (mm): " + str(my_distance_sensor.read_mm()))
    
    t = t + 1
    print("time = ", t)
    
    # if not encounter an object
    if my_distance_sensor.read_mm() > min_distance:
        gpg.drive_inches(5)       # go straight 5 inches
    else: 
        gpg.turn_degrees(90)    # turn right if encounter a object 


# Stop playing music
pygame.mixer.music.stop()
```

### Reminder: Working with Robots

1. [Turn on battery and turn on the robot](https://www.youtube.com/watch?v=aKPE6Sn8EKI&t=40s)
2. Connect to robot's wifi
3. Go to mygopigo.com and click on `Code` -> `Python`
4. Complete the activity 
5. [Shut down the robot](https://www.youtube.com/watch?time_continue=39&v=Co2i673mCQ4&embeds_euri=https%3A%2F%2Fwww.google.com%2F&source_ve_path=MzY4NDIsMzY4NDIsMzY4NDI&feature=emb_logo)