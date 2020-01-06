-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' AS (perro:CHARARRAY,gato:BAG{pato:tuple(letra:CHARARRAY)},pollo:MAP[CHARARRAY]);

top = FOREACH data GENERATE FLATTEN(pollo);

numero = GROUP top BY pollo::key;

grouped = FOREACH numero GENERATE group,COUNT(top.pollo::key);

STORE grouped INTO 'output/' USING PigStorage(',');