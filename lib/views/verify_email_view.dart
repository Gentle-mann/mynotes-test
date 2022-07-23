import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text("Check your inbox. We've sent you an email Verification."),
        const Text("If you haven't received a verification email yet, press the button below."),
        TextButton(
          onPressed: () async {
          await AuthService.firebase().sendEmailVerification();
        },
          child: const Text('Send email verification'),
        ),
          TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    registerRoute,
                        (route) => false,
                );
              },
              child: const Text('Restart')
          )
      ],
      ),
    );
  }
}
