import 'package:clean_architecture_flutter_001/core/person/data/dto/person_dto.dart';

abstract class PersonDataSource {
  Future<List<PersonDTO>?> getPersonList();
}
