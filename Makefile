### PARAMETERS
# uno.name=Arduino Uno
# uno.upload.protocol=arduino
# uno.upload.maximum_size=32256
# uno.upload.speed=115200
# uno.bootloader.low_fuses=0xff
# uno.bootloader.high_fuses=0xde
# uno.bootloader.extended_fuses=0x05
# uno.bootloader.path=optiboot
# uno.bootloader.file=optiboot_atmega328.hex
# uno.bootloader.unlock_bits=0x3F
# uno.bootloader.lock_bits=0x0F
# uno.build.mcu=atmega328p
# uno.build.f_cpu=16000000L
# uno.build.core=arduino
# uno.build.variant=standard
# 
# atmega328.name=Arduino Duemilanove w/ ATmega328
# atmega328.upload.protocol=arduino
# atmega328.upload.maximum_size=30720
# atmega328.upload.speed=57600
# atmega328.bootloader.low_fuses=0xFF
# atmega328.bootloader.high_fuses=0xDA
# atmega328.bootloader.extended_fuses=0x05
# atmega328.bootloader.path=atmega
# atmega328.bootloader.file=ATmegaBOOT_168_atmega328.hex
# atmega328.bootloader.unlock_bits=0x3F
# atmega328.bootloader.lock_bits=0x0F
# atmega328.build.mcu=atmega328p
# atmega328.build.f_cpu=16000000L
# atmega328.build.core=arduino
# atmega328.build.variant=standard
# 
# nano328.name=Arduino Nano w/ ATmega328
# nano328.upload.protocol=arduino
# nano328.upload.maximum_size=30720
# nano328.upload.speed=57600
# nano328.bootloader.low_fuses=0xFF
# nano328.bootloader.high_fuses=0xDA
# nano328.bootloader.extended_fuses=0x05
# nano328.bootloader.path=atmega
# nano328.bootloader.file=ATmegaBOOT_168_atmega328.hex
# nano328.bootloader.unlock_bits=0x3F
# nano328.bootloader.lock_bits=0x0F
# nano328.build.mcu=atmega328p
# nano328.build.f_cpu=16000000L
# nano328.build.core=arduino
# nano328.build.variant=eightanaloginputs

# Unlike FTDI, CH340 can be upload.speed=115200

# parts: target MPU
PARTS = -p ATmega328P

# programmer
PROG = -c ttl232r
#PROG = -c uncompatino
# Baudrate (-b): with 16  mhz Xtal (P191) and FTDI/WCH chip availability
# BAUD = -b 2400
# BAUD = -b 4800
# BAUD = -b 9600
# BAUD = -b 14400
# BAUD = -b 19200
# BAUD = -b 28800
# BAUD = -b 38400
# BAUD = -b 57600
# BAUD = -b 76800
BAUD = -b 115200

# Command (fast)
AVRDUDE = sudo HOME=$(HOME) avrdude $(PARTS) $(BAUD) $(PROG) 

# Serial Bootloader for Atmel megaAVR Controllers: HFUSE=DA
NANOHEX = /usr/share/arduino/hardware/arduino/bootloaders/atmega/ATmegaBOOT_168_atmega328.hex
# Optiboot: HFUSE=DE
UNOHEX = /usr/share/arduino/hardware/arduino/bootloaders/optiboot/optiboot_atmega328.hex

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

# burn Arduino uno flash Atmega328P 16 MHz
uno:
	# lfuse: ext. Xtal 16 MHz clock division 1
	$(AVRDUDE) -U lfuse:w:0xff:m
	# hfuse: EEPROM saved / set bootsize 11 = 256 words/ reset set 0x3f00
	# ATmega328 optiboot
	$(AVRDUDE) -U hfuse:w:0xde:m
	# efuse: brown out at ~ 2.5 V
	$(AVRDUDE) -U efuse:w:0x05:m
	# flash: write flash data
	$(AVRDUDE) -U flash:w:$(UNOHEX)
	# lock: set r/w restriction to boot loader from apps.
	$(AVRDUDE) -U lock:w:0xf:m
	# check
	$(AVRDUDE) -U lfuse:r:-:h -U hfuse:r:-:h -U efuse:r:-:h -U lock:r:-:h

# burn Arduino nano flash Atmega328P 16 MHz
nano:
	# lfuse: ext. Xtal 16 MHz clock division 1
	$(AVRDUDE) -U lfuse:w:0xff:m
	# hfuse: EEPROM saved / set bootsize 11 = 256 words/ reset set 0x3f00
	# Atmega328+(Old)
	$(AVRDUDE) -U hfuse:w:0xda:m
	# efuse: brown out at ~ 2.5 V
	$(AVRDUDE) -U efuse:w:0x05:m
	# flash: write flash data
	$(AVRDUDE) -U flash:w:$(NANOHEX)
	# lock: set r/w restriction to boot loader from apps.
	$(AVRDUDE) -U lock:w:0xf:m
	# check
	$(AVRDUDE) -U lfuse:r:-:h -U hfuse:r:-:h -U efuse:r:-:h -U lock:r:-:h

