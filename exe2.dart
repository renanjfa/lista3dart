
import 'dart:io';

void exibirTabuada(int N) {
  print("Tabuada do $N:");
  int mult;
  for(int i = 1; i<=10; i++) {
    mult = N * i;
    print("$N X $i = $mult");
  }
}

void main() {

  stdout.write("Digite um número para ver a tabuada: ");
  String nS = stdin.readLineSync() ?? '0';
  int n = int.parse(nS);

  exibirTabuada(n);
}