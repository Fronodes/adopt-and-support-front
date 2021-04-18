// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['_id'] as String,
    json['fullName'] as String,
    json['phoneNumber'] as String?,
    Address.fromJson(json['adress'] as Map<String, dynamic>),
    json['email'] as String,
    json['photoUrl'] as String,
    (json['favorites'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'adress': instance.address,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'favorites': instance.favorites,
    };
