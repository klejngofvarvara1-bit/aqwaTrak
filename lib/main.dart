import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

// screens
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/register_screen.dart';

// state
import 'screens/profile_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // загрузка профиля (имя, цитата, аватар)
  await profileState.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AqwaTrak',
      initialRoute: '/register',
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/': (context) => const HomeScreen(),
        '/second': (context) => const SecondScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

