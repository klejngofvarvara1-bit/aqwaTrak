import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ProfileState extends ChangeNotifier {
  String? name;
  String? quote;
  String? avatarPath;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    quote = prefs.getString('quote');
    avatarPath = prefs.getString('avatar');
    notifyListeners();
  }

  Future<void> setProfile({
    required String name,
    required String quote,
    required String avatarPath,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('quote', quote);
    await prefs.setString('avatar', avatarPath);

    this.name = name;
    this.quote = quote;
    this.avatarPath = avatarPath;

    notifyListeners();
  }
  final profileState = ProfileState();

}
