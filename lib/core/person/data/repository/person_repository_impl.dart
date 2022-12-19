import 'package:clean_architecture_flutter_001/core/person/data/datasource/person_datasource.dart';
import 'package:clean_architecture_flutter_001/core/person/data/dto/person_dto.dart';
import 'package:clean_architecture_flutter_001/core/person/data/mapper/person_mapper.dart';
import 'package:clean_architecture_flutter_001/core/person/domain/entity/person.dart';
import 'package:clean_architecture_flutter_001/core/person/domain/repository/person_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonDataSource _dataSource;
  final PersonMapper _mapper;
  PersonRepositoryImpl(this._dataSource, this._mapper);

  @override
  Future<Either<Exception, List<Person>?>> getPersonList() async {
    try {
      List<PersonDTO>? listDTO = await _dataSource.getPersonList();
      return Right(listDTO?.map((e) => _mapper.mapDTOToEntity(e)).toList());
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
