import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/pet_creation_bloc/pet_creation_bloc.dart';
import 'package:my_app/blocs/pet_display_bloc/pet_display_bloc.dart';
import 'package:my_app/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('fr', 'FR'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PetCreationBloc>(
            create: (BuildContext context) => PetCreationBloc(),
          ),
          BlocProvider<PetDisplayBloc>(
            create: (BuildContext context) => PetDisplayBloc(),
          ),
        ],
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
