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
  double _note = 0.0;
  String _texteNote = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _note = 0.0;
            _nombreQuestions = 0;
            _nombreJuste = 0;
            _texteNote = "Note : ... (" + _nombreQuestions.toString() + ")";
          });
        },
        tooltip: 'Remise a zero',
        child: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: Text(
                      _resultat,
                      style: TextStyle(
                        color: _couleurResultat,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Text(
                    _texteNote,
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ],
              )),
          height: 120.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                  _note = 0.0;
                  _nombreQuestions = 0;
                  _nombreJuste = 0;
                  _texteNote =
                      "Note : ... (" + _nombreQuestions.toString() + ")";
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valeursMult[0].toString() + " x " + valeursMult[1].toString(),
                  style: TextStyle(fontSize: 60.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "=",
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if ((valeursMult[0] * valeursMult[1]) == valeursMult[2]) {
                      _resultat = "Bravo!!! " +
                          valeursMult[0].toString() +
                          " x " +
                          valeursMult[1].toString() +
                          " = " +
                          valeursMult[2].toString();
                      _couleurResultat = Colors.green;
                      _nombreJuste++;
                    } else {
                      _resultat = "En non...  " +
                          valeursMult[0].toString() +
                          " x " +
                          valeursMult[1].toString() +
                          " = " +
                          valeursMult[3].toString();
                      _couleurResultat = Colors.red;
                    }
                    _nombreQuestions++;
                    _note = ((_nombreJuste * 20) / _nombreQuestions);
                    _texteNote = "Note : " +
                        _note.toStringAsFixed(1) +
                        " / 20 (" +
                        _nombreQuestions.toString() +
                        ")";
                    valeursMult = maMultiplication.Operation();
                  });
                },
                child: Text(valeursMult[2].toString() + " ?",
                    style: TextStyle(fontSize: 60.0)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if ((valeursMult[0] * valeursMult[1]) == valeursMult[3]) {
                      _resultat = "Bravo!!! " +
                          valeursMult[0].toString() +
                          " x " +
                          valeursMult[1].toString() +
                          " = " +
                          valeursMult[3].toString();
                      _couleurResultat = Colors.green;
                      _nombreJuste++;
                    } else {
                      _resultat = "En non...  " +
                          valeursMult[0].toString() +
                          " x " +
                          valeursMult[1].toString() +
                          " = " +
                          valeursMult[2].toString();
                      _couleurResultat = Colors.red;
                    }
                    _nombreQuestions++;
                    _note = ((_nombreJuste * 20) / _nombreQuestions);
                    _texteNote = "Note : " +
                        _note.toStringAsFixed(1) +
                        " / 20 (" +
                        _nombreQuestions.toString() +
                        ")";
                    valeursMult = maMultiplication.Operation();
                  });
                },
                child: Text(valeursMult[3].toString() + " ?",
                    style: TextStyle(fontSize: 60.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
