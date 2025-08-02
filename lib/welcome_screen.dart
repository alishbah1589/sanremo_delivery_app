import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/components.dart';
import 'package:sanremo_food_delivery/login_screen.dart';

import 'package:sanremo_food_delivery/sign_up_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 125,
                backgroundImage: AssetImage(
                    'assets/images/panda.webp'),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome to Sanremo',
                style: TextStyle(
                  fontSize: 26,
                  color: Color.fromARGB(255, 179, 9, 122),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                child: roundedButton(
                  text: 'Log in',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 200,
                child: roundedButton(
                  text: 'Sign up',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
