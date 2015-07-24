all: build

build: 
	corebuild poieticServer.native
	corebuild poieticCli.native
	corebuild poieticBot.native

clean:
	corebuild -clean
