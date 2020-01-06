import sys

if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##
    for line in sys.stdin:

        ch = line.rstrip().split()
        sys.stdout.write("{}\t1\n".format(ch[1].split('-')[1]))