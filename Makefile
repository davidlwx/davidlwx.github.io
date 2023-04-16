all: images
	hugo

server: images
	hugo server --disableFastRender

clean:
	rm -rf public/ resources/