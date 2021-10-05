import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int numeroVezes = 0;

  void incrementa() {
    setState(() {
      numeroVezes = numeroVezes + 1;
      print(numeroVezes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página Inicial"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Número de vezes que o botão foi pressionado: $numeroVezes"
                +"\n Esse número é ${numeroVezes %2 == 0 ? "par" : "ímpar"}"),
            TextField(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementa,
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Aula Widgets',
    home: Home(),
  ));
}