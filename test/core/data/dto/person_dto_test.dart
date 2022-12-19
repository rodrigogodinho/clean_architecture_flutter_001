import 'package:clean_architecture_flutter_001/core/person/data/dto/person_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;

  setUpAll(() {
    json = {
      "firstName": "Lew",
      "lastName": "Cremin",
      "age": 68,
      "height": 99,
      "weight": 83,
      "id": "1"
    };
  });

  test('Testa o fromJSON do dto', () {
    var personDTO = PersonDTO.fromJSON(json);
    expect(personDTO.id, equals(json['id']));
    expect(personDTO.firstName, equals(json['firstName']));
    expect(personDTO.lastName, equals(json['lastName']));
    expect(personDTO.age, equals(json['age']));
    expect(personDTO.height, equals(json['height']));
    expect(personDTO.weight, equals(json['weight']));
  });

  test('Testa o toJSON do dto', () {
    var personDTO = PersonDTO(
      id: "1",
      firstName: "Prueba",
      lastName: "Marota",
      age: 25,
      height: 1.79,
      weight: 88.4,
    );
    var jsonAux = personDTO.toJSON();
    expect(jsonAux['id'], equals(personDTO.id));
    expect(jsonAux['firstName'], equals(personDTO.firstName));
    expect(jsonAux['lastName'], equals(personDTO.lastName));
    expect(jsonAux['age'], equals(personDTO.age));
    expect(jsonAux['height'], equals(personDTO.height));
    expect(jsonAux['weight'], equals(personDTO.weight));
  });
}
