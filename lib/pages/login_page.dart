
import 'package:flutter/material.dart';
import 'package:gemeni_food_diary/pages/home_page.dart';
// import 'package:gemeni_food_diary/auth_service.dart';
// import 'package:gemeni_food_diary/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                     Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHomePage(
                              title: 'Gemeni Food Diary',
                            ),
                          ),);
                    // AuthService.signInWithEmailAndPassword(
                    //     _emailController.text, _passwordController.text)
                    //     .then((user) {
                    //   if (user != null) {
                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const HomePage(),
                    //       ),
                    //     );
                    //   }
                    // });
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // ```


// // We generate the following patches:
// // File: /Users/zigbug/zero_coder/gemeni_food_diary/lib/login_page.dart
// // ```
// // --- a/Users/zigbug/zero_coder/gemeni_food_diary/lib/login_page.dart
// // +++ b/Users/zigbug/zero_coder/gemeni_food_diary/lib/login_page.dart
// // @@ -1,6 +1,7 @@
//  import 'package:flutter/material.dart';
//  import 'package:gemeni_food_diary/auth_service.dart';
//  import 'package:gemeni_food_diary/home_page.dart';
// +import 'package:gemeni_food_diary/signup_page.dart';
 
//  class LoginPage extends StatefulWidget {
//    const LoginPage({Key? key}) : super(key: key);
// @@ -83,6 +84,17 @@
//                  },
//                  child: const Text('Login'),
//                ),
// +              const SizedBox(height: 16.0),
// +              TextButton(
// +                onPressed: () {
// +                  Navigator.push(
// +                    context,
// +                    MaterialPageRoute(
// +                      builder: (context) => const SignupPage(),
// +                    ),
// +                  );
// +                },
// +                child: const Text('Don\'t have an account? Sign up'),
//              ],
//            ),
//          ),
