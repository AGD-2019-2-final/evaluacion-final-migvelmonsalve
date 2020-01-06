-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.csv' USING PigStorage(',') AS (id_persona:INT,nombre:CHARARRAY,apellido:CHARARRAY,fecha:CHARARRAY,color:CHARARRAY,numero:INT);

top = FOREACH data GENERATE ToString(ToDate(fecha,'yyyy-MM-dd'),'yyyy') AS year,nombre;

numero = GROUP top BY year;

grouped = FOREACH numero GENERATE group,COUNT(top.nombre);

STORE grouped INTO 'output/' USING PigStorage(',');