import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:remeldna_calculator/l10n/app_localizations.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MeldNaApp());
}

class MeldNaApp extends StatelessWidget {
  const MeldNaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reMELD-Na Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
        Locale('pt'),
        Locale('nl'),
        Locale('fr'),
        Locale('hr'),
        Locale('hu'),
        Locale('sl'),
      ],
      home: const HomeScreen(),
    );
  }
}
