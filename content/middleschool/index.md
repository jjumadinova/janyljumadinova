---
layout: page
title: Middle School
subtitle: Teaching Enrichment
date: 2024-01-24T00:00:00.000Z
author: Janyl Jumadinova
---

# Robotics Enrichment Program

## Middle School Robotics Majors

[EasyGoPiGo Documentation](https://gopigo3.readthedocs.io/en/master/api-basic/easygopigo3.html#)

## Session 1

### Getting started with `gopigo`:

1. [Turn on battery and turn on the robot](https://www.youtube.com/watch?v=aKPE6Sn8EKI&t=40s)
2. Go to mygopigo.com or `10.10.10.10`
3. Write Bloxter code for robot movement
4. Write Python code for robot movement
5. [Shut down the robot](https://www.youtube.com/watch?time_continue=39&v=Co2i673mCQ4&embeds_euri=https%3A%2F%2Fwww.google.com%2F&source_ve_path=MzY4NDIsMzY4NDIsMzY4NDI&feature=emb_logo)

## Sessions 2, 3 & 4

### Search & Rescue Mission

Navigate in a maze with lights blinking and sound blasting without hitting anything until locate a lost object (reach the end). Once located, take a picture.

### LED Lights

[LED Blinkers Code](https://github.com/DexterInd/GoPiGo_Python_Examples/blob/master/Sample_Programs_GoPiGo3/easy_Blinkers.py)

[LED Eyes Code](https://github.com/DexterInd/GoPiGo_Python_Examples/blob/master/Sample_Programs_GoPiGo3/easy_DexEyes.py)

### Camera

Try out the program called `TakingPhotos.ipynb` located on `gopigo` under "Examples" 

### Speakers

1. Plug in the speaker
2. Find a open-source tune
   - [Sound Examples](https://ccrma.stanford.edu/~jos/pasp/Sound_Examples.html)
   - [Sound Effects](https://bvker.com/foley-sound-effects/)
   - [Sound Events](https://zenodo.org/record/5117901)
4. Try it in the code
   - [pygame.mixer commands](https://www.pygame.org/docs/ref/mixer.html)

```
import pygame

# Play music
pygame.mixer.init()    
pygame.mixer.music.load("music.mp3")
pygame.mixer.music.play()
```

### Distance Sensor

1. Plugin the distance sensor
2. Try it out in the code

```
import easygopigo3 as easy

gpg = easy.EasyGoPiGo3()
my_distance_sensor = gpg.init_distance_sensor() # init the distance sensor
steps = 100 # times
t = 0
while t < steps:
    dist = my_distance_sensor.read_inches()
    if dist > 20:
        gpg.drive_inches(5)
    else:
        gpg.turn_degrees(90)
    t = t + 1
```

## Middle School Robotics Minors

### Exploring `gopigo`:

1. [Turn on battery and turn on the robot](https://www.youtube.com/watch?v=aKPE6Sn8EKI&t=40s)
2. Go to mygopigo.com
3. Drive the robot around using remote control (buttons)
4. Go to Code -> Bloxter
5. Write block-based code for robot movement
6. Write Python code for robot movement
7. [Shut down the robot](https://www.youtube.com/watch?time_continue=39&v=Co2i673mCQ4&embeds_euri=https%3A%2F%2Fwww.google.com%2F&source_ve_path=MzY4NDIsMzY4NDIsMzY4NDI&feature=emb_logo)
