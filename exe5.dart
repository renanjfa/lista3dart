import 'dart:ffi';
import 'dart:io';

import 'exe3.dart';

class Tarefa {
    bool concluida;
    String? descricao;

    Tarefa({required this.descricao, this.concluida = false});

    bool getConcluida() {
      return this.concluida;
    }

    void setConcluida(bool set) {
      this.concluida = set;
    }

    String? getDescricao() {
      return this.descricao;
    }

    void setDescricao(String set) {
      this.descricao = set;
    }
}

void adicionarTarefa(List pendentes) {
    stdout.write("\nDigite a descricao da tarefa: ");
    var descricao_nova = stdin.readLineSync() ?? '0';
    
    Tarefa nova = Tarefa(descricao: descricao_nova);
    if( nova != '0' ) {
      pendentes.add(nova);
    }
}

void listarTarefas(List pendentes, List concluidas) {

    print("\nTarefas Pendentes:");
    for(var i in pendentes) {
      String? exibir = i.getDescricao();
      print("- $exibir");
    }

    print("\nTarefas Concluidas:");
    for(var i in concluidas) {
      String? exibir = i.getDescricao();
      print("- $exibir");
    }

}

void marcarTarefaConcluida(List pendentes, List concluidas) {

  // printar menu tarefas
    print("Qual tarefa deseja concluir?");
    for(var i in pendentes) {
      int index = pendentes.indexOf(i) + 1;
      String? desc = i.getDescricao();
      print("[$index] $desc");
    }

  // input escolha da tarefa a ser concluida
    stdout.write("escolha: ");
    String concluida = stdin.readLineSync() ?? '0';

    int escolha = int.parse(concluida);
    var escolhida = pendentes.elementAt(escolha-1);
    concluidas.add(escolhida);
    pendentes.remove(escolhida);
    
}

Future<void> salvarTarefas(String nomeArquivo, List pendentes, List concluidas) async {
    var arq = File(nomeArquivo).openWrite();

    int cont = 1;
    for(var i in pendentes) {
      String descricao = i.getDescricao();
      arq.writeln("$cont. $descricao");
      cont++;
    }

    for(var i in concluidas) {
      String descricao = i.getDescricao();
      arq.writeln("$cont. $descricao (concluida)");
      cont++;
    }

    await arq.close();
}

void main() async {
  
    List pendentes = [];
    List concluidas = [];

    while(true) {
      stdout.write("Escolaha uma opcao:\n1. Adicionar tarefa\n2. Listar tarefas\n3. Marcar tarefa como concluida\n4. Sair\nOpcao: ");
      String opcao = stdin.readLineSync() ?? '0';

      switch(opcao) {
        case "1":
            adicionarTarefa(pendentes);
            break;
        case "2":
            listarTarefas(pendentes, concluidas);
            break;
        case "3":
            marcarTarefaConcluida(pendentes, concluidas);
            break;
        case "4":
            await salvarTarefas('tarefas.txt', pendentes, concluidas);
            pendentes.clear();
            concluidas.clear();
            exit(1);
      }
    }
}