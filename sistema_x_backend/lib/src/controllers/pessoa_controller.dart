import 'dart:async';
import 'dart:convert';
import 'package:angel3_framework/angel3_framework.dart';
import 'package:sistema_x_core/sistema_x_core.dart';

class PessoaController {
  static Future<dynamic> listar(RequestContext req, ResponseContext res) async {
    var dados = <Pessoa>[
      Pessoa(nome: 'Isaque', telefone: '225555'),
      Pessoa(nome: 'Isaque', telefone: '225555')
    ];

    return res.write(jsonEncode(dados.map((e) => e.toMap()).toList()));
  }
}
