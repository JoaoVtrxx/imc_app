import 'package:flutter/material.dart';
import 'package:flutter_imccalculator/Models/imc_model.dart';
import 'package:flutter_imccalculator/data/database.dart';
import 'package:flutter_imccalculator/screens/historico.dart';
import 'package:flutter_imccalculator/widgets/form_bottom_sheet.dart';
import 'package:flutter_imccalculator/widgets/painel_resultado.dart';
import 'package:flutter_imccalculator/widgets/painel_tabela.dart';
import 'package:flutter_imccalculator/widgets/row_navigation_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ImcModel db.pessoa = ImcModel(
  //     peso: 0, altura: 0, idade: 0, imc: 0, corImc: Colors.black, date: "");
  // List<ImcModel> db.historico = [];
  // List<bool> db.ativo = [false, false, false, false, false, false];

  final _myBox = Hive.box('mybox');
  ImcDataBase db = ImcDataBase();

  @override
  void initState() {
    if (_myBox.get('HISTORICO') == null ||
        _myBox.get('PESSOA') == null ||
        _myBox.get('ATIVO') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void _recebeDadosForm(ImcModel value) {
    setState(() {
      db.pessoa = value;

      double alturaLocal = (db.pessoa.altura) / 100;
      db.pessoa.imc = db.pessoa.peso / (alturaLocal * alturaLocal);

      db.ativo = [false, false, false, false, false, false];

      switch (db.pessoa.imc) {
        case < 18.5:
          db.ativo[0] = true;
          db.pessoa.corImc = Colors.blue.shade800;
          break;
        case < 24.9:
          db.ativo[1] = true;
          db.pessoa.corImc = Colors.green;
          break;
        case < 29.9:
          db.ativo[2] = true;
          db.pessoa.corImc = Colors.yellow.shade600;
          break;
        case < 34.9:
          db.ativo[3] = true;
          db.pessoa.corImc = Colors.orange;
          break;
        case < 39.9:
          db.ativo[4] = true;
          db.pessoa.corImc = Colors.red.shade400;
          break;
        case > 40:
          db.ativo[5] = true;
          db.pessoa.corImc = Colors.red.shade800;
          break;
      }
      db.historico = db.historico.reversed.toList();
      db.historico.add(db.pessoa);
      db.historico = db.historico.reversed.toList();
    });
    db.updateDataBase();
  }

  void _navigateToHistoryPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HistoryPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: db.pessoa.corImc,
        elevation: 2,
        title: const Text(
          "Calculadora IMC",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              iconSize: 32,
              onPressed: () {
                _navigateToHistoryPage(context);
              },
              icon: const Icon(Icons.history),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: PainelResultado(
              pessoa: db.pessoa,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PainelTabela(ativo: db.ativo),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: db.pessoa.corImc,
        onPressed: () {
          showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                  ),
                  context: context,
                  builder: (BuildContext context) => const FormBottomSheet())
              .then((value) {
            setState(() {
              if (value != null) {
                _recebeDadosForm(value);
              }
            });
          });
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: db.pessoa.corImc,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: const RowNavigationBar(),
        ),
      ),
    );
  }
}
