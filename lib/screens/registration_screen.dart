import 'package:flutter/material.dart';
import '../models/user_data.dart';
import 'specialty_selection_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final UserData _userData = UserData();

  final List<String> _territories = ['Москва', 'Московская область'];

  @override
  void initState() {
    super.initState();
    _userData.territory = _territories[0];
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (!_userData.agreedToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Необходимо согласие на обработку персональных данных'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SpecialtySelectionScreen(userData: _userData),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF5F0),
              Color(0xFFFFE8DC),
              Color(0xFFFFD4C0),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),

                  // Баннер "Здесь учатся герои"
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/banner.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFDC2626), Color(0xFFF97316)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Text(
                              'ЗДЕСЬ УЧАТСЯ ГЕРОИ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  // ФИО
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ФИО',
                      hintText: 'Иванов Иван Иванович',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите ФИО';
                      }
                      return null;
                    },
                    onSaved: (value) => _userData.fullName = value ?? '',
                  ),

                  const SizedBox(height: 16),

                  // Территория
                  DropdownButtonFormField<String>(
                    value: _userData.territory,
                    decoration: InputDecoration(
                      labelText: 'Территория',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                    items: _territories.map((String territory) {
                      return DropdownMenuItem<String>(
                        value: territory,
                        child: Text(territory),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _userData.territory = newValue ?? _territories[0];
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Телефон
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Мобильный телефон',
                      hintText: '+7 (___) ___-__-__',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите номер телефона';
                      }
                      return null;
                    },
                    onSaved: (value) => _userData.phone = value ?? '',
                  ),

                  const SizedBox(height: 16),

                  // Email
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'example@mail.ru',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите email';
                      }
                      if (!value.contains('@')) {
                        return 'Введите корректный email';
                      }
                      return null;
                    },
                    onSaved: (value) => _userData.email = value ?? '',
                  ),

                  const SizedBox(height: 24),

                  // Согласие на обработку
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _userData.agreedToTerms
                            ? const Color(0xFF059669)
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: CheckboxListTile(
                      value: _userData.agreedToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _userData.agreedToTerms = value ?? false;
                        });
                      },
                      title: const Text(
                        'Я согласен на обработку персональных данных',
                        style: TextStyle(fontSize: 14),
                      ),
                      subtitle: const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Даю согласие на использование мобильного телефона и email для ведения переписки и уведомлений',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Кнопка продолжить
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDC2626),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Продолжить',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
