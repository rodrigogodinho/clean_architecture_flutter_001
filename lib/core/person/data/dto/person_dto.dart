class PersonDTO {
  String? id;
  String? firstName;
  String? lastName;
  int? age;
  double? height;
  double? weight;

  PersonDTO({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.height,
    this.weight,
  });

  factory PersonDTO.fromJSON(Map<String, dynamic> json) => PersonDTO(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        age: json['age'],
        // Quando a API pode devolver un "number" con ou sem decimais, se vem sem decimais o Map entende que é int,
        // Fazendo cast de int e depois para double pode haver perda de precisão, então para garantir que será
        // double multiplicamos por 1.0, convertendo para double de forma implicita
        height: (json['height'] * 1.0),
        weight: (json['weight'] * 1.0),
      );

  Map<String, dynamic> toJSON() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'height': height,
        'weight': weight,
      };
}
