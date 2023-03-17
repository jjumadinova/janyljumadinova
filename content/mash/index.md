---
layout: page
title: Meadville Area Senior High School
subtitle: Teaching MASH
date: 2023-02-16T00:00:00.000Z
author: Janyl Jumadinova
---

# Crawford Central MASH

## High School Game Development

- [Godot Key Concepts](https://docs.godotengine.org/en/stable/getting_started/introduction/key_concepts_overview.html#)
- [Step by Step Learning Concepts](https://docs.godotengine.org/en/stable/getting_started/step_by_step/index.html)
- [First 2D Game](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html)
	- Starter Code for `Player`
```
extends Area2D

signal hit

export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
```

## High School Robotics

### Working with Robots

1. [Turn on battery and turn on the robot](https://www.youtube.com/watch?v=aKPE6Sn8EKI&t=40s)
2. Connect to robot's wifi
3. Go to mygopigo.com and click on `Code` -> `Python`
4. Complete the activity 
5. [Shut down the robot](https://www.youtube.com/watch?time_continue=39&v=Co2i673mCQ4&embeds_euri=https%3A%2F%2Fwww.google.com%2F&source_ve_path=MzY4NDIsMzY4NDIsMzY4NDI&feature=emb_logo)

### Activity: Robotic Races - March 17

We will hold robotic racing challenges! You will need to program your robot to be able to complete in a sprint and box pushing races. You can elect to develop either an ethical (e.g., respectful) or an aggressive (e.g., interfering) robot behavior.

#### Race Rules

All robots will begin on the same line. The end line will be marked with tape. Robot positions (left/right) will be determined randomly by the instructor.

1. **Sprint race:** Robots will race along a straight path for three meters until the end line is reached. The robot that reaches the end line _first_ wins.
2. **Push race:** Each robot will have a small box right in front of it (front center). The robot needs to push the box along a straight path for three meters until it pushes the box across the end line. The robot that pushes the small box across the end line _first_ wins.