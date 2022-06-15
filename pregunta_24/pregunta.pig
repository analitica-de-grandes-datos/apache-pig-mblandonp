/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       REGEX_EXTRACT(birthday, '....-..-..', 2) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

      
*/
ejercicio = LOAD 'data.csv' USING PigStorage(',') 
    AS ( 
            id: int, 
            nombre:chararray, 
            apellido:chararray, 
            fecha:chararray, 
            color:chararray, 
            numer:chararray 
    ); 
 
sub_conjunto = FOREACH ejercicio GENERATE REGEX_EXTRACT(fecha, '(.*)-(.*)-(.*)', 2); 
STORE sub_conjunto INTO 'output' USING PigStorage(',');; 


