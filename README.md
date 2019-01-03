# metaldetector-shield
Hardware and Software for a custom built metaldetector + pressure sensing shield.
This shield was used in a robotics project for contactless navigation (see https://www.youtube.com/watch?v=rSrG_VnvrPk). 
The hardware and software were jointly developed by Simon Harst and Stefan Brüwer.

## It features:
* connection of up to 8 coils which emit and receive electromagnetical impulses
* connection of up to 8 pressure sensors to detect air pulses
* 24V connection with on-board conversion to 5V for the microcontroller
* on-board CAN-Controller to connect the board to a CAN-bus
* chaining possibility to connect two or more boards together for infinite extension
* a ROS example to use it in your robotics application: [www.github.com/sharst/metaldetector-ros](https://github.com/sharst/metaldetector-ros)

## What you can do with it:
* Contactlessly detect metal objects in the vicinity (distance depends on the coil and object used)
* build a rig of 8, 16 or more coils by chaining several boards together
* detect changes in air pressure (in our case upon collision inside an inflateable bumper)
* send all the information on a CAN or serial bus

The board and all accompanying software is fully open source, so you can get involved, too!

## Hardware setup
### How does this work?
The heart of this shield is an arduino microcontroller, which rapidly triggers 8 rigs of transistors connected to coils. From the impulse of current, the coils generate an electromagnetical impulse. In case there is metal in front of the coil, it will reflect part of the impulse which in turn can be sensed by the coil. The weaker echo of the impulse is again converted to current in the coil, which is measured by an ADC on the board. If you want to see a typical response as measured by the ADC, check out the coil response gif below (--> Configuration files). The board sums up the response. This sum can be used to infer whether a metal object is present and how far away it is.

In addition, the shield can measure impact in terms of air pressure. To do that it constantly measures a rolling average of up to 8 air pressure sensors independently. In case it measures a spike of air pressure above a threshold, it emits a custom message.

![The metaldetector shield](https://github.com/sharst/metaldetector-shield/blob/master/images/metaldetector-shield-v2.3-with-coil.jpeg)

This is what needs to be done to get one board running (no chaining):
* Solder at least one sensing coil to the COIL_GND and COIL_0 inputs (for more information, check out --> "A note on the coils"
* (Optionally) connect one BMP180-pressure sensor to one of the pressure inputs
* Connect the arduino on the board to your PC and flash the current firmware
* Set jumper J1 to set the board to MASTER mode
* Set jumper J2 to disable chaining
* In case you do not have a coil/capacitor installed at the 24V input, set jumper J3 to bridge the coil connector
* Connect 24V to one of the 24V ports
* The values of the coils are being output on the serial port now (115200baud)

### To enable chaining
Chaining allows you to connect two boards together. The impulses of the coils will influence one another. Therefore you should not operate two coils close together if you want accurate results. The metaldetector board already takes care that up to 8 coils are fired independently in a row and do not influence each other. If you need more than 8 coils, you can use chaining. Chaining uses an additional signal line between two boards, and the boards will take care to always fire their coils alternatingly.
* Remove jumper J2 to enable chaining
* Set jumper J1 on one board to make it the chaining MASTER. Remove the jumper on all other boards to make them slaves
* You can directly chain the 24V power source as well by connecting the secondary 24V-port to the next board
* Connect to signal wires between the boards. The first one should go from output (>) on board 1 to input (<) on board 2. The second one goes from input (<) on board 1 to output (>) on board 2.
* If you want to connect more than two boards together, connect them in a circle, always taking care that the output goes to the input of the next board, and the input is connected to the output of the previous board.
* If you are using the CAN bus, make sure that the boards are using unique CAN addresses (set them in metaldetector-shield.ino --> TX_CAN_ID and RX_CAN_ID)

### How to produce the boards
* We always ordered our boards at PCB-Pool (in Germany). They accept the kicad-files given in the hardware folder directly as input. 
* You can order the entire BOM on farnell, including the wire for the coils. Check out the BOM in the hardware folder.

### A word on the coils
The coils are key when it comes to which objects can be detected. Here's a few notes:
* The larger the coil diameter, the less focused the impulse will be. In general you get a weaker response with larger coils, but also you cover less area
* We tested both with round and rectangular coils, both worked great.
* The more impedance, the less current flow you will get at the fixed 24V, which means less stronger impulses and responses. But it also means less power consumption.
* The more windings the coil has, the stronger the impulse. But also you will naturally get higher impedance with more windings.
* you will have to experiment to find the best tradeoff for your application. In our case it was a coil from 0.4mm wire with 150 windings equalling to ~11 Ohm.

### A note on the pressure sensors
* We ordered the BMP180 sensors on ebay. Note that there are several versions. The boards we used are 1cm x 1.2cm in size. We hand-crimped the cables to connect them via the JST-plugs.
* If you want to use pressure sensors in an outdoor environment, water resistance is key. We used two cable glands connected together to create an air- and water-tight case. We connected an air tube from the one side which guided the air impulse from the bumper cushion into the case (blue arrow). On the other end we connected the air pressure sensor (red arrow). [See image here.](https://github.com/sharst/metaldetector-shield/blob/master/images/air_pressure_connector.jpg).
* For extra water resistance, it is possible to put the pressure sensor into a ballon before inserting it into the cable gland. [See image here.](https://github.com/sharst/metaldetector-shield/blob/master/images/air_pressure_connector_balloon.jpeg)


## Software setup
We've tried to make the software setup as easy as possible for you. Therefore, all the software needed is bundled in this repository, either directly or by submodules.

### To get the arduino running
```
# Go anywhere where you want to check out this repo
cd ~
git clone https://github.com/sharst/metaldetector-shield
cd metaldetector-shield
# Get all the contained submodules
git submodule init 
git submodule update
# The repository contains an arduino folder. This is basically an arduino sketchbook setup and ready to go. First backup your current one:
mv ~/sketchbook ~/sketchbook_bckp
# Now link the one from the repository with a symbolic link. This means you can still use and manage the repository in the original location, but arduino will find your files.
ln -s ~/metaldetector-shield/arduino ~/sketchbook
```
* Open the arduino IDE (tested with v 1.6.9)
* Select Tools --> Board --> Arduino Nano
* Tools --> Programmer --> AVR ISP
* File --> Open --> ~/sketchbook/arduino/metaldetector_shield.ino
* Upload
* Open Serial Console, set it to 115200 baud, watch the output.

### Overview of the software
./arduino: Contains all the software relevant to the arduino (i.e. the firmware and all libraries)
./PythonLivePlotting: A library to do dynamical plots and updates of figures

#### Configuration files
board_v23.h : Contains mostly pin settings (hardwired on the board, don't change them!). You can also set some identifiers on where pressure and heartbeat signals get send on the CAN-BUS, and the identifier to switch coils.  
metaldetector-shield.ino: The main sketch for upload. Contains some interesting settings:
  * TX_CAN_ID: The CAN ID used for writing messages on the bus. If you are using several boards on the same bus, make sure this is unique for each board.
  * RX_CAN_ID: The ID that this board listens on for messages on the bus. You can dynamically switch some functionalities on the board by sending messages. Make sure this ID is unique for this board.
  * DEBUG: Whether or not to output information on the serial bus.
  * COMM_TIMEOUT: How many ms to wait for a signal from the slave board in chaining mode
  * DEBUG_RAW_ADC_COIL: Only works when DEBUG==true. This will output the raw measurements of the given coil as sampled by the ADC. Run python plot_raw_coil.py to visualize these values. This is a sample output where we approach a metal object to the coil:
![Raw output of ADC values](https://github.com/sharst/metaldetector-shield/blob/master/images/coil_response.gif)

#### Typical operation mode
Check out the loop-function in the main sketch. A loop consists of the following steps:
* If coils are enabled, trigger each coil once and read out the results
* we want to average over several measurements. coil.data_ready() goes to True as soon as we have collected this amount of measurements
* In case some coil data is ready we will output it on the serial bus as a four-byte message, which will be in the format ```[40 (COIL_REGISTER set in board_v23.h), [0-7] (coil_index), highbyte(value), lowbyte(value)]```
* The communication state is toggled so the next board can start measuring
* We now sample the pressure sensors. If one of them transitions a threshold value, we encode this information bitwise. For instance, if pressure sensors 2 and 4 have surpassed the threshold value since the last call, get_bumper_transitions will output 0b00010100 (the second and fourth bit are True).
* We now send out the string "BUMPER" on the serial bus. On the CAN-bus we will send the bitcoded value, this time in the format ```[25 (PRESSURE_REGISTER set in board_v23.h), 0, highbyte(bitcode), lowbyte(bitcode)]```.
* We send out a heartbeat message on the CAN bus. This message contains the information on which ports some pressure sensors are connected and whether the metal sensing functionality is currently switched on. Which ports are currently connected to pressure sensors is again encoded bitwise, i.e. 0b10001001 means that there are sensors connected on the first, fourth and eigth connector on the board. A heartbeat message has the format ```[30 (HEARTBEAT_REGISTER set in board_v23.h), bitwise encoding of connected sensors, (1 or 0 whether coils are enabled)]```

#### Getting the CAN bus running
* In order to interface with a CAN bus from a computer, you typically need a CAN to USB converter. We had some eccellent results with the [USBtin](https://www.fischl.de/usbtin/). It is open source, has a superb interface, a loving maintainer and can be ordered readily assembled.
* In order to connect it, just connect the HIGH, LOW and GND (marked as "T" on the USBtin) lines between the two boards. 
* If you want to connect more metaldetector boards, there are two CAN connectors on each one: One coming in, one going out.
* In addition, you need one termination resistor somewhere on the bus, typically on the last element of the bus chain. If this last element is a metaldetector board, you can simply set jumper J4 to enable the termination resistor.
* Connect the USBTin to your computer, open the interface and set it to 500kbps and see the messages from the board coming in. 
* There is also a ROS driver available which directly interfaces the metaldetector-board to ROS messages [www.github.com/sharst/metaldetector-ros](www.github.com/sharst/metaldetector-ros)

## Summary: Information flow from the metaldetector-shield
![Information flow from the metaldetector-shield](https://github.com/sharst/metaldetector-shield/blob/master/images/data-transfer.png)

