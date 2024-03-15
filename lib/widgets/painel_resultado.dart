// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_imccalculator/Models/imc_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PainelResultado extends StatelessWidget {
  final ImcModel pessoa;
  late final String? textoImc;

  late final IconData? iconeImc;

  PainelResultado({
    super.key,
    required this.pessoa,
  });

  void _iniciaVar(double doubleImc) {
    switch (doubleImc) {
      case < 18.5:
        textoImc = "Abaixo do Peso";
        iconeImc = Icons.warning_amber_rounded;
        break;
      case < 24.9:
        textoImc = "Normal";
        iconeImc = Icons.check;
        break;
      case < 29.9:
        textoImc = "Sobrepeso";
        iconeImc = Icons.warning_amber_rounded;
        break;
      case < 34.9:
        textoImc = "Obesidade I";
        iconeImc = Icons.close;
        break;
      case < 39.9:
        textoImc = "Obesidade II";
        iconeImc = Icons.close;
        break;
      case > 40.0:
        textoImc = "Obesidade III";
        iconeImc = Icons.close;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double doubleImc = pessoa.imc;
    _iniciaVar(doubleImc);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Peso:"),
                Text("Altura:"),
                Text("Idade:"),
              ],
            ),
            const Divider(thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RichText(
                  text: TextSpan(
                    text: '   ${pessoa.peso}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Kg',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '   ${pessoa.altura}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'cm',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '   ${pessoa.idade}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Anos',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 10.0,
              animation: true,
              percent: 1,
              center: Text(
                doubleImc.toStringAsFixed(1),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: pessoa.corImc,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textoImc!,
                    style: TextStyle(
                        color: pessoa.corImc,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Icon(
                    iconeImc,
                    size: 39,
                    color: pessoa.corImc,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
