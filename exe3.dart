import 'dart:io';

void inserirLista(var l, String item) {
  l.add(item);
}

void salvarArquivo(var arq, String l) {
  arq.writeln(l);
}

void main() {
  var compras = [];
  String item;

  while(true) {
    stdout.write("Digite um item da lista de compras (ou 'fim' para terminar): ");
    item = stdin.readLineSync() ?? '0';
    if(item == "fim") break;
    inserirLista(compras, item);
  }

  var sink = File('minhas_compras.txt').openWrite();

  for (var c in compras) {
    salvarArquivo(sink, c);
  }

  sink.close(); 
  print("Lista de compras salva em 'minhas_compras.txt' com sucesso!");
}
