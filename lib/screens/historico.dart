import 'package:flutter/material.dart';
import 'package:flutter_imccalculator/Models/imc_model.dart';
import 'package:flutter_imccalculator/data/database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widgets/history_item.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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

  void deleteFromHistory(int index) {
    setState(() {
      db.historico.removeAt(index);
    });

    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    int tamanho = db.historico.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (tamanho <= 0) ? Colors.black : db.historico[0].corImc,
        elevation: 2,
        title: const Text("Histórico IMC:"),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: db.historico.length,
        itemBuilder: (context, index) {
          ImcModel imcHistorico = db.historico[index];
          return Slidable(
            closeOnScroll: true,
            endActionPane: ActionPane(motion: const StretchMotion(), children: [
              SlidableAction(
                onPressed: (context) => deleteFromHistory(index),
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              )
            ]),
            child: HistoryItemWidget(
              itemImc: imcHistorico,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
