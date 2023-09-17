import 'package:flutter/material.dart';
import 'package:via_cep_api/models/viacep_model.dart';
import 'package:via_cep_api/repositories/back4app/back4app_repository.dart';
import 'package:via_cep_api/repositories/viacep/viacep_http_repository.dart';
import 'package:via_cep_api/views/list_cep_view.dart';
import 'package:via_cep_api/views/search_cep_view.dart';

class NavTabView extends StatefulWidget {
  const NavTabView({super.key});

  @override
  State<NavTabView> createState() => _NavTabViewState();
}

class _NavTabViewState extends State<NavTabView> {
  int _selectViewIndex = 1;

  _selectView(int index) {
    setState(() {
      _selectViewIndex = index;
    });
  }

  List<Map<String, Object>> _views = [];
  var viaCepRepository = ViaCepRepository();
  var back4AppHttpRepository = Back4AppHttpRepository();
  var viaCepModel = ViaCepModel();

  @override
  void initState() {
    super.initState();
    _views = [
      {
        'title': 'Buscar CEP',
        'view': const SearchCepView()
      },
      {
        'title': 'Meus Endereços',
        'view': const ListCepView()
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
          ]),
    );
  }
}
