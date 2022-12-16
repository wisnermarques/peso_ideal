import 'package:flutter/material.dart';

enum Sexo { masculino, feminino }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alturaController = TextEditingController();
  Sexo? _character = Sexo.masculino;
  double pesoIdeal = 0;
  String resultado = 'Informe a sua altura acima!';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Peso Ideal'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: alturaController,
              decoration: const InputDecoration(
                labelText: 'Altura',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ListTile(
            title: const Text('Masculino'),
            leading: Radio<Sexo>(
              value: Sexo.masculino,
              groupValue: _character,
              onChanged: (Sexo? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Feminino'),
            leading: Radio<Sexo>(
              value: Sexo.feminino,
              groupValue: _character,
              onChanged: (Sexo? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.green),
            onPressed: (() {
              double altura = double.parse(alturaController.text);
              if (_character == Sexo.masculino) {
                pesoIdeal = (72.7 * altura) - 58;
              } else {
                pesoIdeal = (62.1 * altura) - 44;
              }
              setState(() {
                resultado = 'Seu peso ideal é: ${pesoIdeal.toStringAsFixed(2)}';
              });
            }),
            child: const Text('Calcular'),
          ),
          Text(resultado),
        ]),
      ),
    );
  }
}
