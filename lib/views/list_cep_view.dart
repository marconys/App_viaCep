import 'package:flutter/material.dart';
import 'package:via_cep_api/models/enderecos_back4app_model.dart';
import 'package:via_cep_api/repositories/back4app/back4app_repository.dart';
import 'package:via_cep_api/views/create_update_cep.dart';

class ListCepView extends StatefulWidget {
  const ListCepView({super.key});

  @override
  State<ListCepView> createState() => _ListCepViewState();
}

class _ListCepViewState extends State<ListCepView> {
  Back4AppHttpRepository back4AppHttpRepository = Back4AppHttpRepository();
  var _enderecosBack4AppModel = CepsBack4AppModel([]);
  late String objectId;
  late String cep;
  late String logradouro;
  late String bairro;
  late String cidade;
  late String uf;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getEnderecos();
  }

  getEnderecos() async {
    setState(() {
      loading = true;
    });
    _enderecosBack4AppModel = await back4AppHttpRepository.getCeps();
    setState(() {
      loading = false;
    });
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  buscarEnderecoById(String id) async {
    var enderecos = await back4AppHttpRepository.getEnderecoByObjectId(id);

    objectId = enderecos!.objectId;
    cep = enderecos.cep;
    logradouro = enderecos.logradouro;
    bairro = enderecos.bairro;
    cidade = enderecos.cidade;
    uf = enderecos.uf;
    setState(() {});
  }

  void enviarEndereco(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreateUpdateCepView(
                objectId: objectId,
                cep: cep,
                logradouro: logradouro,
                bairro: bairro,
                cidade: cidade,
                uf: uf)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount: _enderecosBack4AppModel.enderecos.length,
                        itemBuilder: (BuildContext contex, int index) {
                          var endereco =
                              _enderecosBack4AppModel.enderecos[index];
                          return Dismissible(
                              onDismissed:
                                  (DismissDirection dismissDirection) async {
                                await back4AppHttpRepository
                                    .deleteEndereco(endereco.objectId);
                                getEnderecos();
                                showSnackBar("Endereço Excluído com sucesso!");
                              },
                              key: Key(endereco.logradouro),
                              child: GestureDetector(
                                onTap: () async {
                                  await buscarEnderecoById(endereco.objectId);
                                  enviarEndereco(contex);
                                },
                                child: ListTile(
                                  title: Text(
                                      "${endereco.logradouro} - ${endereco.bairro}\n${endereco.cidade} - ${endereco.uf}"),
                                ),
                              ));
                        })),
          ],
        ),
      ),
    );
  }
}
