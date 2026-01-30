import 'package:flutter/material.dart';
import 'profile_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _quoteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = profileState.name;
    _quoteController.text = profileState.quote;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quoteController.dispose();
    super.dispose();
  }

  Future<void> _saveAndGo() async {
    final name = _nameController.text.trim().isEmpty ? 'User' : _nameController.text.trim();
    final quote = _quoteController.text.trim().isEmpty ? profileState.quote : _quoteController.text.trim();

    await profileState.setProfile(name: name, quote: quote);

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/home');
  }

  Future<void> _getNewQuote() async {
    await profileState.refreshQuoteFromApi();
    _quoteController.text = profileState.quote;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Регистрация')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Имя'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _quoteController,
              decoration: const InputDecoration(labelText: 'Любимая цитата'),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _getNewQuote,
                    child: const Text('Случайная цитата (API)'),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveAndGo,
                child: const Text('Сохранить и войти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
