class Pessoa {
  String nome;
  String telefone;
  Pessoa({this.nome, this.telefone});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'nome': nome, 'telefone': telefone};
  }
}
