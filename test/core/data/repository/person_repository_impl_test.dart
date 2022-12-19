import 'package:clean_architecture_flutter_001/core/person/data/datasource/person_datasource.dart';
import 'package:clean_architecture_flutter_001/core/person/data/dto/person_dto.dart';
import 'package:clean_architecture_flutter_001/core/person/data/mapper/person_mapper.dart';
import 'package:clean_architecture_flutter_001/core/person/data/repository/person_repository_impl.dart';
import 'package:clean_architecture_flutter_001/core/person/domain/entity/person.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DataSourceMock extends Mock implements PersonDataSource {}

void main() {
  late PersonDataSource datasouce;
  late PersonMapper mapper;
  late PersonRepositoryImpl repository;

  setUpAll(() {
    datasouce = DataSourceMock();
    mapper = PersonMapper();
    repository = PersonRepositoryImpl(datasouce, mapper);
  });

  test('Obter lista de pessoas', () async {
    PersonDTO p1 = PersonDTO(
        id: "1",
        firstName: "Teste",
        lastName: "Maneiro",
        age: 41,
        height: 1.73,
        weight: 82);
    PersonDTO p2 = PersonDTO(
        id: "2",
        firstName: "Prova",
        lastName: "Bacana",
        age: 43,
        height: 1.79,
        weight: 84);
    when(() => datasouce.getPersonList())
        .thenAnswer((invocation) async => [p1, p2]);

    final result = await repository.getPersonList();
    expect(result, isA<Right>());
    expect(result | null, isA<List<Person>?>());
  });
}
