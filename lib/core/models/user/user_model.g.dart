// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['name'] as String,
    json['surname'] as String,
    json['phoneNumber'] as String,
    Address.fromJson(json['address'] as Map<String, dynamic>),
    json['mail'] as String,
    json['photoUrl'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'mail': instance.mail,
      'photoUrl': instance.photoUrl,
    };
