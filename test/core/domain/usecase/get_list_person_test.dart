import 'package:clean_architecture_flutter_001/core/person/domain/entity/person.dart';
import 'package:clean_architecture_flutter_001/core/person/domain/repository/person_repository.dart';
import 'package:clean_architecture_flutter_001/core/person/domain/usecase/get_list_person.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements PersonRepository {}

void main() {
  late GetListPerson getListPerson;
  late PersonRepository repository;
  setUpAll(
    () {
      repository = RepositoryMock();
      getListPerson = GetListPersonImpl(repository);
    },
  );

  test('Testa caso de uso de obter lista de pessoas', () async {
    when(() => repository.getPersonList())
        .thenAnswer((invocation) async => const Right(<Person>[]));

    final result = await getListPerson();
    expect(result, isA<Right>());
    expect(result | null, isA<List<Person>?>());
  });

  test('Deve retornar uma exception', () async {
    when(() => repository.getPersonList())
        .thenAnswer((invocation) async => Left(Exception()));

    final result = await getListPerson();
    expect(result, isA<Left>());
    expect(result.fold((l) => l, (r) => r), isA<Exception>());
    // O caso de cima pode ser escrito como abaixo. usando id,
    // que é retorna o que recebe
    expect(result.fold(id, id), isA<Exception>());
  });
}
