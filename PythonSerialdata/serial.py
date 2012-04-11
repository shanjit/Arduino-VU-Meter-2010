# Shanjit Singh Jajmann
# 
import serial
import numpy
from pylab import *
import time

ser = serial.Serial('/dev/ttyUSB0', 115200)
i=0;
a=[]	
while (i<50):
  a.append(ser.readline(4))
  print(a[i])
  i=i+1

print a
b=numpy.array(a,'f')
print b
t = range(50)
axis([0,49,0,1200])
line, = plot(t, b, linewidth=1.0)
xlabel('Time Scale')
ylabel('Serial Values')
title('Serial Output')
grid(True)
show()
