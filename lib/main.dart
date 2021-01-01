import 'package:flutter/material.dart';
import './trasaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now()),
  ];
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('CHART!'),
              elevation: 5,
              color: Colors.blue,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    onChanged: (value) {
                      titleInput = value;
                    },
                  ),
                  TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      onChanged: (value) => amountInput = value),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Column(
              children: transactions.map((tx) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    child: Text(
                      '\$${tx.amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}

// * TextEditingController() -> Conectar com o controller do TextField()
// * O onChanged sempre espera uma função com um argumento
// * Por default a Column deixa seus filhos centralizados
// * Column -> Main Axis (vertical), Cross Axis (horizontal)
// * Row -> Main Axis (Horizontal), Cross Axis (Vertical)
// * width: double.ifinity  → O Widget terá o máximo de largura possível
// * CrossAxisAlignment.stretch -> esticam o elemento filho o máximo possível
// * O Widget Card(), por padrão, depende do tamanho do seu filho, ao menos que você tenha um pai sobre o cartão.
// * o container pode ser usado para definir as dimensões e alinhamento de qualquer widget
// * o map sempre retornará um interavel e sempre vc precisará tranforma-lo em um lista: .toList()
// * EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// * BoxDecoration() nos oferece muitas opções de decoração para aquele determinado "recepiente"
// * Container: Perfect for custom styling & alignment
