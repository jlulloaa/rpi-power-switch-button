#!/usr/bin/env python
    """_summary_
        This file listens for a change in the switch button (i.e. when it's pressed)
        This file has to be manually copied into /usr/local/bin so the associated service file (listen-for-shutdown.service) can find it
        
    """
import RPi.GPIO as GPIO
import subprocess


GPIO.setmode(GPIO.BCM)
GPIO.setup(3, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.wait_for_edge(3, GPIO.FALLING)

subprocess.call(['shutdown', '-h', 'now'], shell=False)
