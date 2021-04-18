import 'package:json_annotation/json_annotation.dart';

import '../address/address_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  String id;
  String fullName;
  String phoneNumber;
  Address address;
  String mail;
  String photoUrl;
  List<String> favorites;

  User(this.id, this.fullName, this.phoneNumber, this.address,
      this.mail, this.photoUrl, this.favorites);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
