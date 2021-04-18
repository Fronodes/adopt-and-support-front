import 'package:json_annotation/json_annotation.dart';

import '../address/address_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  late String? id;
  late String name;
  late String surname;
  late String? phoneNumber;
  late Address address;
  late String email;
  late String photoUrl;
  late String? error;
  late List<String>? favorites;

  User(this.id, this.name, this.surname, this.phoneNumber, this.address,
      this.email, this.photoUrl, this.favorites);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.withError(this.error);
}
