import 'package:json_annotation/json_annotation.dart';

import '../address/address_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  String id;
  String name;
  String surname;
  String phoneNumber;
  Address address;
  String mail;
  String photoUrl;

  User(this.id, this.name, this.surname, this.phoneNumber, this.address,
      this.mail, this.photoUrl);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
