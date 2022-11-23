class Galho{
  var valor;
  var folhaEsquerda;
  var folhaDireita;
  
  void set_folhaEsquerda(var valor){
    this.folhaEsquerda = Galho();
    this.folhaEsquerda.valor = valor;
  }
  
  void set_folhaDireita(var valor){
    this.folhaDireita = Galho();
    this.folhaDireita.valor = valor;
  }
}


void main() {
	print('Hello World!');
}
