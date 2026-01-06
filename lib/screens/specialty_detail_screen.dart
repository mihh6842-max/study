import 'package:flutter/material.dart';
import '../models/user_data.dart';
import 'documents_screen.dart';

class SpecialtyDetailScreen extends StatelessWidget {
  final UserData userData;
  final String specialty;

  const SpecialtyDetailScreen({
    super.key,
    required this.userData,
    required this.specialty,
  });

  Map<String, dynamic> _getSpecialtyInfo() {
    switch (specialty) {
      case 'Огнеборец':
        return {
          'title': 'Огнеборец',
          'fullName': 'Пожарная безопасность',
          'code': '20.02.04',
          'icon': Icons.local_fire_department,
          'colors': [Color(0xFFDC2626), Color(0xFFF97316)],
          'description':
              'Подготовка специалистов по обеспечению пожарной безопасности, тушению пожаров и проведению аварийно-спасательных работ.',
          'study': [
            'Тактика тушения пожаров',
            'Пожарная техника и оборудование',
            'Профилактика пожаров',
            'Организация службы и подготовки',
            'Первая помощь и медицинская подготовка',
          ],
          'work': [
            'Тушение пожаров различной сложности',
            'Проведение аварийно-спасательных работ',
            'Профилактические мероприятия',
            'Работа на пожарной технике',
            'Служба в пожарных частях Москвы',
          ],
        };
      case 'Спасатель':
        return {
          'title': 'Спасатель',
          'fullName': 'Защита в чрезвычайных ситуациях',
          'code': '20.02.02',
          'icon': Icons.emergency,
          'colors': [Color(0xFFF59E0B), Color(0xFFFBBF24)],
          'description':
              'Обучение специалистов по защите населения и территорий при чрезвычайных ситуациях природного и техногенного характера.',
          'study': [
            'Организация аварийно-спасательных работ',
            'Техника и оборудование для ЧС',
            'Тактика спасательных операций',
            'Медицинская подготовка',
            'Психологическая подготовка',
          ],
          'work': [
            'Ликвидация последствий ЧС',
            'Спасение людей из-под завалов',
            'Эвакуация населения',
            'Оказание первой помощи',
            'Работа в составе спасательных отрядов',
          ],
        };
      case 'Служба 112':
        return {
          'title': 'Служба 112',
          'fullName': 'Диспетчер оперативного реагирования',
          'code': '20.02.05',
          'icon': Icons.headset_mic,
          'colors': [Color(0xFF0EA5E9), Color(0xFF06B6D4)],
          'description':
              'Подготовка диспетчеров для работы в системе-112, принимающих экстренные вызовы и координирующих действия оперативных служб.',
          'study': [
            'Организация оперативного реагирования',
            'Работа с системой 112',
            'Психология экстремальных ситуаций',
            'Координация экстренных служб',
            'Информационные технологии',
          ],
          'work': [
            'Прием экстренных вызовов',
            'Координация служб реагирования',
            'Диспетчерское сопровождение',
            'Работа в едином call-центре 112',
            'Оперативное принятие решений',
          ],
        };
      default:
        return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final info = _getSpecialtyInfo();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              (info['colors'] as List<Color>)[0].withOpacity(0.1),
              (info['colors'] as List<Color>)[1].withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Заголовок с кнопкой назад
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: (info['colors'] as List<Color>)[0],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            info['title'],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: (info['colors'] as List<Color>)[0],
                            ),
                          ),
                          Text(
                            info['code'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Иконка специальности
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: info['colors'] as List<Color>,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: (info['colors'] as List<Color>)[0]
                                    .withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Icon(
                            info['icon'] as IconData,
                            size: 64,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Полное название
                      Text(
                        info['fullName'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 16),

                      // Описание
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          info['description'],
                          style: const TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Что изучают
                      const Text(
                        'Что вы будете изучать:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...(info['study'] as List<String>).map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: (info['colors'] as List<Color>)[0],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Чем предстоит заниматься
                      const Text(
                        'Чем предстоит заниматься:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...(info['work'] as List<String>).map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: (info['colors'] as List<Color>)[1],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Кнопка продолжить
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DocumentsScreen(userData: userData),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: (info['colors'] as List<Color>)[0],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Продолжить',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
