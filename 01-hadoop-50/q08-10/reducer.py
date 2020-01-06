import sys
#

if __name__ == '__main__':

    curkey = None
    suma = None
    conteo = None

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val = float(val)

        if key == curkey:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            if suma is None:
              suma = val
              conteo = 1
            else:
              suma = suma+val
              conteo = conteo+1
        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            if curkey is not None:
                ##
                ## una vez se han reducido todos los elementos
                ## con la misma clave se imprime el resultado en
                ## el flujo de salida
                ##
                sys.stdout.write("{}\t{}\t{}\n".format(curkey,suma,suma/conteo))

            curkey = key
            suma = val
            conteo = 1
            
    sys.stdout.write("{}\t{}\t{}\n".format(curkey,suma,suma/conteo))