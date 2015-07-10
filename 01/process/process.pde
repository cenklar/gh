
import processing.net.*;
import processing.pdf.*;
import hypermedia.net.*;

UDP udp;


PShape square, micir, macir;  

int width = 450;
int length = 450;
int count = 0;
int control = 0;
int largo = 0;

float mini = 0;
float maxi = 0;
int escalador = 18;

void setup() {
  size(length, width);
  smooth();
  background(120);
  //beginRecord(PDF, "holanda.pdf");
  udp = new UDP( this, 6001);
  udp.listen(true);
  beginRecord(PDF, "hello.pdf");

}

void keyPressed(){
 
  String ip       = "localhost";  // the remote IP address
  int port        = 6001;    // the destination port
 // int port2      = 6002;     // no sirvio de nada
  if (key == 'r')  {
  
 
  endRecord();
  } 
  
  if (key == 'q')  {
  //endRecord();
  count = count + 1;
  control = count%2;
  // exit();
            }
   
// if (control==1) { //df
//  // print(control);
//   noLoop(); 
//                 }
// else {
//   redraw();
//   loop();
//      }
// 
 
                         } //the final void keyPressed



//RECEIVE!!

void receive( byte[] data, String ip, int port){ //test, data corresponde a un mensaje

int variable = 30;
//void receive( byte[] datos, String ip, int port ) {  // <-- extended handler
  //int i = 0;
int colsaray = 6;
int rowsaray = 3;
int z = 0;  //ojo que hay que inicializarlo cada vez que se le utilize


 // data = subset(data, 0, datos.length); //ni idea
   String numeros = new String(data); //"raw data"
   String[] lista = new String[data.length]; //se genera string tamaño adecuado, de la longitud del mensaje que llego
   lista = split(numeros,'\n');  //se fracciona "numeros"[pos]

 
  
 //llenado de array2d 

//condición: lista[0] = valores1

//(Character.valueOf(lista[0])

//if (Character.valueOf(lista[0]) = asd) {
//}

float[][] matriz = new float[colsaray][rowsaray]; //2d array, valores sabidos por excel 
// String compara1 = new String("valores1");

//if (lista[0] = "compara1") {
//String[] compara1 = new String[lista.length];  
//compara1[0] = "valores1";
 String compara1 = "valores1";
// println(compara1);
//String compara2 = lista[0].length;

if (lista[0].equals(compara1) == true){ 
  println("hola"); 
}
else {
 println("missed it");       //ojo con los println de abajo
 println(compara1); 
 println(compara1.length());
 println(lista[0]);
 println(lista[0].length());
}
// llenado de Matrix [i][j]  
 // for (int i = 0; i < colsaray; i++) {
   // for (int j = 0; j < rowsaray; j++){
   //matriz[i][j] = Float.valueOf(lista[z]) * escalador; // lista[] se lee de 0 hasta 6x3 veces  
   //z = z + 1;                                          // contador lineal
  // }
 // }
    

 
  
//vienen los ciclos FOR de análisis

 for (int i = 0; i < colsaray; i++) {
  
   //for (int j = 0; j < rows; j++){
   stroke(variable, variable, variable);
   noFill();  
   //fill(0);
   mini = min(matriz[i]);
   maxi = max(matriz[i]);
   
   int rmini = round(mini); //redondeo para que sea int parámetro ELLIPSE
   int rmaxi = round(maxi);
   
 
  int stroker = rmaxi - rmini; //distancia en pixeles
  int mid = round(stroker * 0.5);
  strokeWeight(stroker);
  control = 1;
  // shape(macir);
   ellipse(width*0.5,length*0.5,rmini + mid,rmini + mid);   
   
    //ellipse(width*0.5,length*0.5, rmini,rmini); //la mayor y la menor
    //ellipse(width*0.5,length*0.5, rmaxi,rmaxi); // ojo que redondié los floats porque son pixeles 
  
  
      //ellipse(width*0.5,length*0.5, matriz[i][j],matriz[i][j]);
    // square = createShape(ELLIPSE,width*0.5,length*0.5, matriz[i][j],matriz[i][j]);
   // println(maxi/escalador); 
 // println(mini/escalador);
 //println(mid);
 //println(rmini + mid);
// }
   variable = variable + 30;
  }
 
 
//  for (int i = 0; i < lista.length; i = i+1)  {
 // stroke(variable);
//  noFill();
//  ellipse(width*0.5,length*0.5,lista[i],lista[i]); 
//  variable = variable + 35;
// }

 
//println(lista[2]);
largo = lista.length;
//println(lista[largo-1]); 
//println(matriz[3][2]); 

}




void draw() {

//if ( control == 1 ){
//shape(macir);
//}
}
