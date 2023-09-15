import 'package:flutter/material.dart';
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

 @override
  void initState() {
    super.initState();
    _views = [
    {'title': 'Buscar CEP', 'view':  SearchCepView(onIndexPageChange: _selectView)},
    {'title': 'Meus Endereços', 'view': const ListCepView()},
    {'title': 'Cadastrar / Atualizar CEP', 'view': const CreateUpdateCepView()},
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
