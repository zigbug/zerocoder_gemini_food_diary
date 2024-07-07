import 'package:flutter/material.dart';

import 'work_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isRegistration = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: _isRegistration
                  ? [theme.colorScheme.primary, theme.colorScheme.secondary]
                  : [theme.colorScheme.secondary, theme.colorScheme.primary],
              stops: const [0.3, 0.9],
              tileMode: TileMode.repeated),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_isRegistration) const SizedBox(height: 60),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'e-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                if (_isRegistration) const SizedBox(height: 20),
                if (_isRegistration)
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Повтор пароля',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: Text(
                    _isRegistration ? 'Зарегистрироваться' : 'Войти',
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isRegistration = !_isRegistration;
                    });
                  },
                  child: !_isRegistration
                      ? const Text('У меня ещё нет аккаунта...')
                      : const Text('У меня уже есть аккаунт...'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
