#!/usr/bin/python3
# coding: UTF-8

import sys
memory_file = sys.argv[1] 
output_file = sys.argv[2] 
#output_file2 = "mem_clean.bin"

file = open(memory_file, "rb")
coe = open(output_file, "w")
#binf = open(output_file2, "wb")

# ignore first 2 bytes (header)
byte = file.read(4)
byte = file.read(1)
file.read(1)

count = 0
buffer = "MEMORY_INITIALIZATION_RADIX=16;\nMEMORY_INITIALIZATION_VECTOR=" 

#print(byte.hex())

while count < 255:
    buffer += "{}, ".format(byte.hex())
#    print("{}, ".format(byte.hex()))
#    binf.write(byte)
    byte = file.read(1)
    file.read(1)
    count += 1

buffer = buffer[:-2]
buffer += ";"

#print(buffer)
coe.write(buffer)

file.close()
coe.close()
#binf.close()
