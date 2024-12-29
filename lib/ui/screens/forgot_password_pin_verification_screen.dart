import 'package:batch8_taskmanager_project/ui/screens/reset_password_screen.dart';
import 'package:batch8_taskmanager_project/ui/screens/sign_in_screen.dart';
import 'package:batch8_taskmanager_project/ui/widgets/screen_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordPINlVerificationScreen extends StatefulWidget {
  const ForgotPasswordPINlVerificationScreen({super.key});

  static const String name = '/forgot-password-pin-verification-screen';

  @override
  State<ForgotPasswordPINlVerificationScreen> createState() =>
      _ForgotPasswordPINlVerificationScreenState();
}

class _ForgotPasswordPINlVerificationScreenState
    extends State<ForgotPasswordPINlVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pincodeTEController = TextEditingController();

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
                  "PIN Verification",
                  style: textStyle.titleLarge,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Please enter 6 digit pin sent to your email address to reset your password",
                  style: textStyle.titleMedium,
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  obscureText: false,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    selectedColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: _pincodeTEController,
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, ResetPasswordScreen.name, (_) => false);
                    }, child: const Icon(Icons.double_arrow)),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn't receive the OTP?"),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                          left: 4,
                        ),
                        foregroundColor: Colors.green,
                      ),
                      child: const Text(
                        "Resend OTP",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildForgetPasswordPINVerification()
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildForgetPasswordPINVerification() {
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
    _pincodeTEController.dispose();
    super.dispose();
  }
}
