import sys

if __name__ == '__main__':

    curkey = None
    total = 0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        total = total + 1

        if total == 6:
          break
        else:
          key, val = line.split("\t")
          sys.stdout.write("{}\n".format(val.rstrip()))