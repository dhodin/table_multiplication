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
  double _tableChoisie = 5;
  String _resultat = "";
  Color _couleurResultat = Colors.black;
  int _nombreJuste = 0;
  int _nombreQuestions = 0;
  int _note = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table de multiplication"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
            child: Center(
              child: Text(
                "Table de " + _tableChoisie.toInt().toString(),
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Slider(
            value: _tableChoisie,
            min: 2.0,
            max: 9.0,
            divisions: 7,
            onChanged: (double nouvelleValeur) {
              setState(() {
                maMultiplication.ChangeDeTable(nouvelleValeur.toInt());
                valeursMult = maMultiplication.Operation();
                _tableChoisie = nouvelleValeur;
              });
            },
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
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orangeAccent),
              ),
              onPressed: () {
                setState(() {
                  if ((valeursMult[0] * valeursMult[1]) == valeursMult[2]) {
                    _resultat = "Bravo !!! " +
                        valeursMult[0].toString() +
                        " x " +
                        valeursMult[1].toString() +
                        " = " +
                        valeursMult[2].toString();
                    _couleurResultat = Colors.green;
                    _nombreJuste++;
                  } else {
                    _resultat = "En non,  " +
                        valeursMult[0].toString() +
                        " x " +
                        valeursMult[1].toString() +
                        " = " +
                        valeursMult[3].toString();
                    _couleurResultat = Colors.red;
                  }
                  _nombreQuestions++;
                  _note = ((_nombreJuste * 20) / _nombreQuestions).round();
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
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orangeAccent),
              ),
              onPressed: () {
                setState(() {
                  if ((valeursMult[0] * valeursMult[1]) == valeursMult[3]) {
                    _resultat = "Bravo !!! " +
                        valeursMult[0].toString() +
                        " x " +
                        valeursMult[1].toString() +
                        " = " +
                        valeursMult[3].toString();
                    _couleurResultat = Colors.green;
                    _nombreJuste++;
                  } else {
                    _resultat = "En non,  " +
                        valeursMult[0].toString() +
                        " x " +
                        valeursMult[1].toString() +
                        " = " +
                        valeursMult[2].toString();
                    _couleurResultat = Colors.red;
                  }
                  _nombreQuestions++;
                  _note = ((_nombreJuste * 20) / _nombreQuestions).round();
                  valeursMult = maMultiplication.Operation();
                });
              },
              child: Text(valeursMult[3].toString(),
                  style: TextStyle(fontSize: 80.0)),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Center(
              child: Text(
                _resultat,
                style: TextStyle(
                  color: _couleurResultat,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Center(
              child: Text(
                "Note : " +
                    _note.toString() +
                    " / 20 (" +
                    _nombreQuestions.toString() +
                    ")",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
