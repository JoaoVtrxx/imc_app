import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'imc_model.g.dart';

@HiveType(typeId: 1, adapterName: 'ImcModelAdapter')
class ImcModel {
  @HiveField(0)
  int peso;
  @HiveField(1)
  int altura;
  @HiveField(2)
  int idade;
  @HiveField(3)
  double imc;
  @HiveField(4)
  Color corImc;
  @HiveField(5)
  String date;

  ImcModel({
    required this.peso,
    required this.altura,
    required this.idade,
    required this.imc,
    required this.corImc,
    required this.date,
  });
}
