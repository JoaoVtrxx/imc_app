import 'package:flutter/material.dart';
import 'package:flutter_imccalculator/Models/imc_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HistoryItemWidget extends StatelessWidget {
  final ImcModel itemImc;

  const HistoryItemWidget({
    super.key,
    required this.itemImc,
  });

  @override
  Widget build(BuildContext context) {
    final IconData? icone;

    switch (itemImc.imc) {
      case (< 24.9 && > 18.5):
        icone = Icons.check;
        break;
      default:
        icone = Icons.warning_amber_rounded;
        break;
    }

    return Container(
      height: MediaQuery.sizeOf(context).height / 8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(70, 0, 0, 0),
            blurRadius: 5,
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: CircularPercentIndicator(
                  radius: 35.0,
                  lineWidth: 4.0,
                  animation: true,
                  percent: 1,
                  center: Text(
                    itemImc.imc.toStringAsFixed(1),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: itemImc.corImc),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Peso:", style: TextStyle(fontSize: 16)),
                      Text("Altura:", style: TextStyle(fontSize: 16)),
                      Text("Idade:", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: itemImc.corImc,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '${itemImc.peso}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Kg',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '${itemImc.altura}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'cm',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '${itemImc.idade}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Anos',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    icone,
                    color: itemImc.corImc,
                  ),
                  Text(
                    itemImc.date,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
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
