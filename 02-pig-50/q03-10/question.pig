-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' AS (letra:CHARARRAY,fecha:CHARARRAY,numero:INT);

grouped = ORDER data BY numero ASC;

numero = FOREACH grouped GENERATE numero;

top = LIMIT numero 5;

STORE top INTO 'output/';