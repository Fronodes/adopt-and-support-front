import 'package:json_annotation/json_annotation.dart';

import '../user/user_model.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class Pet {
  String id;
  String name;
  List<String> photoUrls;
  String type;
  String gender;
  int age;
  double weight;
  String summary;
  User owner;

  Pet(this.id, this.name, this.photoUrls, this.type, this.gender, this.age,
      this.weight, this.summary, this.owner);
  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
  Map<String, dynamic> toJson() => _$PetToJson(this);
}
