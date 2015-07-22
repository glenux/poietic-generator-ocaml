all: build

build: 
	corebuild server.native

clean:
	corebuild -clean
	#corebuild -pkg opium,cow.syntax hello_world.native
