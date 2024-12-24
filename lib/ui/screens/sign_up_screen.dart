import 'package:batch8_taskmanager_project/ui/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String name = '/sign-up-screen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailTEController = TextEditingController();
final TextEditingController _firstNameTEController = TextEditingController();
final TextEditingController _lastNameTEController = TextEditingController();
final TextEditingController _mobileTEController = TextEditingController();
final TextEditingController _passwordTEController = TextEditingController();

class _SignupScreenState extends State<SignupScreen> {
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
                "Join with Us",
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
                height: 12,
              ),
              TextFormField(
                controller: _firstNameTEController,

                decoration: const InputDecoration(hintText: "First Name"),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _lastNameTEController,

                decoration: const InputDecoration(hintText: "Last Name"),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: _mobileTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Mobile"),
              ),
              const SizedBox(
                height: 12,
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
              _buildSignUp()
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildSignUp() {
    return RichText(
            text: TextSpan(
                text: "Have an account? ",
                style: const TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                      text: "Sign in",
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.pop(context);
                      })
                ]),
          );
  }

  @override
  void dispose() {
      _emailTEController.dispose();
      _firstNameTEController.dispose();
      _lastNameTEController.dispose();
      _mobileTEController.dispose();
      _passwordTEController.dispose();

    super.dispose();
  }
}
