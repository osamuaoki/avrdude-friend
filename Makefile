# parts: target MPU
PARTS = -p ATmega328P

# programmer
#PROG = -c ttl232r
PROG = -c uncompatino

# Baudrate (-b): default 150000

# Command (fast)
AVRDUDE = sudo avrdude $(PARTS) $(PROG)

HEXFILE = /usr/share/arduino/hardware/arduino/bootloaders/atmega/ATmegaBOOT_168_atmega328.hex

# chack status of chip
check:
	# check
	$(AVRDUDE) -U lfuse:r:-:h -U hfuse:r:-:h -U efuse:r:-:h -U lock:r:-:h

# Reset back to factory initial
reset:
	# erase
	$(AVRDUDE) -e
	# check
	$(AVRDUDE) -U lfuse:r:-:h -U hfuse:r:-:h -U efuse:r:-:h -U lock:r:-:h

# burn Arduino flash Atmega328P 16 MHz
set:
	# lfuse: ext. Xtal 16 MHz clock division 1
	$(AVRDUDE0) -U lfuse:w:0xff:m
	# hfuse: EEPROM saved / set bootsize 11 = 256 words/ reset set 0x3f00
	$(AVRDUDE) -U hfuse:w:0xd6:m
	# efuse: brown out at ~ 2.5 V
	$(AVRDUDE) -U efuse:w:0x05:m
	# flash: write flash data
	$(AVRDUDE) -U flash:w:$(HEXFILE)
	# lock: set r/w restriction to boot loader from apps.
	$(AVRDUDE) -U lock:w:0xf:m
	# check
	$(AVRDUDE) -U lfuse:r:-:h -U hfuse:r:-:h -U efuse:r:-:h -U lock:r:-:h

