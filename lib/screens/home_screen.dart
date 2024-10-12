import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamscape/providers/user_provider.dart';
import 'package:streamscape/routes.dart';
import 'package:streamscape/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamScape"),
        leading: Image.asset(
          'assets/icons/logo.png',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome, ${userProvider.user!.displayName}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  authService.signout(context);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.signin,
                    (route) => false,
                  );
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
