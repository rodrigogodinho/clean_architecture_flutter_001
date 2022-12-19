import 'package:clean_architecture_flutter_001/core/person/domain/entity/person.dart';
import 'package:dartz/dartz.dart';

abstract class PersonRepository {
  Future<Either<Exception, List<Person>?>> getPersonList();
}
