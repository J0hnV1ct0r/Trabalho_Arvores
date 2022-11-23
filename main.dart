import 'dart:io';
void main() {
  var lista = [];
  var rep = true;
  var index;

  do{
    print("Informe um numero: ");
    final entrada = stdin.readLineSync();
    lista.add(int.parse("${entrada}"));
    index = lista.length - 1;
    print("posição de ${entrada} na lista: ${index}");
    comparacao(lista,index);
    print("Deseja colocar outro numero? S ou N");
    final resp = stdin.readLineSync();
    if(resp == "N" || resp == "n"){
      rep = false;
    }
  }while(rep);
  print(lista);
}
void comparacao(var lista, var index){
  var numTemp;
  if(lista.length > 1){
    double indexRaiz = (index - 1) / 2;
    if(lista[index] < lista[indexRaiz.floor()]){
      numTemp = lista[indexRaiz.floor()];
      lista[indexRaiz.floor()] = lista[index];
      lista[index] = numTemp;
    }
  }
}