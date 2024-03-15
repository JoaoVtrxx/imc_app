import 'package:flutter/material.dart';
import 'package:flutter_imccalculator/Models/imc_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ImcDataBase {
  ImcModel pessoa = ImcModel(
      peso: 0, altura: 0, idade: 0, imc: 0, corImc: Colors.black, date: "");
  List historico = [];
  List<bool> ativo = [false, false, false, false, false, false];

  final _myBox = Hive.box('mybox');

  // first time ever open app:
  void createInitialData() {
    ImcModel pessoa = ImcModel(
      peso: 0,
      altura: 0,
      idade: 0,
      imc: 0,
      corImc: Colors.black,
      date: "",
    );
    List<bool> ativo = [false, true, false, false, false, false];
    List historico = [];
  }

  //load data from database
  void loadData() {
    pessoa = _myBox.get('PESSOA');
    historico = _myBox.get('HISTORICO');
    ativo = _myBox.get('ATIVO');
  }

  //update the data
  void updateDataBase() {
    _myBox.put('PESSOA', pessoa);
    _myBox.put('HISTORICO', historico);
    _myBox.put('ATIVO', ativo);
  }
}
