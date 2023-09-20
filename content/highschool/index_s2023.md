---
layout: page
title: Meadville Area Senior High School
subtitle: Teaching MASH
date: 2023-04-21T00:00:00.000Z
author: Janyl Jumadinova
---

# Crawford Central MASH

## High School Game Development

### Tasks

- Have a playable 2D game based on the [First 2D Game tutorial](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html).

- Enhance the 2D game you have developed. How can you make the game your own to some degree?

## High School Robotics

Develop a dancing `gopigo` robot.

### Tasks

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
