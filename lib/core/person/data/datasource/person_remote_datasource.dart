import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture_flutter_001/core/person/data/datasource/person_datasource.dart';
import 'package:clean_architecture_flutter_001/core/person/data/dto/person_dto.dart';
import 'package:http/http.dart';

class PersonRemoteDataSource implements PersonDataSource {
  final Client _client;
  // Como a ideia é aprender e testar os recursos de teste, para o get será criada uma constante na classe,
  // em um projeto real seria utilizado um arquivo para definição de constantes por flavor.
  static const URL_GET =
      "https://63964a99a68e43e41800dba1.mockapi.io/api/v1/persons";

  PersonRemoteDataSource(this._client);

  @override
  Future<List<PersonDTO>?> getPersonList() async {
    final response = await _client.get(Uri.parse(URL_GET));
    if (response.statusCode == HttpStatus.ok) {
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((e) => PersonDTO.fromJSON(e)).toList();
    } else if (response.statusCode == HttpStatus.unauthorized) {
      throw Exception('Não me convidaram para esta festa pobre.');
    } else {
      throw Exception(
          'Pode ser um erro de conexão, erro no servidor ou alguém esqueceu de pagar a internet.');
    }
  }
}
