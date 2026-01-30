import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/profile_state.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase можно оставить, если уже настроен
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 1) грузим профиль из SharedPreferences
  await profileState.load();
  // 2) при каждом запуске обновляем цитату из API
  await profileState.refreshQuoteFromApi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AqwaTrak',
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/register',
      routes: {
        '/register': (_) => const RegisterScreen(),
        '/home': (_) => const HomeScreen(),
        '/second': (_) => const SecondScreen(),
      },
    );
  }
}


