import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchCepView extends StatefulWidget {
  final Function(int) onIndexPageChange;
  const SearchCepView({super.key, required this.onIndexPageChange});

  @override
  State<SearchCepView> createState() => _SearchCepViewState();
}

class _SearchCepViewState extends State<SearchCepView> {
  var controllerCep = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            TextField(
              maxLength: 8,
              controller: controllerCep,
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                var cep = value;
                if (cep.length == 8) {
                  //TODO: implementar conforme https://github.com/marconys/bootcamp_santander/blob/main/todas-as-aulas/Modulo5/lib/pages/consulta_cep.dart
                }
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              decoration: const InputDecoration(
                  labelText: 'CEP',
                  hintText: 'Digite aqui o CEP a Ser Buscado...'),
            ),
            const Card(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  int index = 2;
                  widget.onIndexPageChange(index);
                },
                child: const Text('Cadastrar CEP'))
          ],
        ),
      ),
    );
  }
}
