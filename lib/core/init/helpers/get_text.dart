import '../lang/app_localizations.dart';

String getText(key) {
  return AppLocalizations.instance?.translateHelper(key) ?? '';
}

extension StringTranslate on String {
  String get translate => AppLocalizations.instance?.translateHelper(this) ?? '';
}
