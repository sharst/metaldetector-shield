# metaldetector-shield
Hardware and Software for a custom built metaldetector + pressure sensing shield.
This shield was used in a robotics project for contactless navigation (see https://www.youtube.com/watch?v=rSrG_VnvrPk). 

## It features:
* connection of up to 8 coils which emit and receive electromagnetical impulses
* connection of up to 8 pressure sensors to detect air pulses
* 24V connection with on-board conversion to 5V for the microcontroller
* on-board CAN-Controller to connect the board to a CAN-bus
* chaining possibility to connect two or more boards together for infinite extension

## What you can do with it:
* Contactlessly detect metal objects in the vicinity (distance depends on the coil and object used)
* build a rig of 8, 16 or more coils by chaining several boards together
* detect changes in air pressure (in our case upon collision inside an inflateable bumper)
* send all the information on a CAN or serial bus

The board and all accompanying software is fully open source, so you can get involved, too!

## Hardware setup
This is what needs to be done to get one board running (no chaining):
* Solder at least one sensing coil to the COIL_GND and COIL_1 inputs (for more information, check out --> "A note on the coils"
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
* If you want to use pressure sensors in an outdoor environment, water resistance is key. We used two cable glands connected together to create an air- and water-tight case. We connected an air tube from the one side which guided the air impulse from the bumper cushion into the case. On the other end we connected the air pressure sensor. (XXX --> See image here)
* For extra water resistance, it is possible to put the pressure sensor into a ballon before inserting it into the cable gland. (XXX --> See image here).
