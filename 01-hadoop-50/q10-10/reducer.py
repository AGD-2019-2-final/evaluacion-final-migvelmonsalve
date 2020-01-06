import sys

if __name__ == '__main__':

    curkey = None
    total = ''

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        orden, key, val = line.split("\t")
        val = val

        if key == curkey:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            total = total+','+val.rstrip()
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
                sys.stdout.write("{}\t{}\n".format(curkey, total))

            curkey = key
            total = val.rstrip()
            
    sys.stdout.write("{}\t{}\n".format(curkey, total))