import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/theme.dart';
import 'screens/portfolio_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); // Lade die .env Datei
  await ThemeManager.init(); // Lade gespeicherten ThemeMode

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeManager.themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          title: 'Portfolio App',
          themeMode: themeMode,
          theme: ThemeManager.lightTheme,
          darkTheme: ThemeManager.darkTheme,
          home: PortfolioScreen(),
        );
      },
    );
  }
}
