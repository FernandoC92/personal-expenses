import 'package:flutter/material.dart';
import 'package:personalExpenses/widgets/user_transactions.dart';

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
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            UserTransaction(),
          ],
        ),
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
