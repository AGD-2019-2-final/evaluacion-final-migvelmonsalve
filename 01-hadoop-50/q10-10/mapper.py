import sys

if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##
    for line in sys.stdin:

        ch = line.rstrip().split()
        
        for letra in ch[1].split(','):
          sys.stdout.write("{}\t{}\t{}\n".format(letra+ch[0].zfill(2),letra,ch[0]))
        