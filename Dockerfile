# Compile Flam3 from source ================================================
FROM ubuntu:latest
WORKDIR /fractals

# Install Dependencies and clone source code
RUN apt-get update
RUN apt-get install -y git build-essential\
    zlib1g-dev libpng-dev libxml2-dev libjpeg-dev
RUN git clone https://github.com/scottdraves/flam3.git

# Move into repo and compile source code
WORKDIR /fractals/flam3
RUN ./configure
RUN make

# Launch Bash so we can try it out!
CMD ["bash"]
