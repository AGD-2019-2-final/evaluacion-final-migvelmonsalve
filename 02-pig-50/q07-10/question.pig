-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' AS (perro:CHARARRAY,gato:BAG{pato:tuple(letra:CHARARRAY)},pollo:MAP[CHARARRAY]);

top = FOREACH data GENERATE perro,COUNT(gato.letra) AS conteo1 ,SIZE(pollo) AS conteo2;

numero = ORDER top BY perro,conteo1,conteo2;

STORE numero INTO 'output/' USING PigStorage(',');