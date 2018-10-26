<?php
function connect(){
        $conexion = mysqli_connect("localhost","camilo271195","","examen_2");
        if($conexion == NULL) {
            die("Error al conectarse con la base de datos");
        }
        $conexion->set_charset("utf8");
        return $conexion;
    }

function disconnect($conexion) {
        mysqli_close($conexion);
    }
    $conexion = connect();
    $NombreE = "Infeccion";
    $Nombre = 'Camilo';
  $query = 'SELECT Id_zombi FROM Zombis WHERE Nombre_completo = "'.$Nombre.'"';
    $results = mysqli_query($conexion, $query);
    while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
          $Id_zombi = $row ['Id_zombi'];
     }
    mysqli_free_result($results);
    
    $query = 'SELECT Id_estado FROM Estados WHERE Nombre = "'.$NombreE.'"';
    $results = mysqli_query($conexion, $query);
    while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
          $Id_estado = $row ['Id_estado'];
     }
    
     echo $Id_estado;
     echo $Id_zombi;
     $query = 'INSERT INTO Zombis_estados (Id_zombis, Id_estado) VALUES (1,1)';
     if ($conexion->query($query) === TRUE) {
            $resultado = TRUE;
        } else {
            $resultado = "Error: " . $query . "<br>" . $conexion->error;
        }
         disconnect($conexion);
        echo $resultado;
?>    
