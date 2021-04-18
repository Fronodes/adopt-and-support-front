// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['fullName'] as String,
    json['phoneNumber'] as String,
    Address.fromJson(json['address'] as Map<String, dynamic>),
    json['mail'] as String,
    json['photoUrl'] as String,
    (json['favorites'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'mail': instance.mail,
      'photoUrl': instance.photoUrl,
      'favorites': instance.favorites,
    };
