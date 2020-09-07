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

```
Name:   mcp2515-spiXY
Info:   Configures the MCP2515 CAN controller on spiX.Y
        You have to enable the SPI peripherals using the 'spiX-Ncs' (N is
        the number of CE lines required) overlays before for every SPI
        peripheral except spi0.
Load:   dtoverlay=mcp2515-spiXY,<param>=<val>
Params: oscillator              Clock frequency for the CAN controller (Hz)
                                Default: 16 MHz

        spimaxfrequency         Maximum SPI frequence (Hz)
                                Default: 10 MHz

        interrupt               GPIO for interrupt signal
                                Default: 25
```
