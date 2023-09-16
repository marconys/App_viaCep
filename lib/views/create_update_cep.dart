import 'package:flutter/material.dart';

class CreateUpdateCepView extends StatefulWidget {
  const CreateUpdateCepView({super.key});

  @override
  State<CreateUpdateCepView> createState() => _CreateUpdateCepViewState();
}

class _CreateUpdateCepViewState extends State<CreateUpdateCepView> {
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
                decoration: InputDecoration(
                  labelText: 'CEP',
                  hintText: 'Digite o CEP',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Logradouro',
                  hintText: 'Nome da Rua',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Bairro',
                  hintText: 'Nome do Bairro',
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                    decoration: InputDecoration(
                  labelText: 'Cidade',
                  hintText: 'Nome da Cidade',
                ),
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                    decoration: InputDecoration(
                  labelText: 'UF-Estado',
                  hintText: 'Sigla do Estado',
                ),
                  ))
                ],
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () {}, child: const Text("Enviar Novo Endereço"))
            ],
          )),
        ),
      ),
    );
  }
}
