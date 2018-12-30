#!/usr/bin/python
"""
Simple script to read out the serial port for any lines that start with 
'RAWCOIL'. It will then plot the last ten lines of samples in one line plot each.
"""
from PythonLivePlotting import plot
import serial
import numpy as np


NUMBER_OF_LINEPLOTS = 10

fig = plot.Figure(None, rolling_figure=False)
# Create 10 lineplots
lps = [plot.LinePlot(fig, history=np.inf) for _ in range(NUMBER_OF_LINEPLOTS)]

# Initialize them empty
[lps[ind].add_value(0, 0) for ind in range(NUMBER_OF_LINEPLOTS)]

ser = serial.Serial("/dev/ttyUSB0", 115200, timeout = .1)

ind = 0
while True:
    line = ser.readline()
    if line!="":
        # Uncomment to see what arrives on the port.
        # print line,
        pass
    if line.startswith("RAWCOIL"):
        # Add the received values to the currently selected line plot
        lps[ind].reset()
        [lps[ind].add_value(float(x), i) for i, x in enumerate(line.split()[1:])]
        ind = (ind + 1) % NUMBER_OF_LINEPLOTS

    if ind % NUMBER_OF_LINEPLOTS == 0:
        fig.refresh()
