---
layout: page
title: Crawford Central Middle School Courses
subtitle: Teaching MAMS
date: 2023-03-24T00:00:00.000Z
author: Janyl Jumadinova
---

# Crawford Central


## Middle School Robotics Minors

### GoPiGo Tasks

Make a dancing robot, the one that moves to music!

Below is the sample code using a speaker and some sample music files:

```
import easygopigo3 as easy

gpg = easy.EasyGoPiGo3()


# Play music
pygame.mixer.init()    
pygame.mixer.music.load("music.mp3")
pygame.mixer.music.set_volume(1)
pygame.mixer.music.play()

# Add actions

# Stop playing music
pygame.mixer.music.stop()
```

### Music Files

- [Happy](Happy.mp3)
- [Wii_Music](Wii_Music.mp3)
- [No_Role_Modelz](No_Role_Modelz.mp3)

### Arduino Robot Tasks:

Explore line following, obstacle avoidance programs using Elegoo robots

- [IR remote control programs](https://www.youtube.com/watch?v=1msnPf8uimU&feature=youtu.be&themeRefresh=1)

## Middle School Robotics Majors

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

### Reminders on Working with GoPiGo Robots

1. [Turn on battery and turn on the robot](https://www.youtube.com/watch?v=aKPE6Sn8EKI&t=40s)
2. Go to mygopigo.com
4. Go to Code -> Python
5. Try existing Python code
6. Create own code for robot races
7. [Shut down the robot](https://www.youtube.com/watch?time_continue=39&v=Co2i673mCQ4&embeds_euri=https%3A%2F%2Fwww.google.com%2F&source_ve_path=MzY4NDIsMzY4NDIsMzY4NDI&feature=emb_logo)

### Arduino Robots

- [Build instructions](https://www.youtube.com/watch?v=GQi99xmohdw)
- [Try IR remote control programs](https://www.youtube.com/watch?v=1msnPf8uimU&feature=youtu.be&themeRefresh=1)
- [Code Tutorial](https://www.elegoo.com/blogs/arduino-projects/elegoo-smart-robot-car-kit-v4-0-tutorial)
