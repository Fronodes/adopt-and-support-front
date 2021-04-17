import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/core_shelf.dart';
import 'core/provider/provider_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.prefrencesInit();
  var languageProvider = LanguageProvider();
  await languageProvider.fetchLocale();
  runApp(
    MultiProvider(
      providers: [...?ApplicationProvider.instance?.dependItems],
      child: MyApp(languageProvider: languageProvider),
    ),
  );
}

class MyApp extends StatelessWidget {
  final LanguageProvider languageProvider;
  const MyApp({required this.languageProvider});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, modal, child) => MaterialApp(
        title: 'SambaPOS CIO',
        debugShowCheckedModeBanner: false,
        theme: getLightTheme(),
        localizationsDelegates: [...AppLocalizations.localDelegates],
        locale: modal.appLocal,
        supportedLocales: [...AppLocalizations.locales],
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      ),
    );
  }
}
