import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab_activity_saturday/screen/recipeScreens/displayRecipe.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = "";

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RecipePage()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message!;
      });
    }
  }

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      setState(() {
        _emailController.clear();
        _passwordController.clear();
      });

      _showDialog('Message', 'User created successfully');
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message!;
      });
    }
  }

  //show dialog box
  Future<void> _showDialog(String type, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(type),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login | Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: _register,
                  child: const Text('Register'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
