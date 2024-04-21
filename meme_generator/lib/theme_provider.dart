part of 'main.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedPreferences _sharedPreferences;
  ThemeProvider(this._sharedPreferences);

  final String _darkThemeKey = 'useDarkTheme';

  bool get useDarkTheme => _sharedPreferences.getBool(_darkThemeKey) ?? false;
  Future<void> toggleTheme() async {
    final current = useDarkTheme;
    await _sharedPreferences.setBool(_darkThemeKey, !current);
    notifyListeners();
  }
}
