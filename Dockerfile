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
RUN make install

# Move back up to the /fractals directory
WORKDIR /fractals

# Add the scripts directory to the image
COPY scripts/ /fractals/scripts

# Launch Bash so we can try it out!
ENTRYPOINT ["./scripts/render.sh"]
