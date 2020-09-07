# Raspberry Pi CAN device tree overlays

Raspberry Pi device tree overlays for all possible MCP2515 can interfaces.


## Build

```sh
make
```

You need to have the device tree compiler `dtc` installed, e.g. `dnf install dtc`.


## Use

```sh
sudo make install-raspbian  # copies *.dtbo files to /boot/overlays/
sudo make install-ubuntu  # copies *.dtbo files to /boot/firmware/overlays/
```

Load the required device tree overlay by adding the following line
to `/boot/config.txt` (or `/boot/firmware/usercfg.txt` on Ubuntu):

```txt
# MCP2515 connected to SPI4.1 (SPI 4 with CE (chip enable) 1);
#  will result in a can41 network device
dtoverlay=mcp2515-spi41
```
