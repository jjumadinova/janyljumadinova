---
layout: page
title: High School
subtitle: Teaching Enrichment
date: 2023-09-21T00:00:00.000Z
author: Janyl Jumadinova
---

# Robotics Enrichment Program

[EasyGoPiGo Documentation](https://gopigo3.readthedocs.io/en/master/api-basic/easygopigo3.html#)

## Sessions 2 & 3: Obstacle Course Race

Navigate in an obstacle course with lights blinking and sound blasting without hitting anything until you reach the end. Once you reach the finish line, take a picture.

### LED Lights

[LED Blinkers Code](https://github.com/DexterInd/GoPiGo_Python_Examples/blob/master/Sample_Programs_GoPiGo3/easy_Blinkers.py)

[LED Eyes Code](https://github.com/DexterInd/GoPiGo_Python_Examples/blob/master/Sample_Programs_GoPiGo3/easy_DexEyes.py)

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
pygame.mixer.music.set_volume(1)
pygame.mixer.music.play()
```

### Camera

1. Install the camera on a raspberri pi.
2. Try out the program called `TakingPhotos.ipynb` located on `gopigo` under "Examples" 

## Session 1: Getting started with `gopigo`:

1. [Turn on battery and turn on the robot](https://www.youtube.com/watch?v=aKPE6Sn8EKI&t=40s)
2. Go to mygopigo.com
3. Write Python code for robot movement (shapes)
4. [Shut down the robot](https://www.youtube.com/watch?v=Co2i673mCQ4&t=39s)

## Documentation

Explore [gopigo3 documentation](https://gopigo3.readthedocs.io/) to find out the robot's abilities.
