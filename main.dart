import 'dart:io';
//NOME: João Victor de Souza Albuquerque
//MATRICULA: 20211045050314
void main() {
  var lista = [];
  var listaFinal = [];
  var rep = true;
  var index;

  do{
    print("Informe um numero: ");
    final entrada = stdin.readLineSync();
    lista.add(int.parse("${entrada}"));
    index = lista.length - 1;
    //print("posição de ${entrada} na lista: ${index}");
    comparacaoFR(lista,index);
    print("Deseja colocar outro numero? S ou N");
    final resp = stdin.readLineSync();
    if(resp == "N" || resp == "n"){
      rep = false;
    }
  }while(rep);
  print("Lista não ordenada: ${lista}");
  
  do{
    var tamanho = lista.length-1;
    listaFinal.add(trocaDeValores(lista));
    lista = lista.sublist(0,tamanho);
    comparacaoRF(lista,0);
    
  }while(lista.length > 0);
  print("Lista ordenada: ${listaFinal}");
}

void comparacaoFR(var lista, var index){
  var numTemp;
  if(lista.length > 1){
    double indexRaiz = (index - 1) / 2;
    if(lista[index] < lista[indexRaiz.floor()]){
      numTemp = lista[indexRaiz.floor()];
      lista[indexRaiz.floor()] = lista[index];
      lista[index] = numTemp;
      if(indexRaiz.floor() > 0){
        comparacaoFR(lista,indexRaiz.floor());
      }
    }
  }
}


void comparacaoRF(var lista, var indexRaiz){
  var numTemp;
  if(lista.length - 1 > 1){
    var indexDireta = (2*indexRaiz) + 1;
    var indexEsquerda = (2*indexRaiz) + 2;
    if(indexDireta <= (lista.length - 1) && indexEsquerda <= (lista.length - 1)){
      if (lista[indexDireta] < lista[indexEsquerda]){
        if(lista[indexRaiz]>lista[indexDireta]){
         numTemp = lista[indexRaiz];
         lista[indexRaiz] = lista[indexDireta];
         lista[indexDireta] = numTemp;
         comparacaoRF(lista, indexDireta);
        }
      }else{
        if(indexEsquerda <= (lista.length - 1)){
          if(lista[indexRaiz] > lista[indexEsquerda]){
            numTemp = lista[indexRaiz];
            lista[indexRaiz] = lista[indexEsquerda];
            lista[indexEsquerda] = numTemp;
            comparacaoRF(lista, indexEsquerda);
          }
        }
      }
    }else if(indexDireta <= (lista.length - 1)){
      if(lista[indexRaiz]>lista[indexDireta]){
         numTemp = lista[indexRaiz];
         lista[indexRaiz] = lista[indexDireta];
         lista[indexDireta] = numTemp;
         comparacaoRF(lista, indexDireta);
        }
    }
  }
  
}

int trocaDeValores(var lista){
  var raiz = lista[0];
  lista[0] = lista[lista.length-1];
  return raiz;
}