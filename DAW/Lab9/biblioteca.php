<?php
            function promedio($style){
                $numeros = [1,2,3,4,5];
                $suma = 0;
                foreach ($numeros as $x){
                    $suma = $suma + $x;
                }
                $promedio = $suma / count($numeros);
                foreach($numeros as $x){
                    $elementos = $elementos." ".$x;
                }
                echo '<div class ="'.$style.'">El promedio de los numeros '.$elementos.' es '.$promedio. "<br></div>";
            };
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
                echo "La mediana de los numeros ".$elementos." es ".$mediana."<br>";
            }
         
            
            function tres(){
                $numeros = [3,7,2,4];
                echo "Lista de numeros: <ul>";
                foreach($numeros as $x){
                    echo "<li>".$x."</li>";  
                }
                echo "</ul>";
                
                $suma = 0;
                foreach ($numeros as $x){
                    $suma = $suma + $x;
                }
                $promedio = $suma / count($numeros);
                echo "El promedio de los numeros es ".$promedio. "<br>";
                
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
                echo "La mediana de los numeros es ".$mediana."<br>";
                
                foreach($numeros as $x){
                    $elementos = $elementos." ".$x;
                }
                echo "Los numeros arreglados de menor a mayor son ".$elementos."<br>";
                
                rsort($numeros);
                foreach($numeros as $x){
                    $elementos = $elementos." ".$x;
                }
                echo "Los numeros arreglados de mayor a menor son ".$elementos."<br><br>";
            }
            function cuatro(){
                $n = 5;
                echo "<table> <th> Numero </th> <th> Cuadrado </th> <th> Cubo </th>";
                for ($x = 1; $x <= $n; $x++){
                    $cuadrado = $x * $x;
                    $cubo = $x * $x * $x;
                    echo "<tr> <td>".$x."</td> <td>".$cuadrado."</td> <td>".$cubo."</td> </tr>";
                }
                echo "</table>";
            }
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

            echo "<br>La accion ".$ticker." con precios diarios de".$elementosp." tiene rendimientos de ".$elementosr." lo que lleva a un rendimiento promedio diario de " .$promedio1. " con una desviacion estandar diaria de " .$desvi;

            }
            ?>