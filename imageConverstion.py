import numpy as np
import cv2

size1 = 400
size2 = 350
size3 = 300

filename = raw_input("Please enter the name of the 1st image: ")
image1 = cv2.imread(filename, cv2.IMREAD_GRAYSCALE)
image1 = cv2.resize(image1, (size1, size1))


filename = raw_input("Please enter the name of the 2nd image: ")
image2 = cv2.imread(filename, cv2.IMREAD_GRAYSCALE)
image2 = cv2.resize(image2, (size2, size2))


filename = raw_input("Please enter the name of the 3rd image: ")
image3 = cv2.imread(filename, cv2.IMREAD_GRAYSCALE)
image3 = cv2.resize(image3, (size3, size3))


f = open("mem_Init.mif", 'w')

f.write("DEPTH = ")
depth = str(size1*size1 + size2*size2 + size3*size3+1000)
f.write(depth)
f.write(";\n")

f.write("WIDTH = 8;\n")
f.write("ADDRESS_RADIX = HEX;\n")
f.write("DATA_RADIX = HEX;\n")
f.write("CONTENT\n")
f.write("BEGIN\n\n")

val = 1000

for i in range(size1):
    for j in range(size1):
        f.write(hex(val)[2:])
        f.write(" : ")
        num = hex(image1[i, j])
        num = num[2:]
        num = num.rjust(2, '0')
        f.write(num)
        f.write(";\n")
        val = val + 1


for i in range(size2):
    for j in range(size2):
        f.write(hex(val)[2:])
        f.write(" : ")
        num = hex(image2[i, j])
        num = num[2:]
        num = num.rjust(2, '0')
        f.write(num)
        f.write(";\n")
        val = val + 1

for i in range(size3):
    for j in range(size3):
        f.write(hex(val)[2:])
        f.write(" : ")
        num = hex(image3[i, j])
        num = num[2:]
        num = num.rjust(2, '0')
        f.write(num)
        f.write(";\n")
        val = val + 1

f.write("\n")
f.write("END;\n")

f.close
