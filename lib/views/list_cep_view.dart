import 'package:flutter/material.dart';
import 'package:via_cep_api/models/enderecos_back4app_model.dart';
import 'package:via_cep_api/repositories/back4app/back4app_repository.dart';

class ListCepView extends StatefulWidget {
  final Function(String, int) onIndexPageChange;
  const ListCepView({super.key, required this.onIndexPageChange});

  @override
  State<ListCepView> createState() => _ListCepViewState();
}

class _ListCepViewState extends State<ListCepView> {
  Back4AppHttpRepository back4AppHttpRepository = Back4AppHttpRepository();
  var _enderecosBack4AppModel = CepsBack4AppModel([]);
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Endereço Excluído com sucesso!")));
                              },
                              key: Key(endereco.logradouro),
                              child: GestureDetector(
                                onTap: () {
                                  widget.onIndexPageChange(
                                      endereco.objectId.toString(), 2);
                                  debugPrint(endereco.objectId);
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
