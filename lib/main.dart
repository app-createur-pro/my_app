import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('fr', 'FR'),
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('fr', 'FR'),
        child: App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'API & State management';
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFf7921b),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(title: title),
    );
  }
}
