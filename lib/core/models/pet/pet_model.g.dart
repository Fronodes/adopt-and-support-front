// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) {
  return Pet(
    json['id'] as String,
    json['name'] as String,
    (json['photoUrls'] as List<dynamic>).map((e) => e as String).toList(),
    json['type'] as String,
    json['gender'] as String,
    json['age'] as int,
    (json['weight'] as num).toDouble(),
    json['summary'] as String,
    User.fromJson(json['owner'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrls': instance.photoUrls,
      'type': instance.type,
      'gender': instance.gender,
      'age': instance.age,
      'weight': instance.weight,
      'summary': instance.summary,
      'owner': instance.owner,
    };
