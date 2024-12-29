import 'package:batch8_taskmanager_project/ui/screens/forgot_password_pin_verification_screen.dart';
import 'package:batch8_taskmanager_project/ui/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordEmailVerificationScreen extends StatefulWidget {
  const ForgotPasswordEmailVerificationScreen({super.key});

  static const String name = '/forgot-password-email-verification-screen';

  @override
  State<ForgotPasswordEmailVerificationScreen> createState() => _ForgotPasswordEmailVerificationScreenState();
}


class _ForgotPasswordEmailVerificationScreenState extends State<ForgotPasswordEmailVerificationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();


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
                  "Your Email Address",
                  style: textStyle.titleLarge,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text("A 6 digit pin verification code will send to your email address", style: textStyle.titleMedium,),
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
                ElevatedButton(onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, ForgotPasswordPINlVerificationScreen.name, (_) => false);
                }, child: const Icon(Icons.double_arrow)),
                const SizedBox(
                  height: 48,
                ),
                _buildForgetPasswordEmailVerification()
              ],
            ),
                    ),
                  ),
          )),
    );
  }

  Widget _buildForgetPasswordEmailVerification() {
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
    super.dispose();
  }
}
