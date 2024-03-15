import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_imccalculator/widgets/main_formfield_decoration.dart';
import '../Models/imc_model.dart';

class FormBottomSheet extends StatefulWidget {
  const FormBottomSheet({super.key});

  @override
  State<FormBottomSheet> createState() => _FormBottomSheetState();
}

class _FormBottomSheetState extends State<FormBottomSheet> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.sizeOf(context).height / 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 7,
                width: MediaQuery.sizeOf(context).width / 10,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(40)),
              ),
              const Text(
                "Insira seus dados: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextFormField(
                      controller: _pesoController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: getAuthenticationInputDecoration("Peso: Kg"),
                      validator: (String? value) {
                        if (value == null) {
                          return "peso não foi digitado";
                        }
                        if (value.isEmpty) {
                          return "O peso não foi digitado";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextFormField(
                      controller: _alturaController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration:
                          getAuthenticationInputDecoration("Altura: cm"),
                      validator: (String? value) {
                        if (value == null) {
                          return "altura não foi digitada";
                        }
                        if (value.isEmpty) {
                          return "A altura não foi digitada";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextFormField(
                      controller: _idadeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration:
                          getAuthenticationInputDecoration("Idade: Anos"),
                      validator: (String? value) {
                        if (value == null) {
                          return "idade não foi digitada";
                        }
                        if (value.isEmpty) {
                          return "A idade não foi digitada";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  botaoEnviarClicado();
                },
                child: const Text(
                  "Enviar",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  botaoEnviarClicado() {
    if (_formKey.currentState!.validate()) {
      int peso = int.parse(_pesoController.text);
      int altura = int.parse(_alturaController.text);
      int idade = int.parse(_idadeController.text);
      final String date =
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

      ImcModel value = ImcModel(
          peso: peso,
          altura: altura,
          idade: idade,
          imc: 0,
          corImc: Colors.black,
          date: date);
      Navigator.pop(context, value);
    }
  }
}
