import 'package:flutter/material.dart';
import 'package:shared_preference_login/view/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/user.png'),
            const SizedBox(height: 20),
            TextField(
              // controller: nameController,
              decoration: InputDecoration(
                  hintText: 'name',
                  label: const Text('name'),
                  border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15)
                  )
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              // controller: nameController,
              decoration: InputDecoration(
                  hintText: 'name',
                  label: const Text('password'),
                  border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15)
                  )
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
              ),
              onPressed: () async {
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashScreenState.KEYLOGIN, true);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
