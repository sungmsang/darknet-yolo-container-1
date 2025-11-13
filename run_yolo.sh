#!/bin/bash
set -e

if [ $# -lt 1 ]; then
  echo "사용법: docker run <이미지이름> <이미지URL>"
  exit 1
fi

IMG_URL="$1"

cd /darknet

if [ ! -f yolov3.weights ]; then
  echo "yolov3.weights 다운로드 중..."
  wget https://pjreddie.com/media/files/yolov3.weights
fi

echo "이미지 다운로드 중..."
wget -O input.jpg "$IMG_URL"

echo "YOLOv3 탐지 실행 중..."
./darknet detect cfg/yolov3.cfg yolov3.weights input.jpg
