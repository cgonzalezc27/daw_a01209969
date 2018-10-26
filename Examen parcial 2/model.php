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
function agregar_zombi($Nombre,$NombreE){
    $conexion = connect();
    $query = 'INSERT INTO Zombis (Nombre_completo) VALUES ("'.$Nombre.'")';
     if ($conexion->query($query) === TRUE) {
            $resultado = TRUE;
        } else {
            $resultado = FALSE;
        }
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
    mysqli_free_result($results);
    
    $query = 'INSERT INTO Zombis_estados (Id_zombis, Id_estado) VALUES ('.$Id_zombi.','.$Id_estado.')';
     if ($conexion->query($query) === TRUE) {
            $resultado = $resultado * TRUE;
        } else {
            $resultado = $resultado * FALSE;
        }
    disconnect($conexion);
    return $resultado;
}
function consultar_estados(){
     $conexion = connect();
     $query= "SELECT Nombre as 'NombreE' FROM Estados";
     $results = mysqli_query($conexion, $query);
     $rows = " <select id='NombreE' name='NombreE'>";
     while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
         $rows .= '<option>'.$row['NombreE'].'</option>';
     }
     $rows .= "</select>";
    mysqli_free_result($results);
    disconnect($conexion);
    return $rows; 
}
function consultar_estadosc(){
     $conexion = connect();
     $query= "SELECT Nombre as 'NombreE' FROM Estados";
     $results = mysqli_query($conexion, $query);
     $rows = " <select id='NombreEC' name='NombreEC'>";
     while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
         $rows .= '<option>'.$row['NombreE'].'</option>';
     }
     $rows .= "</select>";
    mysqli_free_result($results);
    disconnect($conexion);
    return $rows; 
}
function consultar_zombis(){
     $conexion = connect();
     $query= "SELECT Nombre_completo as 'NombreZ' FROM Zombis";
     $results = mysqli_query($conexion, $query);
     $rows = " <select id='Nombre_completoU' name='Nombre_completoU'>";
     while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
         $rows .= '<option>'.$row['NombreZ'].'</option>';
     }
     $rows .= "</select>";
    mysqli_free_result($results);
    disconnect($conexion);
    return $rows; 
}
function actualizar_zombi($Nombre,$NombreE){
     $conexion = connect();
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
    mysqli_free_result($results);
    
    $query = 'INSERT INTO Zombis_estados (Id_zombis, Id_estado) VALUES ('.$Id_zombi.','.$Id_estado.')';
     if ($conexion->query($query) === TRUE) {
            $resultado =  TRUE;
        } else {
            $resultado =  FALSE;
        }
    disconnect($conexion);
    return $resultado;
}
function consulta1_1(){
    $conexion = connect();
    $query = 'SELECT Count(Id_zombi) as "total_zombis" FROM Zombis';
    $results = mysqli_query($conexion, $query);
    while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
          $total_zombis = $row ['total_zombis'];
     }
    mysqli_free_result($results);
    disconnect($conexion);
    return $total_zombis;
   
}
function consulta1_2(){
    $conexion = connect();
    $query = "SELECT U.Id_estado, E.Nombre as 'NombreE', Count(U.Id_estado) as 'zombis_x_estado' FROM Ultimo_estado_zombi U, Estados E WHERE U.Id_estado = E.Id_estado  GROUP BY U.Id_estado";
    $results = mysqli_query($conexion, $query);
    $zombisxestado = [];
    $rows = "";
    $i=0;
    while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
          $zombisxestado [$i] ['NombreE'] = $row ['NombreE'];
          $zombisxestado [$i] ['zombis_x_estado'] = $row ['zombis_x_estado'];
          $rows .= '<tr><td>'.$zombisxestado [$i] ['NombreE'].'</td><td>'.$zombisxestado [$i] ['zombis_x_estado'].'</td></tr>';
          $i++;
     }
    mysqli_free_result($results);
    disconnect($conexion);
    return $rows;
}
function consulta1_3(){
    $conexion = connect();
     $query = "SELECT COUNT( U.Id_estado ) AS  'zombis_no_muerto' FROM Ultimo_estado_zombi U, Estados E WHERE U.Id_estado = E.Id_estado AND E.Nombre !=  'Completamente muerto'";
    $results = mysqli_query($conexion, $query);
    while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
          $total_zombis_no_muerto = $row ['zombis_no_muerto'];
     }
    mysqli_free_result($results);
    disconnect($conexion);
    return $total_zombis_no_muerto;
}
function consulta2(){
    $conexion = connect();
     $query = "SELECT Nombre_completo FROM Zombis ORDER BY Fecha_hora_de_creacion DESC";
    $results = mysqli_query($conexion, $query);
    $registro = "";
    while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
          $registro .= '<tr><td>'.$row ['Nombre_completo'].'</td></tr>';
     }
    mysqli_free_result($results);
    disconnect($conexion);
    return $registro;
}
function consulta3($estadoc){
    $conexion = connect();
    $query = "SELECT Nombre_completo FROM Zombis Z, Estados E, Ultimo_estado_zombi U WHERE Z.Id_zombi = U.Id_zombis AND U.Id_estado = E.Id_estado AND E.Nombre = '".$estadoc."' ";
    $results = mysqli_query($conexion, $query);
    $registro = "";
    while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
          $registro .= '<tr><td>'.$row ['Nombre_completo'].'</td></tr>';
     }
    mysqli_free_result($results);
    disconnect($conexion);
    $total = consulta3_1($estadoc);
    if ( $total ==  0){
        $registro = "";
    }
    return $registro;
}
function consulta3_1($estadoc){
    $conexion = connect();
    $query = "SELECT count(Nombre_completo) as 'Total_zombis' FROM Zombis Z, Estados E, Ultimo_estado_zombi U WHERE Z.Id_zombi = U.Id_zombis AND U.Id_estado = E.Id_estado AND E.Nombre = '".$estadoc."' ";
    $results = mysqli_query($conexion, $query);
    $registro = [];
    while($row = mysqli_fetch_array($results,MYSQLI_BOTH)){
          $registro = $row ['Total_zombis'];
     }
    mysqli_free_result($results);
    disconnect($conexion);
    return $registro;
}
?>    
