// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationPackage _$DonationPackageFromJson(Map<String, dynamic> json) {
  return DonationPackage(
    json['_id'] as String,
    json['name'] as String,
    (json['price'] as num).toDouble(),
    json['pieceNumber'] as int,
    json['photoUrl'] as String,
  );
}

Map<String, dynamic> _$DonationPackageToJson(DonationPackage instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'pieceNumber': instance.pieceNumber,
      'photoUrl': instance.photoUrl,
    };
