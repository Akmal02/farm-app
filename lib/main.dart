import 'package:farm_app/screens/login_register/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.from(
          colorScheme: ColorScheme.light(
            primary: Colors.teal.shade700,
            secondary: Colors.lime.shade600,
            background: Colors.grey.shade200,
          ),
        ).copyWith(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
            filled: true,
          ),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
