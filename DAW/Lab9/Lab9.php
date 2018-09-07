        
            
            <?php
                include('_header.html');
                require_once("biblioteca.php");
            
                echo "<h4> Pregunta 1 </h4>";
                promedio("blue-text text-darken-2");
            
                echo "<h4> Pregunta 2 </h4>";
                mediana();
                
                echo "<h4> Pregunta 3 </h4>";
                tres();
                
                echo "<h4> Pregunta 4 </h4>";
                cuatro();
                
                echo "<h4> Pregunta 5 </h4>";
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