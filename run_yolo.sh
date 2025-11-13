#!/bin/bash
cd /darknet
./darknet detect cfg/yolov3.cfg yolov3.weights $1

