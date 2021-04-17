import '../lang/app_localizations.dart';

String getText(key) {
  return AppLocalizations.instance?.translateHelper(key) ?? '';
}
