import 'package:clean_architecture_flutter_001/core/person/data/dto/person_dto.dart';
import 'package:clean_architecture_flutter_001/core/person/domain/entity/person.dart';

class PersonMapper {
  Person mapDTOToEntity(PersonDTO personDTO) {
    return Person(
      id: personDTO.id,
      firstName: personDTO.firstName,
      lastName: personDTO.lastName,
      age: personDTO.age,
      height: personDTO.height,
      weight: personDTO.weight,
    );
  }

  PersonDTO mapEntityToDTO(Person person) {
    return PersonDTO(
      id: person.id,
      firstName: person.firstName,
      lastName: person.lastName,
      age: person.age,
      height: person.height,
      weight: person.weight,
    );
  }
}
