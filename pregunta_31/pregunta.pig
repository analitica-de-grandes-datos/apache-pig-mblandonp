/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        
*/
ejercicio = LOAD 'data.csv' USING PigStorage(',')  
    AS ( 
            id: int, 
            nombre:chararray, 
            apellido:chararray, 
            fecha:datetime, 
            color:chararray, 
            numer:chararray 
    ); 
 
sub_conjunto = GROUP ejercicio BY GetYear(fecha);
wordcount = FOREACH sub_conjunto GENERATE group, COUNT(ejercicio); 
STORE wordcount INTO 'output' USING PigStorage(',');

