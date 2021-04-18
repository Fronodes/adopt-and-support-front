import '../constants/constants_shelf.dart';

extension GenderExtension on Gender {
  String get toStr {
    switch (this) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
    }
  }
}
