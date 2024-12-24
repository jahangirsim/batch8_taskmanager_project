import 'package:batch8_taskmanager_project/ui/screens/sign_up_screen.dart';
import 'package:batch8_taskmanager_project/ui/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailTEController = TextEditingController();
final TextEditingController _passwordTEController = TextEditingController();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 68,
              ),
              Text(
                "Get Started With",
                style: textStyle.titleLarge,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _emailTEController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "Email Address"),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _passwordTEController,
                obscureText: true,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(onPressed: () {}, child: const Icon(Icons.double_arrow)),
              const SizedBox(
                height: 48,
              ),
              TextButton(onPressed: () {}, child: const Text("Forgot Password?")),
              const SizedBox(
                height: 24,
              ),
              _buildSignIn()
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildSignIn() {
    return RichText(
            text: TextSpan(
                text: "Don't have an account? ",
                style: const TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                      text: "Sign up",
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.pushNamed(context, SignupScreen.name);
                      })
                ]),
          );
  }

  @override
  void dispose() {

      _emailTEController.dispose();
      _passwordTEController.dispose();

    super.dispose();
  }
}
