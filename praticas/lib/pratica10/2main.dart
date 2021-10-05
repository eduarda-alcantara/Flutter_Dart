import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController num01Controller = TextEditingController();
  TextEditingController num02Controller = TextEditingController();

  String resp1 = "";
  String resp2 = "";
  String resp3 = "";

  imc() {
    double num01 = double.parse(this.num01Controller.text);
    double num02 = double.parse(this.num02Controller.text);
    double imc = num01 / (num02 * num02);
    this.resp1 = "\nIMC= "+ imc.toStringAsFixed(2);
    this.resp2 = "\n    IMC   |   Classificação   ";
    this.resp3 = " <16         Magreza Grave   \n"
        +" <17         Magreza Moderada \n"
        +"<18,5       Magreza Leve \n"
        +" <25         Saudável  \n"
        +" <30         Sobrepeso \n"
        +" <35        Obesidade Grau I \n"
        +" <40        Obesidade Grau II \n"
        +"<=40       Obesidade Grau III \n";

    return this.resp1;
    return this.resp2;
    return this.resp3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: num01Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => num01Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'Informe seu peso em kg (somente números)',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: num02Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => num02Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'Informe sua altura  (ex:1.70)',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(imc());
              setState(imc);
            },
            child: Text(
              'Calcular IMC',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Text(
            this.resp1,
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            this.resp2,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.blue,
            ),
          ),
          Text(
            this.resp3,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}