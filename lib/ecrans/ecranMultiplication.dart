import 'package:flutter/material.dart';
import 'package:table_multiplication/classes/multiplication.dart';

JeuxMultiplication maMultiplication = JeuxMultiplication(tableSelect: 5);

class EcranAccueil extends StatefulWidget {
  const EcranAccueil({Key? key}) : super(key: key);

  @override
  _EcranAccueilState createState() => _EcranAccueilState();
}

class _EcranAccueilState extends State<EcranAccueil> {
  List<int> valeursMult = maMultiplication.Operation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jeux de calcul"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Table de...",
            style: TextStyle(fontSize: 30.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    maMultiplication.ChangeDeTable(3);
                    valeursMult = maMultiplication.Operation();
                  });
                },
                child: Text("3", style: TextStyle(fontSize: 40.0)),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    maMultiplication.ChangeDeTable(4);
                    valeursMult = maMultiplication.Operation();
                  });
                },
                child: Text("4", style: TextStyle(fontSize: 40.0)),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    maMultiplication.ChangeDeTable(5);
                    valeursMult = maMultiplication.Operation();
                  });
                },
                child: Text("5", style: TextStyle(fontSize: 40.0)),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                valeursMult[0].toString() + " x " + valeursMult[1].toString(),
                style: TextStyle(fontSize: 80.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "=",
                style: TextStyle(fontSize: 80.0),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  valeursMult = maMultiplication.Operation();
                });
              },
              child: Text(valeursMult[2].toString(),
                  style: TextStyle(fontSize: 80.0)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  valeursMult = maMultiplication.Operation();
                });
              },
              child: Text(valeursMult[2].toString(),
                  style: TextStyle(fontSize: 80.0)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  valeursMult = maMultiplication.Operation();
                });
              },
              child: Text(valeursMult[2].toString(),
                  style: TextStyle(fontSize: 80.0)),
            ),
          ),
        ],
      ),
    );
  }
}
