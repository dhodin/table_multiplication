import 'package:flutter_test/flutter_test.dart';
import 'package:table_multiplication/classes/multiplication.dart';

void main() {
  test('Table multiplication', () {
    JeuxMultiplication monJeuxDeTest = JeuxMultiplication(tableSelect: 3);
    List<int> test1 = monJeuxDeTest.Operation();
    print('Test de multiplication : ' +
        test1[0].toString() +
        ' x ' +
        test1[1].toString() +
        ' = ' +
        test1[2].toString());
    expect(test1[0] * test1[1], test1[2]);
    // Changement de table et nouveau test
    monJeuxDeTest.ChangeDeTable(6);
    List<int> test2 = monJeuxDeTest.Operation();
    print('Test de multiplication : ' +
        test2[0].toString() +
        ' x ' +
        test2[1].toString() +
        ' = ' +
        test2[2].toString());
    expect(test2[0] * test2[1], test2[2]);
    // Changement de table et nouveau test
    monJeuxDeTest.ChangeDeTable(8);
    List<int> test3 = monJeuxDeTest.Operation();
    print('Test de multiplication : ' +
        test3[0].toString() +
        ' x ' +
        test3[1].toString() +
        ' = ' +
        test3[2].toString());
    expect(test3[0] * test3[1], test3[2]);
  });
}
