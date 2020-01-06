import sys
if __name__ == '__main__':


    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:
      
        key, val = line.split("\t")
        sys.stdout.write("{}\n".format(val.rstrip()))