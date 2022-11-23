import 'dart:io';
void main() {
  var lista = [];
  var rep = true;
  var index;

  do{
    print("Informe um numero: ");
    final entrada = stdin.readLineSync();
    lista.add(entrada);
    index = lista.length - 1;
    print("posição de ${entrada} na lista: ${index}");
    print("Deseja colocar outro numero? S ou N");
    final resp = stdin.readLineSync();
    if(resp == "N" && resp == "n"){
      rep = false;
    }
    
  }while(rep);
  print(lista);
	
}