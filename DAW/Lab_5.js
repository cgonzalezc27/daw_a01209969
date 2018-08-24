//Primer ejercicio

document.getElementById("submit1").onclick = validar;
document.getElementById("check").onclick = mostrar;
document.getElementById("-1").onclick = restar1;
document.getElementById("+1").onclick = sumar1;
document.getElementById("-2").onclick = restar2;
document.getElementById("+2").onclick = sumar2;
document.getElementById("-3").onclick = restar3;
document.getElementById("+3").onclick = sumar3;

function round(value, decimals) {
  return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
}
function validar() {
    var x = document.getElementById("pass1").value;
    var y = document.getElementById("pass2").value;
if (x == "" || y == ""){
    document.getElementById("pass2").style="default"; document.getElementById("mensaje").innerHTML = "Favor de rellenar las dos cajas de texto";
} else if (y == x) {
        document.getElementById("mensaje").style.color = "green";
       document.getElementById("pass2").style="default"; document.getElementById("pass2").style.borderColor=""; document.getElementById("mensaje").innerHTML = "Los passwords coinciden!";
    } else {
         document.getElementById("mensaje").style.color = "red";
       document.getElementById("pass2").style.borderColor="red";
        document.getElementById("mensaje").innerHTML = "Los passwords NO coinciden :p";
}
}
function mostrar(){
var check = document.getElementById("check");
if (check.checked == true) {
   document.getElementById("pass1").type ="text"; 
     document.getElementById("pass2").type ="text"; 
}
}
function restar1(){
    var cantidad = Number(document.getElementById("cantidad1").value);
    cantidad = Number(cantidad)
    var precio = Number(document.getElementById("precio1").value)
    if (cantidad == 0){
        } else {
            document.getElementById("cantidad1").value = cantidad - 1;
           cantidad = document.getElementById("cantidad1").value;
         document.getElementById("resultado1").innerHTML = round(cantidad * precio,2) + " MXN"
        }
    calcular();
}
function sumar1(){
    var cantidad = Number(document.getElementById("cantidad1").value);
    cantidad = Number(cantidad)
    var precio = Number(document.getElementById("precio1").value)
    document.getElementById("cantidad1").value = cantidad + 1;
    cantidad = document.getElementById("cantidad1").value;
    document.getElementById("resultado1").innerHTML = round(cantidad * precio,2) + " MXN";
    calcular();
}
function restar2(){
    var cantidad = Number(document.getElementById("cantidad2").value);
    cantidad = Number(cantidad)
    var precio = Number(document.getElementById("precio2").value)
    if (cantidad == 0){
        } else {
            document.getElementById("cantidad2").value = cantidad - 1;
           cantidad = document.getElementById("cantidad2").value;
         document.getElementById("resultado2").innerHTML = round(cantidad * precio,2) + " MXN"
        }
    calcular();
}
function sumar2(){
    var cantidad = Number(document.getElementById("cantidad2").value);
    cantidad = Number(cantidad)
    var precio = Number(document.getElementById("precio2").value)
    document.getElementById("cantidad2").value = cantidad + 1;
    cantidad = document.getElementById("cantidad2").value;
    document.getElementById("resultado2").innerHTML = round(cantidad * precio,2) + " MXN";
    calcular();
}
function restar3(){
    var cantidad = Number(document.getElementById("cantidad3").value);
    cantidad = Number(cantidad)
    var precio = Number(document.getElementById("precio3").value)
    if (cantidad == 0){
        } else {
            document.getElementById("cantidad3").value = cantidad - 1;
           cantidad = document.getElementById("cantidad3").value;
         document.getElementById("resultado3").innerHTML = round(cantidad * precio,2) + " MXN"
        }
    calcular();
}
function sumar3(){
    var cantidad = Number(document.getElementById("cantidad3").value);
    cantidad = Number(cantidad)
    var precio = Number(document.getElementById("precio3").value)
    document.getElementById("cantidad3").value = cantidad + 1;
    cantidad = document.getElementById("cantidad3").value;
    document.getElementById("resultado3").innerHTML = round(cantidad * precio,2) + " MXN";
    calcular();
}
function calcular() {
    var resultado1 = document.getElementById("resultado1").innerHTML
    resultado1 = Number(resultado1.replace(" MXN",""));
     var resultado2 = document.getElementById("resultado2").innerHTML
    resultado2 = Number(resultado2.replace(" MXN",""));
     var resultado3 = document.getElementById("resultado3").innerHTML
    resultado3 = Number(resultado3.replace(" MXN",""));
    var subtotal = resultado1 + resultado2 + resultado3 + " MXN";
   document.getElementById("subtotal").innerHTML = subtotal;
    var iva = round(Number(subtotal.replace(" MXN",""))* 0.16,2) + " MXN";
    document.getElementById("iva").innerHTML = iva;
    var total = round(Number(subtotal.replace(" MXN",""))* 1.16,2) + " MXN";
     document.getElementById("total").innerHTML = total;
}