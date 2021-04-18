import 'package:json_annotation/json_annotation.dart';

import '../user/user_model.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class Pet {
  late String id;
  late String name;
  late List<String> photoUrls;
  late String type;
  late String gender;
  late int age;
  late double weight;
  late String summary;
  late String? error;
  late User? owner;
  late String province;

  Pet(this.id, this.name, this.photoUrls, this.type, this.gender, this.age,
      this.weight, this.summary, this.owner, this.province);
  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
  Map<String, dynamic> toJson() => _$PetToJson(this);

  Pet.withError(this.error);
}
