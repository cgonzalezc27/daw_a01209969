<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
    </head>
    <body>
        
        <h1>Lab 9:Camilo González C</h1>
        
        <?php
            function promedio(){
                $numeros = [1,2,3,4,5];
                $suma = 0;
                foreach ($numeros as $x){
                    $suma = $suma + $x;
                }
                $promedio = $suma / count($numeros);
                foreach($numeros as $x){
                    $elementos = $elementos." ".$x;
                }
                Echo "El promedio de los numeros ".$elementos." es ".$promedio. "<br>";
            };
            Echo "<h4> Pregunta 1 </h4>";
            promedio();
            
            function mediana() {
                $numeros = [3,7,3,4,3,6,5,8];
                sort($numeros);
                $par = fmod(count($numeros),2);
                if($par == 0){
                    $mitadup = count($numeros) / 2;
                    $mitaddown = count($numeros) / 2 - 1;
                    $mediana = ($numeros[$mitadup] + $numeros[$mitaddown]) / 2;
                } else {
                    $mitad = count($numeros) / 2 - 0.5;
                    $mediana = $numeros[$mitad];
                }
                foreach($numeros as $x){
                    $elementos = $elementos." ".$x;
                }
                Echo "La mediana de los numeros ".$elementos." es ".$mediana."<br>";
            }
            Echo "<h4> Pregunta 2 </h4>";
            mediana();
            
            function tres(){
                $numeros = [3,7,2,4];
                Echo "Lista de numeros: <ul>";
                foreach($numeros as $x){
                    Echo "<li>".$x."</li>";  
                }
                Echo "</ul>";
                
                $suma = 0;
                foreach ($numeros as $x){
                    $suma = $suma + $x;
                }
                $promedio = $suma / count($numeros);
                Echo "El promedio de los numeros es ".$promedio. "<br>";
                
                sort($numeros);
                $par = fmod(count($numeros),2);
                if($par == 0){
                    $mitadup = count($numeros) / 2;
                    $mitaddown = count($numeros) / 2 - 1;
                    $mediana = ($numeros[$mitadup] + $numeros[$mitaddown]) / 2;
                } else {
                    $mitad = count($numeros) / 2 - 0.5;
                    $mediana = $numeros[$mitad];
                }
                Echo "La mediana de los numeros es ".$mediana."<br>";
                
                foreach($numeros as $x){
                    $elementos = $elementos." ".$x;
                }
                Echo "Los numeros arreglados de menor a mayor son ".$elementos."<br>";
                
                rsort($numeros);
                foreach($numeros as $x){
                    $elementos = $elementos." ".$x;
                }
                Echo "Los numeros arreglados de mayor a menor son ".$elementos."<br><br>";
            }
            Echo "<h4> Pregunta 3 </h4>";
            tres();
            
            function cuatro(){
                $n = 5;
                Echo "<table> <th> Numero </th> <th> Cuadrado </th> <th> Cubo </th>";
                for ($x = 1; $x <= $n; $x++){
                    $cuadrado = $x * $x;
                    $cubo = $x * $x * $x;
                    Echo "<tr> <td>".$x."</td> <td>".$cuadrado."</td> <td>".$cubo."</td> </tr>";
                }
                Echo "</table>";
            }
            cuatro();
            
            function cinco(){
                $ticker = "BIMBOA";
                $x = [10,10.1,10.08,10.03,10.05];
                $rendimientos = [];
                $rendimientos [0]= null;
                    for($i = 1; $i < count($x); $i++){
                        $a = $x[$i] / $x[$i - 1] - 1;
                        $rendimientos[$i] = round($a,4);
                }


                $promedio1 = 0;
                for ($j = 1; $j < count($rendimientos); $j++){
                    $promedio1 = $promedio1 + $rendimientos[$j];
               } 
                $b = $promedio1 / (count($rendimientos) - 1);
                $promedio1 = round($b,4);    

            $sum = 0;
            for($h = 1; $h < count($rendimientos); $h++){
                $sum = $sum + (($rendimientos[$h] - $promedio1)*($rendimientos[$h] - $promedio1));
               } 
            $a = $sum / (count($rendimientos) - 2);
            $a = sqrt($a);
            $desvi = round($a,4);
            
            foreach($x as $d){
                    $elementosp = $elementosp." ".$d;
                }
            foreach($rendimientos as $d){
                    $elementosr = $elementosr." ".$d;
                }

            Echo "<br>La accion ".$ticker." con precios diarios de".$elementosp." tiene rendimientos de ".$elementosr." lo que lleva a un rendimiento promedio diario de " .$promedio1. " con una desviacion estandar diaria de " .$desvi;

            }
            Echo "<h4> Pregunta 5 </h4>";
            cinco();
        ?>
        <h2>Preguntas teóricas:</h2>
        <h6>¿Qué hace la función phpinfo()? Describe y discute 3 datos que llamen tu atención.</h6>
        <p>Muestra toda la información del estado atual de php. Thread safety me llamó la atención pues se trata de una opción que permite que las request se hagan cada una en una thread distinta, lo que permite mejorar la seguridad del sitio. El request method también me llamó la atención, pues es un tema que hemos estado viendo constantemente en clase y aquí puedo ver como se está aplicando; me gustaría saber como cmabiar esta configuración. Por último, la opción de track_errors pues permite que se siempre se guarde el último error en la variable $php_errormsg.</p>
        <h6>¿Qué cambios tendrías que hacer en la configuración del servidor para que pudiera ser apto en un ambiente de producción?</h6>
        <p>Me tendría que asegurar que la configuración permita el uso de otros elementos para poder realizar el desarrollo (como sql, por ejemplo).</p>
        <h6>¿Cómo es que si el código está en un archivo con código html que se despliega del lado del cliente, se ejecuta del lado del servidor? Explica.</h6>
        <p>Esto se logra por medio de http requests, donde el archivo hace requests al servidor externo de tal manera que éste regresa código html para que este pueda ser ejecutado por el navegador.</p>
        <h2>Bibliografía</h2>
        <ul>
            <li>http://php.net/manual/es/function.phpinfo.php</li>
            <li>http://www.php.net/manual/en/errorfunc.configuration.php#ini.track-errors</li>
        </ul>
    </body>
</html>