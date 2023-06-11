/*
Pregunta
===========================================================================

Para el archivo `data.csv` escriba una consulta en Pig que genere la 
siguiente salida:

  Vivian@Hamilton
  Karen@Holcomb
  Cody@Garrett
  Roth@Fry
  Zoe@Conway
  Gretchen@Kinney
  Driscoll@Klein
  Karyn@Diaz
  Merritt@Guy
  Kylan@Sexton
  Jordan@Estes
  Hope@Coffey
  Vivian@Crane
  Clio@Noel
  Hope@Silva
  Ayanna@Jarvis
  Chanda@Boyer
  Chadwick@Knight

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
sub_conjunto = FOREACH ejercicio GENERATE CONCAT(nombre,'@',apellido);
 
STORE sub_conjunto INTO 'output' USING PigStorage(',');
