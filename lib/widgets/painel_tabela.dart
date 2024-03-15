import 'package:flutter/material.dart';

import 'item_column_imc.dart';

class PainelTabela extends StatelessWidget {
  final List<bool> ativo;
  const PainelTabela({super.key, required this.ativo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          ItemColumnImc(
              cor: Colors.blue.shade800,
              descricao: "Abaixo de Peso",
              valor: "< 18.5",
              ativo: ativo[0]),
          ItemColumnImc(
              cor: Colors.green,
              descricao: "Peso Normal",
              valor: "18.5 - 24.9",
              ativo: ativo[1]),
          ItemColumnImc(
              cor: Colors.yellow.shade600,
              descricao: "Sobrepeso",
              valor: "25 - 29.9",
              ativo: ativo[2]),
          ItemColumnImc(
              cor: Colors.orange,
              descricao: "Obesidade Grau I",
              valor: "30 - 34.9",
              ativo: ativo[3]),
          ItemColumnImc(
              cor: Colors.red.shade400,
              descricao: "Obesidade Grau II",
              valor: "35 - 39.9",
              ativo: ativo[4]),
          ItemColumnImc(
              cor: Colors.red.shade800,
              descricao: "Obesidade Mórbida",
              valor: "> 40",
              ativo: ativo[5]),
        ]),
      ),
    );
  }
}
