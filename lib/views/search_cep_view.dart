import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:via_cep_api/models/viacep_model.dart';
import 'package:via_cep_api/repositories/viacep/viacep_http_repository.dart';

class SearchCepView extends StatefulWidget {
  final Function(int) onIndexPageChange;
  const SearchCepView({super.key, required this.onIndexPageChange});

  @override
  State<SearchCepView> createState() => _SearchCepViewState();
}

class _SearchCepViewState extends State<SearchCepView> {
  var controllerCep = TextEditingController(text: '');
  var viaCepModel = ViaCepModel();
  var viaCepRepository = ViaCepRepository();
  String cep = "";
  String logradouro = "";
  String bairro = "";
  String cidade = "";
  String uf = "";

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
              onChanged: (String value) async {
                var cep = value;
                if (cep.length == 8) {
                  viaCepModel = await viaCepRepository.consultarCEP(cep);
                  setState(() {
                  });
                }
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              decoration: const InputDecoration(
                  labelText: 'CEP',
                  hintText: 'Digite aqui o CEP a Ser Buscado...'),
            ),
            GestureDetector(
                onTap: () {},
                child: Card(
                  child: Column(                    
                    children: [
                      Text(
                          "${viaCepModel.cep ?? ""} - ${viaCepModel.logradouro ?? ""}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      Text(
                          "${viaCepModel.bairro ?? ""} - ${viaCepModel.localidade ?? ""} - ${viaCepModel.uf ?? ""}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            if(viaCepModel.cep == null || viaCepModel.cep == "") ElevatedButton(
                onPressed: () {
                  int index = 2;
                  widget.onIndexPageChange(index);
                },
                child: const Text('Cadastrar CEP')),
          ],
        ),
      ),
    );
  }
}
