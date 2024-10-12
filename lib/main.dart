import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamscape/constants.dart';
import 'package:streamscape/providers/user_provider.dart';
import 'package:streamscape/routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreamScape',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.initial,
    );
  }
}
