BROWSERIFY = node_modules/.bin/browserify
BOWER = node_modules/.bin/bower

suite.js: $(BROWSERIFY) bower_components/mocha $(shell find tests -type f)
	$(BROWSERIFY) \
		--debug \
		--transform coffeeify \
		--noparse ./node_modules/imjs/js/im.js \
		--outfile suite.js \
		tests/*.coffee

bower_components/mocha: $(BOWER)
	$(BOWER) install mocha

$(BOWER):
	npm install .

$(BROWSERIFY):
	npm install .

clean:
	rm --force suite.js

.PHONY: clean
