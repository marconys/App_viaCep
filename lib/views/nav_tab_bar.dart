import 'package:flutter/material.dart';
import 'package:via_cep_api/models/enderecos_back4app_model.dart';
import 'package:via_cep_api/models/viacep_model.dart';
import 'package:via_cep_api/repositories/back4app/back4app_repository.dart';
import 'package:via_cep_api/repositories/viacep/viacep_http_repository.dart';
import 'package:via_cep_api/views/create_update_cep.dart';
import 'package:via_cep_api/views/list_cep_view.dart';
import 'package:via_cep_api/views/search_cep_view.dart';

class NavTabView extends StatefulWidget {
  const NavTabView({super.key});

  @override
  State<NavTabView> createState() => _NavTabViewState();
}

class _NavTabViewState extends State<NavTabView> {
  int _selectViewIndex = 0;

  _selectView(int index) {
    setState(() {
      _selectViewIndex = index;
    });
  }

  List<Map<String, Object>> _views = [];
  var viaCepRepository = ViaCepRepository();
  var back4AppHttpRepository = Back4AppHttpRepository();
  var viaCepModel = ViaCepModel();
  var enderecosBack4AppModel = EnderecosBack4AppModel.update();

  void obterEnderecoViaCep(String cep) async {
    var endereco = await viaCepRepository.consultarCEP(cep);
    setState(() {
      viaCepModel.cep = endereco.cep;
      viaCepModel.logradouro = endereco.logradouro;
      viaCepModel.bairro = endereco.bairro;
      viaCepModel.localidade = endereco.localidade;
      viaCepModel.uf = endereco.uf;
    });
  }

  void obterCependerecosBack4AppModel(String objectId) async {
    var endereco = await back4AppHttpRepository.getEnderecoByObjectId(objectId);

    setState(() {
      enderecosBack4AppModel.objectId = endereco!.objectId;
      enderecosBack4AppModel.cep = endereco.cep;
      enderecosBack4AppModel.logradouro= endereco.logradouro;
      enderecosBack4AppModel.bairro = endereco.bairro;
      enderecosBack4AppModel.cidade = endereco.cidade;
      enderecosBack4AppModel.uf = endereco.uf;
    });
  }

  @override
  void initState() {
    super.initState();
    _views = [
      {
        'title': 'Buscar CEP',
        'view': SearchCepView(
          onIndexPageChange: (cep, index) {
            obterEnderecoViaCep(cep);
            _selectView(index);
          },
        )
      },
      {
        'title': 'Meus Endereços',
        'view': ListCepView(
          onIndexPageChange: (objectId, index) {
            obterCependerecosBack4AppModel(objectId);
            _selectView(index);
          },
        )
      },
      {
        'title': 'Cadastrar / Atualizar CEP',
        'view': CreateUpdateCepView(
          viaCepModel: viaCepModel,
          enderecosBack4AppModel: enderecosBack4AppModel,
          onIndexPageChange: _selectView,
        )
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _views[_selectViewIndex]['title'] as String,
        ),
        centerTitle: true,
      ),
      body: _views[_selectViewIndex]['view'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectView,
          currentIndex: _selectViewIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp),
              label: 'Buscar CEP',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Meus Endereços',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create),
              label: 'Cadastrar/Atualizar',
            ),
          ]),
    );
  }
}
