import 'package:clean_architecture_flutter_001/core/person/domain/entity/person.dart';
import 'package:clean_architecture_flutter_001/core/person/domain/repository/person_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetListPerson {
  Future<Either<Exception, List<Person>?>> call();
}

class GetListPersonImpl implements GetListPerson {
  final PersonRepository repository;

  GetListPersonImpl(this.repository);

  @override
  Future<Either<Exception, List<Person>?>> call() async {
    return repository.getPersonList();
  }
}
