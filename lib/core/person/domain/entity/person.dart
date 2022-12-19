import 'package:equatable/equatable.dart';

class Person extends Equatable {
  String? id;
  String? firstName;
  String? lastName;
  int? age;
  double? height;
  double? weight;

  Person({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.height,
    this.weight,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        age,
        height,
        weight,
      ];
}
