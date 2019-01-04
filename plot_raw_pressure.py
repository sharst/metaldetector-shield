#!/usr/bin/python
"""
Simple script to read out the serial port for any lines that start with 
'RAWPRESSURE'. It will then plot it continuously.
"""
from PythonLivePlotting import plot
import serial
import time


fig = plot.Figure(10);
lp = plot.LinePlot(fig, 10);
vl = plot.VerticalLines(fig, 10, lw=3);

refresh = time.time()

ser = serial.Serial("/dev/ttyUSB0", 115200, timeout = .1)

while True:
    line = ser.readline()
    if line != "":
        # Uncomment to see what arrives on the port.
        # print line,
        pass
    if line.startswith("RAWPRESSURE"):
        # Add the received values to the currently selected line plot
        lp.add_value(float(line.split()[-1]))
        vl.starty = min(lp.y_vals)
        vl.endy = max(lp.y_vals)
    elif line.startswith("BUMPER"):
        vl.add_value()
    if (time.time() - refresh) > 0.1:
        fig.refresh()
        refresh = time.time()
