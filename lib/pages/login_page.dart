import 'package:flutter/material.dart';
import 'package:gemeni_food_diary/services/auth_service.dart'; // Импорт AuthService

import 'work_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isRegistration = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authService = AuthService(); // Создание экземпляра AuthService

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  fastAuth() {
    if (_authService.currentUser != null) {
      // Если пользователь авторизован, переходим на WorkPage
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const WorkPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // fastAuth();
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!_isRegistration) const SizedBox(height: 60),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'e-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите email';
                      }
                      if (!value.contains('@')) {
                        return 'Некорректный email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Пароль',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите пароль';
                      }
                      if (value.length < 6) {
                        return 'Пароль должен быть не менее 6 символов';
                      }
                      return null;
                    },
                  ),
                  if (_isRegistration) const SizedBox(height: 20),
                  if (_isRegistration)
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Повтор пароля',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, повторите пароль';
                        }
                        if (value != _passwordController.text) {
                          return 'Пароли не совпадают';
                        }
                        return null;
                      },
                    ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Проверка валидации прошла успешно
                        if (_isRegistration) {
                          // Регистрация
                          try {
                            final user =
                                await _authService.registerWithEmailAndPassword(
                                    _emailController.text,
                                    _passwordController.text);
                            if (user.user?.emailVerified ?? false) {
                              // Переход на WorkPage после успешной регистрации
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const WorkPage()));
                            }
                          } catch (e) {
                            // Обработка ошибок регистрации
                            print('Ошибка регистрации: $e');
                            // Отображение сообщения об ошибке пользователю
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Ошибка регистрации')),
                            );
                          }
                        } else {
                          // Вход
                          try {
                            await _authService.signInWithEmailAndPassword(
                                _emailController.text,
                                _passwordController.text);
                            // Переход на WorkPage после успешного входа
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const WorkPage()));
                          } catch (e) {
                            // Обработка ошибок входа
                            print('Ошибка входа: $e');
                            // Отображение сообщения об ошибке пользователю
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Ошибка входа')),
                            );
                          }
                        }
                      }
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
      ),
    );
  }
}
