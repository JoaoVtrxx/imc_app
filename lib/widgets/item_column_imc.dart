import 'package:flutter/material.dart';

class ItemColumnImc extends StatelessWidget {
  final Color cor;
  final String descricao;
  final String valor;
  final bool ativo;

  const ItemColumnImc(
      {super.key,
      required this.cor,
      required this.descricao,
      required this.valor,
      required this.ativo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 47,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: cor, borderRadius: BorderRadius.circular(5)),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                descricao,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: (ativo) ? FontWeight.bold : FontWeight.normal,
                    color: (ativo) ? cor : Colors.black),
              ),
            ],
          ),
          Text(valor,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: (ativo) ? FontWeight.bold : FontWeight.normal,
                  color: (ativo) ? cor : Colors.black)),
        ],
      ),
    );
  }
}
