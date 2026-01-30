import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileState extends ChangeNotifier {
  String name = 'User';
  String quote = 'Stay hydrated 💧';
  String? avatarPath; // можно оставить на будущее

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? name;
    quote = prefs.getString('quote') ?? quote;
    avatarPath = prefs.getString('avatar');
    notifyListeners();
  }

  Future<void> setProfile({
    required String name,
    required String quote,
    String? avatarPath,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('quote', quote);
    if (avatarPath != null) await prefs.setString('avatar', avatarPath);

    this.name = name;
    this.quote = quote;
    this.avatarPath = avatarPath ?? this.avatarPath;

    notifyListeners();
  }

  // Реальный API: случайная цитата
  Future<void> refreshQuoteFromApi() async {
    try {
      final response = await http.get(Uri.parse('https://zenquotes.io/api/random'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final newQuote = data[0]['q']?.toString();

        if (newQuote != null && newQuote.trim().isNotEmpty) {
          quote = newQuote.trim();

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('quote', quote);

          notifyListeners();
        }
      }
    } catch (_) {
      // если API временно не доступен — не ломаем приложение
    }
  }
}

// Глобальный объект (его импортируем в нужные экраны)
final profileState = ProfileState();
