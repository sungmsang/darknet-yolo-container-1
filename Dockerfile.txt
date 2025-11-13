FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y git build-essential wget && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pjreddie/darknet.git /darknet

WORKDIR /darknet
RUN make

COPY run_yolo.sh /run_yolo.sh
RUN chmod +x /run_yolo.sh

ENTRYPOINT ["/run_yolo.sh"]
