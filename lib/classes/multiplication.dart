import 'package:flutter/foundation.dart';
import 'dart:math';

class JeuxMultiplication {
  int tableSelect;

  // Constructeur
  JeuxMultiplication({this.tableSelect = 0});

  // Operation
  List<int> Operation() {
    int multiple = Random().nextInt(8) + 2;
    int hasard = Random().nextInt(3);
    if (hasard == 0)
      return [
        tableSelect,
        multiple,
        tableSelect * multiple,
        tableSelect * (multiple - 1)
      ];
    else if (hasard == 1)
      return [
        tableSelect,
        multiple,
        tableSelect * (multiple - 1),
        tableSelect * multiple
      ];
    else if (hasard == 2)
      return [
        tableSelect,
        multiple,
        tableSelect * multiple,
        tableSelect * (multiple + 1)
      ];
    else
      return [
        tableSelect,
        multiple,
        tableSelect * (multiple + 1),
        tableSelect * multiple
      ];
  }

  // Changement de table
  void ChangeDeTable(int nouvelleTable) {
    tableSelect = nouvelleTable;
  }
}
