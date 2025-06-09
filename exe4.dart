import 'dart:io';


List lerConfiguracoes(String nomeArquivo) {

  try {
    final file = File(nomeArquivo);
    List<String> linhas = file.readAsLinesSync();
    List<String> configuracoes = [];
    

    for(var atual in linhas) {

      List<String> temp = atual.split('=');
      configuracoes.addAll(temp);
      temp.clear();
      
    }

    int cont = 0;
    print("Configuracoes encontradas: ");
    for(var i in configuracoes) {
      if(cont%2 == 0)
        stdout.write(i + ": ");
      else  
        print(i);

      cont++;
    }

    print("Arquivo lido e fechado!!");

    return configuracoes;
  } catch(e) {
    print("Erro: Arquivo $nomeArquivo não encontrado.");
    return [];
  }
  
}

void main() {

  // Lê o arquivo linha por linha usando Stream
  var config = lerConfiguracoes("configuracoes.txt");

}