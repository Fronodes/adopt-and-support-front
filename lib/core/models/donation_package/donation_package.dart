import 'package:json_annotation/json_annotation.dart';

part 'donation_package.g.dart';

@JsonSerializable()
class DonationPackage {
  String id;
  String name;
  double price;
  int pieceNumber;
  String photoUrl;

  DonationPackage(
      this.id, this.name, this.price, this.pieceNumber, this.photoUrl);
  factory DonationPackage.fromJson(Map<String, dynamic> json) =>
      _$DonationPackageFromJson(json);
  Map<String, dynamic> toJson() => _$DonationPackageToJson(this);
}
