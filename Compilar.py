# -*- coding: utf-8 -*-
import decoopera
import regdeco

def leer(leer):
    if leer == 1:
        infile = open('datos','r')
        outfile = open('salida','w')
        contador = 0
        for line in infile:
            solucion = compilar(line)
            solucionenstr = ''.join(str(e) for e in solucion)
            print solucionenstr
            solucionenstr = (format(int(solucionenstr,2), '02x'))
            print solucionenstr
            outfile.write('mem_inst['+str(contador)+'] <= 16\'h'+solucionenstr
            + ';'+'\n')
            contador = contador + 1
        infile.close()
        outfile.close()
    else:
        print ("No se a pedio leer un documento")



def compilar(instruccion):
    instruccion = instruccion.replace(",", " ")
    instruccion = instruccion.replace("  ", " ")
    instruccion = instruccion.split(" ")
    print instruccion
    operacion = instruccion[0]
    resultado = []
    opcodeytipo = decoopera.decodiopera(operacion)
    resultado = resultado + opcodeytipo[1]
    registros = regdeco.regisdeco(opcodeytipo[0],instruccion[0],instruccion[1:])
    resultado = resultado + registros
    return (resultado)


