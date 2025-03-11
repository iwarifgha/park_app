import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:park_app/features/auth/state/auth_state_controller.dart';




class LoginView extends StatelessWidget {
  static const name = '/login';
  LoginView({super.key});
  final AuthStateController _authStateController = Get.find<AuthStateController>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
            const SizedBox(height: 20),
            Obx(() => _authStateController.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                _authStateController.signIn(_emailController.text, _passwordController.text);
              },
              child: const Text("Login"),
            )),
            TextButton(
              onPressed: () {
                _authStateController.signUp(_emailController.text, _passwordController.text);
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}

