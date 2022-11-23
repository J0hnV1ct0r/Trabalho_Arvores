import 'dart:io';
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
    print("posição de ${entrada} na lista: ${index}");
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
      if(indexRaiz != 0){
        comparacaoFR(lista,indexRaiz.floor());
      }
    }
  }
}


void comparacaoRF(var lista, var indexRaiz){
  var numTemp;
  if(lista.length > 1){
    double indexDir = (indexRaiz * 2) + 1;
    double indexEsq = (indexRaiz * 2) + 2;
    if(lista[indexDir.floor()] < lista[indexRaiz]){
      numTemp = lista[indexRaiz];
      lista[indexRaiz] = lista[indexDir.floor()];
      lista[indexDir.floor()] = numTemp;
      if(((indexDir.floor() * 2) + 1) <= lista.length){
        comparacaoRF(lista,indexDir.floor());
      }
      if(((indexDir.floor() * 2) + 2) <= lista.length){
        comparacaoRF(lista,indexDir.floor());
      }
    }
    if(lista[indexEsq.floor()] < lista[indexRaiz]){
      numTemp = lista[indexRaiz];
      lista[indexRaiz] = lista[indexEsq.floor()];
      lista[indexEsq.floor()] = numTemp;
      if(((indexEsq.floor() * 2) + 1) <= lista.length){
        comparacaoRF(lista,indexEsq.floor());
      }
      if(((indexDir.floor() * 2) + 2) <= lista.length){
        comparacaoRF(lista,indexEsq.floor());
      }
    }
  }
}

int trocaDeValores(var lista){
  var raiz = lista[0];
  lista[0] = lista[lista.length-1];
  return raiz;
}