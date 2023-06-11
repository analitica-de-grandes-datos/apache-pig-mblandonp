/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT  
       firstname,
       SUBSTRING_INDEX(firstname, 'a', 1)
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera ejecutado en modo local:

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
 
sub_conjunto = FOREACH ejercicio GENERATE INDEXOF(nombre, 'a', 1); 
STORE sub_conjunto INTO 'output' USING PigStorage(',');