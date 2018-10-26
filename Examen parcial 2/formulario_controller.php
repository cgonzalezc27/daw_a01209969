<?php
    require_once('model.php');
    include('_header.html');
    $estados = consultar_estados();
    $estadosc = consultar_estadosc();
    $zombis = consultar_zombis();
    $total_zombis = consulta1_1();
    $total_zombis_no_muerto = consulta1_3();
    $zombisxestado = consulta1_2();
    $registro = consulta2();
    if(isset($_POST['Nombre_completo'])&&$_POST['Nombre_completo']!=""){
        $Nombre = $_POST['Nombre_completo'];
        $NombreE = $_POST['NombreE'];
        $resultado = agregar_zombi($Nombre,$NombreE);
        if($resultado == TRUE){
            echo '<div id="notify" class="alert alert-success" role="alert">
                    ¡El zombi ha sido registrado de manera exitosa!
                </div>';
            echo '<script>
                    setTimeout(function(){$("#notify").remove();}, 3000);
                </script>';
            } else{
            echo '<div id="notify" class="alert alert-danger"    role="alert">
                    Hubo un error al crear el zombi
                </div>';
            echo '<script>
                    setTimeout(function(){$("#notify").remove();}, 3000);
                </script>'; 
        }
        include('_forma_agregar_zombi.html');
    } else if (isset($_POST['Nombre_completoU'])){
        $Nombre = $_POST['Nombre_completoU'];
        $NombreE = $_POST['NombreE'];
        $resultado = actualizar_zombi($Nombre,$NombreE);
        if($resultado == TRUE){
            echo '<div id="notify" class="alert alert-success" role="alert">
                    ¡El esatdo ha sido actualizado de manera exitosa!
                </div>';
            echo '<script>
                    setTimeout(function(){$("#notify").remove();}, 3000);
                </script>';
            } else{
            echo '<div id="notify" class="alert alert-danger"    role="alert">
                    Hubo un error al actualizar el estado
                </div>';
            echo '<script>
                    setTimeout(function(){$("#notify").remove();}, 3000);
                </script>'; 
        }
        include('_forma_agregar_zombi.html');
        
    } else if (isset($_POST['NombreEC'])){
        $estadoc = $_POST['NombreEC'];
        $tabla = '<br><table class = "table"><tr><th>Nombre de Zombi</th></tr>';
        $tabla .= consulta3($estadoc);
        $tabla .= '</table>';
        if ( $total ==  0){
        $tabla = "";
        }
        $total_zombis_por_estado = consulta3_1($estadoc);
        include('_forma_agregar_zombi.html');
    } else {
        include('_forma_agregar_zombi.html');
    }
    
    include('_footer.html');
?>