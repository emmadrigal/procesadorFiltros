import numpy as np
import cv2


def valuePrint(filename, data, position):
    f.write(hex(position + 3)[2:])
    f.write(" : ")
    num = hex(data & 255)
    num = num[2:]
    num = num.rjust(2, '0')
    f.write(num)
    f.write(";\n")

    data = data >> 8

    f.write(hex(position + 2)[2:])
    f.write(" : ")
    num = hex(data & 255)
    num = num[2:]
    num = num.rjust(2, '0')
    f.write(num)
    f.write(";\n")

    data = data >> 8

    f.write(hex(position + 1)[2:])
    f.write(" : ")
    num = hex(data & 255)
    num = num[2:]
    num = num.rjust(2, '0')
    f.write(num)
    f.write(";\n")

    data = data >> 8

    f.write(hex(position)[2:])
    f.write(" : ")
    num = hex(data & 255)
    num = num[2:]
    num = num.rjust(2, '0')
    f.write(num)
    f.write(";\n")


filename = raw_input("Please enter the name of the image: ")
imageSize = int(raw_input("Please desired size: "))
image1 = cv2.imread(filename, cv2.IMREAD_GRAYSCALE)
image1 = cv2.resize(image1, (imageSize, imageSize))


f = open("mem_Init.mif", 'w')

f.write("DEPTH = ")
depth = str(imageSize*imageSize + 1000)
f.write(depth)
f.write(";\n")

f.write("WIDTH = 8;\n")
f.write("ADDRESS_RADIX = HEX;\n")
f.write("DATA_RADIX = HEX;\n")
f.write("CONTENT\n")
f.write("BEGIN\n\n")

valuePrint(f, 400, 92)
valuePrint(f, 400, 96)
valuePrint(f, 1000, 100)
valuePrint(f, 161000, 104)
valuePrint(f, 373500, 108)

val = 1000

for i in range(imageSize):
    for j in range(imageSize):
        f.write(hex(val)[2:])
        f.write(" : ")
        num = hex(image1[i, j])
        num = num[2:]
        num = num.rjust(2, '0')
        f.write(num)
        f.write(";\n")
        val = val + 1
        
f.write("\n")
f.write("END;\n")

f.close
