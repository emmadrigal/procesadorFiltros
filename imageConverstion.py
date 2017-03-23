import binascii

filename = raw_input("Please enter filename: ")
with open(filename, 'rb') as f:
    content = f.read()

f = open("hexImage.txt", 'w')
f.write(binascii.hexlify(content))
f.close
