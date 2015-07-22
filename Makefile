all: build

build: 
	corebuild server.native
	@#corebuild cli.native
	@#corebuild bot.native


clean:
	corebuild -clean
