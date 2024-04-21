import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'router/router.dart';

part 'theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences));
}

final _router = GoRouter(routes: $appRoutes);

class MyApp extends StatelessWidget {
  const MyApp(this._sharedPreferences, {super.key});
  final SharedPreferences _sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(_sharedPreferences),
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) => DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) => MaterialApp.router(
            routerConfig: _router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(colorScheme: provider.useDarkTheme ? darkDynamic : lightDynamic),
          ),
        ),
      ),
    );
  }
}
