import numpy as np
import cv2

filename = raw_input("Please enter the name of the 1st image: ")
image1 = cv2.imread(filename, cv2.IMREAD_GRAYSCALE)
filename = raw_input("Please enter the name of the 2nd image: ")
image2 = cv2.imread(filename, cv2.IMREAD_GRAYSCALE)
filename = raw_input("Please enter the name of the 3rd image: ")
image3 = cv2.imread(filename, cv2.IMREAD_GRAYSCALE)

image1 = cv2.resize(image1, (450, 450))
image2 = cv2.resize(image2, (400, 400))
image3 = cv2.resize(image3, (350, 350))


f = open("hexImage.mif", 'w')

f.write("DEPTH = ")
depth = str(3*image1.shape[0]*image1.shape[1] + image2.shape[0]*image2.shape[1] + image3.shape[0]*image3.shape[1] + 1000)
f.write(depth)
f.write(";\n")

f.write("WIDTH = 8;\n")
f.write("ADDRESS_RADIX = HEX;\n")
f.write("DATA_RADIX = HEX;\n")
f.write("CONTENT\n")
f.write("BEGIN\n\n")

val = 1000

for i in range(image1.shape[0]):
    for j in range(image1.shape[1]):
        f.write(hex(val)[2:])
        f.write(" : ")
        num = hex(image1[i, j])
        num = num[2:]
        num = num.rjust(2, '0')
        f.write(num)
        f.write(";\n")
        val = val + 1


for i in range(image2.shape[0]):
    for j in range(image2.shape[1]):
        f.write(hex(val)[2:])
        f.write(" : ")
        num = hex(image2[i, j])
        num = num[2:]
        num = num.rjust(2, '0')
        f.write(num)
        f.write(";\n")
        val = val + 1

for i in range(image3.shape[0]):
    for j in range(image3.shape[1]):
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
