Future<void> refreshQuoteFromApi() async {
  try {
    final response = await http.get(
      Uri.parse('https://zenquotes.io/api/random'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newQuote = data[0]['q'];

      quote = newQuote;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('quote', quote);

      notifyListeners();
    }
  } catch (e) {
    // если API временно недоступен — ничего не ломаем
  }
}
