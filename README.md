# Fractal Renderer

This mini project aims to do two things:

1. Define a Dockerfile that compiles
    [flam3](https://github.com/scottdraves/flam3) from source
    and sets up an image ready to render fractals
2. Add a wrapper shell script that does the following:
    1. Launch the Docker image, setting up two volumes
        for an input directory and an output directory.
    2. Running the image will render a pack of fractals. This
        step can take several hours.
    3. When the render is complete, send a notification via
        AWS SNS so I can get a text when my fractals are ready!
