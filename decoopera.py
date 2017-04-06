# -*- coding: utf-8 -*-
def decodiopera(operacion):
    if operacion == "ADD":
        opcode = [0, 0, 0, 0]
        tipo = "r"
    elif operacion == "SUB":
        opcode = [0, 0, 0, 1]
        tipo = "r"
    elif operacion == "MUL":
        opcode = [0, 0, 1, 0]
        tipo = "r"
    elif operacion == "AND":
        opcode = [0, 0, 1, 1]
        tipo = "r"
    elif operacion == "OR":
        opcode = [0, 1, 0, 0]
        tipo = "r"
    elif operacion == "XOR":
        opcode = [0, 1, 0, 1]
        tipo = "r"
    elif operacion == "NOT":
        opcode = [0, 1, 1, 0]
        tipo = "r"
    elif operacion == "MAX":
        opcode = [0, 1, 1, 1]
        tipo = "r"
    elif operacion[0:3] == "CMP":
        opcode = [1, 0, 0, 0]
        tipo = "r"
    elif operacion == "SLL":
        opcode = [1, 0, 0, 1]
        tipo = "r"
    elif operacion == "SLR":
        opcode = [1, 0, 1, 0]
        tipo = "r"
    elif operacion == "MOV":
        opcode = [1, 0, 1, 1]
        tipo = "i"
    elif operacion == "LD":
        opcode = [1, 1, 0, 0]
        tipo = "i"
    elif operacion == "ST":
        opcode = [1, 1, 0, 1]
        tipo = "i"
    elif operacion == "BT":
        opcode = [1, 1, 1, 0]
        tipo = "i"
    elif operacion == "NOP":
        opcode = [1, 1, 1, 1]
        tipo = "n"
    else:
        tipo = "null"
        opcode = []
    return [tipo, opcode]