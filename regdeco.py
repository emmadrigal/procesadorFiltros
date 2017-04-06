# -*- coding: utf-8 -*-
registros = {
    'R0': [0, 0, 0, 0],
    'R1': [0, 0, 0, 1],
    'R2': [0, 0, 1, 0],
    'R3': [0, 0, 1, 1],
    'R4': [0, 1, 0, 0],
    'R5': [0, 1, 0, 1],
    'R6': [0, 1, 1, 0],
    'R7': [0, 1, 1, 1],
    'R8': [1, 0, 0, 0],
    'R9': [1, 0, 0, 1],
    'R10': [1, 0, 1, 0],
    'R11': [1, 0, 1, 1],
    'R12': [1, 1, 0, 0],
    'R13': [1, 1, 0, 1],
    'R14': [1, 1, 1, 0],
    'R15': [1, 1, 1, 1]
    }



def regisdeco(tipo,operacion,regs):
    if tipo == "r":
        if operacion == "NOT":
            decoreg = registros[regs[0]]+registros[regs[1]]+registros['R15']
        elif operacion[0:3] == "CMP":
            if operacion[3:]=="E":
                decoreg = [1,0,1,1] + registros[regs[0]] + registros[regs[1]]
            elif operacion [3:] == "LT":
                decoreg = [0,1,1,1]+registros[regs[0]]+registros[regs[1]]
            elif operacion[3:] == "LE":
                decoreg = [1,1,1,1]+registros[regs[0]]+registros[regs[1]]
            else:
                decoreg=[]
        else:
            decoreg = registros[regs[0]]+registros[regs[1]]+registros[regs[2]]
    elif tipo =="i":
        if operacion == "MOV":
            numerobinario = convertir(regs[1][1:],8)
            decoreg =registros[regs[0]] + numerobinario
        elif operacion == "LD":
            numerobinario = convertir(regs[2],4)
            decoreg= registros[regs[0]]+registros[regs[1]]+numerobinario
        elif operacion == "ST":
            numerobinario = convertir(regs[2],4)
            decoreg = numerobinario + registros[regs[0]]+registros[regs[1]]
        else:
            numerobinario = convertir(regs[0],12)
            decoreg= numerobinario
    elif tipo == "n":
        decoreg = [1,1,1,1,1,1,1,1,1,1,1,1]
    else:
        decoreg = []
    return decoreg


def convertir(numero,largomax):
    resultadocon = []
    numero = int(numero)
    binario= bin(abs(numero))
    largo = len(binario) - 2
    while(largo>0):
        resultadocon = [int(binario[largo+1])] + resultadocon
        largo = largo-1
    if(len(resultadocon)>largomax):
        resultadocon = []
    elif (len(resultadocon)<largomax):
        while(largomax>len(resultadocon)):
            resultadocon = [0]+resultadocon
    if numero<0:
        resultadocon = atwo(resultadocon,len(resultadocon)-1)
    return resultadocon


def atwo(lista,largo):
    encontrado = 0
    resultadoa2=[]
    while (largo>=0):
        if encontrado == 1:
            if lista[largo]==0:
                resultadoa2= [1]+resultadoa2
                largo = largo -1
            else:
                resultadoa2 = [0]+resultadoa2
                largo = largo-1
        elif lista[largo]==1:
            resultadoa2 = [lista[largo]]+resultadoa2
            encontrado = 1
            largo = largo -1
        else:
            resultadoa2 = [lista[largo]]+resultadoa2
            largo = largo-1
    return resultadoa2
