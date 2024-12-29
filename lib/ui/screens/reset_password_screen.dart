import 'package:batch8_taskmanager_project/ui/screens/sign_in_screen.dart';
import 'package:batch8_taskmanager_project/ui/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static const String name = '/reset-password-screen';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 68,
                ),
                Text(
                  "Set Password",
                  style: textStyle.titleLarge,
                ),
                const SizedBox(
                  height: 24,
                ),
                 // Need to check why it is not becoming left alignment
                Text(
                  "Minimum length of password should be more than 8 characters",
                  style: textStyle.titleMedium,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _confirmPasswordTEController,
                  decoration:
                      const InputDecoration(hintText: "Confirm Password"),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (value) => false);
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(fontSize: 16),
                    )),
                const SizedBox(
                  height: 48,
                ),
                _buildResetPassword()
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildResetPassword() {
    return RichText(
      text: TextSpan(
          text: "Have an account? ",
          style: const TextStyle(color: Colors.grey),
          children: [
            TextSpan(
                text: "Sign in",
                style: const TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, SignInScreen.name, (_) => false);
                  })
          ]),
    );
  }

  @override
  void dispose() {
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
