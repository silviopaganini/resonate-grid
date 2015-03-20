# BORROWED from field.io =)

# Variables
BIN = ./node_modules/.bin
COFFEE = ${BIN}/coffee
BROWSERIFY = ${BIN}/browserify
UGLIFY = ${BIN}/uglifyjs
# MOCHA = ${BIN}/mocha

# Targets
default: dist

deps:
	if test -d "node_modules/coffee-script"; then echo "dependencies installed"; else npm install; fi;
	
clean:
	rm -rf lib/
	rm -rf build/

# compile the NPM library version to JavaScript
build: clean
	${COFFEE} -o lib/ -c src/

watch: clean
	${COFFEE} -o lib/ -cw src/

# compiles the NPM version files into a combined minified web .js library
web: build
	mkdir build/
	${BROWSERIFY} lib/res-grid.js > build/res-grid.js
	${UGLIFY} build/res-grid.js > build/res-grid.min.js

docs:
	# docco src/*.coffee

# run unit tests using MOCHA
tester: 
	# web
	# rm resonate-grid-1.0.3.tgz
	# npm pack resonate-grid
	# cd test; rm -rf node_modules/resonate-grid ; npm install ../resonate-grid-1.0.3.tgz

dist: deps web

publish: dist
	npm publish