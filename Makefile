NINJA=ninja -C out/cur

all:
	@$(NINJA)

test: all
	cd libpng-1.6.0 && ../out/cur/pngtest

clean:
	@$(NINJA) -t clean

dist:
	scripts/dist.py

distclean:
	rm -Rf out/

run: all
	out/cur/Antares.app/Contents/MacOS/Antares

sign:
	codesign --force \
		--sign "Developer ID Application" \
		--entitlements resources/entitlements.plist \
		out/cur/Antares.app

.PHONY: all clean dist distclean run sign test
