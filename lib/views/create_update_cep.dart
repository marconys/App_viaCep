import 'package:flutter/material.dart';
import 'package:via_cep_api/models/enderecos_back4app_model.dart';
import 'package:via_cep_api/models/viacep_model.dart';
import 'package:via_cep_api/repositories/back4app/back4app_repository.dart';
import 'package:via_cep_api/repositories/viacep/viacep_http_repository.dart';

class CreateUpdateCepView extends StatefulWidget {
  final Function(int) onIndexPageChange;
  final ViaCepModel viaCepModel;
  final EnderecosBack4AppModel enderecosBack4AppModel;
  const CreateUpdateCepView({
    required this.viaCepModel,
    required this.enderecosBack4AppModel,
    required this.onIndexPageChange,
    super.key,
  });

  @override
  State<CreateUpdateCepView> createState() => _CreateUpdateCepViewState();
}

class _CreateUpdateCepViewState extends State<CreateUpdateCepView> {
  ViaCepRepository viaCepRepository = ViaCepRepository();
  Back4AppHttpRepository back4appHttpRepository = Back4AppHttpRepository();
  var cepController = TextEditingController();
  var logradouroController = TextEditingController(text: "");
  var bairroController = TextEditingController(text: "");
  var cidadeController = TextEditingController(text: "");
  var ufController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    carregarEndereco();
  }

  void carregarEndereco() {
    if (widget.viaCepModel.cep != "") {
      cepController.text = widget.viaCepModel.cep!;
      logradouroController.text = widget.viaCepModel.logradouro!;
      bairroController.text = widget.viaCepModel.bairro!;
      cidadeController.text = widget.viaCepModel.localidade!;
      ufController.text = widget.viaCepModel.uf!;
    } else if (widget.enderecosBack4AppModel.objectId != "") {
      cepController.text = widget.enderecosBack4AppModel.cep;
      logradouroController.text = widget.enderecosBack4AppModel.logradouro;
      bairroController.text = widget.enderecosBack4AppModel.bairro;
      cidadeController.text = widget.enderecosBack4AppModel.cidade;
      ufController.text = widget.enderecosBack4AppModel.uf;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                controller: cepController,
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  hintText: 'Digite o CEP',
                ),
              ),
              TextFormField(
                controller: logradouroController,
                decoration: const InputDecoration(
                  labelText: 'Logradouro',
                  hintText: 'Nome da Rua',
                ),
              ),
              TextFormField(
                controller: bairroController,
                decoration: const InputDecoration(
                  labelText: 'Bairro',
                  hintText: 'Nome do Bairro',
                ),
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: cidadeController,
                        decoration: const InputDecoration(
                          labelText: 'Cidade',
                          hintText: 'Nome da Cidade',
                        ),
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: ufController,
                        decoration: const InputDecoration(
                          labelText: 'UF-Estado',
                          hintText: 'Sigla do Estado',
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (widget.enderecosBack4AppModel.objectId == "") {
                      await back4appHttpRepository.createEndereco(
                          EnderecosBack4AppModel.create(
                              cepController.text,
                              logradouroController.text,
                              bairroController.text,
                              cidadeController.text,
                              ufController.text));
                    } else {
                      await back4appHttpRepository
                          .updateEndereco(widget.enderecosBack4AppModel);
                    }

                    widget.onIndexPageChange(1);
                  },
                  child: const Text("Enviar Novo Endereço"))
            ],
          )),
        ),
      ),
    );
  }
}
