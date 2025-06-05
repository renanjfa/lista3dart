import 'dart:io';

bool validacaoNotas(double nota) {
  if(nota >= 0 && nota <= 10)
    return true;
  else return false;
}

double mediaAritmetica(double n1, double n2, double n3) {

  if(validacaoNotas(n1) && validacaoNotas(n2) && validacaoNotas(n3))
    return (n1+n2+n3)/3;
  else 
    return -1;
}

void main() {

  String notas;
  double n1, n2, n3;

  stdout.write("Digite a primeira nota: ");
  notas = stdin.readLineSync() ?? '0';
  n1 = double.parse(notas);

  stdout.write("Digite a segunda nota: ");
  notas = stdin.readLineSync() ?? '0';
  n2 = double.parse(notas);

  stdout.write("digite a terceira nota: ");
  notas = stdin.readLineSync() ?? '0';
  n3 = double.parse(notas);

  double media = mediaAritmetica(n1, n2, n3);
  if(media < 0) 
    print("Erro: Nota inválida inserida. As notas devem estar entre 0 e 10.");
  else {
    String mediaS = media.toStringAsFixed(2);
    print("Media: $mediaS");
  }
}