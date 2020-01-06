-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' AS (letra:CHARARRAY,fecha:CHARARRAY,numero:INT);

grouped = GROUP data BY letra;

wordcount = FOREACH grouped GENERATE group, COUNT(data.numero);

STORE wordcount INTO 'output/';

