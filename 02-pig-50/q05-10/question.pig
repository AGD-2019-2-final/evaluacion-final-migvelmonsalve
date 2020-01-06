-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' AS (perro:CHARARRAY,gato:BAG{pato:tuple(letra:CHARARRAY)},pollo:MAP[CHARARRAY]);

top = FOREACH data GENERATE FLATTEN(gato) AS gatito;

numero = GROUP top BY gatito;

grouped = FOREACH numero GENERATE group,COUNT(top.gatito);

STORE grouped INTO 'output/';