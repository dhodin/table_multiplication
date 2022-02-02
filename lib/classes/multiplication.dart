import 'package:flutter/foundation.dart';
import 'dart:math';

class JeuxMultiplication {
  int tableSelect;

  // Constructeur
  JeuxMultiplication({this.tableSelect = 0});

  // Operation
  List<int> Operation() {
    int multiple = Random().nextInt(10);
    return [tableSelect, multiple, tableSelect * multiple];
  }

  // Changement de table
  void ChangeDeTable(int nouvelleTable) {
    tableSelect = nouvelleTable;
  }
}
