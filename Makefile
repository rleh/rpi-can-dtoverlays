TEMPLATE_FILENAME = mcp2515-overlay.dts.template

DTBOs = \
mcp2515-spi00.dtbo mcp2515-spi01.dtbo \
mcp2515-spi10.dtbo mcp2515-spi11.dtbo mcp2515-spi12.dtbo \
mcp2515-spi20.dtbo mcp2515-spi21.dtbo mcp2515-spi22.dtbo \
mcp2515-spi30.dtbo mcp2515-spi31.dtbo \
mcp2515-spi40.dtbo mcp2515-spi41.dtbo \
mcp2515-spi50.dtbo mcp2515-spi51.dtbo \
mcp2515-spi60.dtbo mcp2515-spi61.dtbo

OVERLAYS = $(DTBOs:.dtbo=-overlay.dts)

.PHONY = clean all install
.SECONDARY: $(OVERLAYS)
.SUFFIXES:

all: $(DTBOs)

$(OVERLAYS): $(TEMPLATE_FILENAME)
	$(eval SPINR:=$(shell echo $@ | cut -c 12))
	$(eval CSNR:=$(shell echo $@ | cut -c 13))
	@cat $(TEMPLATE_FILENAME) | sed "s/##SPINR##/$(SPINR)/g" | sed "s/##CSNR##/$(CSNR)/g" > $@

%.dtbo: %-overlay.dts
	@dtc -I dts -O dtb -o $@ $<

install: $(DTBOs)
	cp $(DTBOs) /boot/firmware/overlays/

clean:
	rm -f *.dts *.dtbo
