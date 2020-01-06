-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' AS (perro:CHARARRAY,gato:BAG{pato:tuple(letra:CHARARRAY)},pollo:MAP[CHARARRAY]);

top = FOREACH data GENERATE FLATTEN(gato) AS gatito ,FLATTEN(pollo);

numero = GROUP top BY (gatito,pollo::key);

grouped = FOREACH numero GENERATE group,COUNT(top);

STORE grouped INTO 'output/';