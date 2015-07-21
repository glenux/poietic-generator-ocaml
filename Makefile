all: build

build: 
	corebuild -cflag -annot -pkg opium,cow.syntax hello_world.native
	#corebuild -pkg opium,cow.syntax hello_world.native
