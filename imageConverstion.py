import numpy as np
import cv2

def weightedAverage(pixel):
    return 0.299*pixel[0] + 0.587*pixel[1] + 0.114*pixel[2]

filename = raw_input("Please enter filename: ")
image = cv2.imread(filename, cv2.IMREAD_GRAYSCALE)

imgHex = ""

for i in range(image.shape[0]):
    for j in range(image.shape[1]):
        imgHex = imgHex + hex(image[i, j])[2:]

f = open("hexImage.txt", 'w')
f.write(imgHex)
f.close
