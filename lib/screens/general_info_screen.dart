import 'package:flutter/material.dart';
import '../models/user_data.dart';

class GeneralInfoScreen extends StatelessWidget {
  final UserData userData;

  const GeneralInfoScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF3E8FF),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF8B5CF6),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'Общая информация',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8B5CF6),
                        ),
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
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.school,
                            size: 48,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Что мы предоставляем студентам',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      _BenefitCard(
                        icon: Icons.checkroom,
                        title: 'Форменное обмундирование',
                        description:
                            'Полный комплект форменной одежды для учебы и практических занятий предоставляется бесплатно',
                        color: const Color(0xFF8B5CF6),
                      ),

                      const SizedBox(height: 16),

                      _BenefitCard(
                        icon: Icons.restaurant,
                        title: 'Питание',
                        description:
                            'Трехразовое питание в столовой колледжа. Сбалансированное меню с учетом потребностей активных студентов',
                        color: const Color(0xFF8B5CF6),
                      ),

                      const SizedBox(height: 16),

                      _BenefitCard(
                        icon: Icons.hotel,
                        title: 'Проживание',
                        description:
                            'Общежитие для иногородних студентов. Комфортные условия проживания с необходимой инфраструктурой',
                        color: const Color(0xFF8B5CF6),
                      ),

                      const SizedBox(height: 16),

                      _BenefitCard(
                        icon: Icons.work,
                        title: 'Трудоустройство',
                        description:
                            'Гарантированное трудоустройство на объектах города Москвы после окончания обучения',
                        color: const Color(0xFF8B5CF6),
                      ),

                      const SizedBox(height: 16),

                      _BenefitCard(
                        icon: Icons.fitness_center,
                        title: 'Физическая подготовка',
                        description:
                            'Современный спортивный комплекс. Профессиональные тренажеры и площадки для подготовки',
                        color: const Color(0xFF8B5CF6),
                      ),

                      const SizedBox(height: 16),

                      _BenefitCard(
                        icon: Icons.medical_services,
                        title: 'Медицинское обслуживание',
                        description:
                            'Медицинский кабинет на территории колледжа. Регулярные медосмотры и контроль здоровья',
                        color: const Color(0xFF8B5CF6),
                      ),

                      const SizedBox(height: 16),

                      _BenefitCard(
                        icon: Icons.card_giftcard,
                        title: 'Стипендия',
                        description:
                            'Стипендиальная поддержка студентов. Повышенная стипендия за отличную учебу',
                        color: const Color(0xFF8B5CF6),
                      ),

                      const SizedBox(height: 32),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B5CF6).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF8B5CF6).withOpacity(0.3),
                          ),
                        ),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Color(0xFF8B5CF6),
                              size: 32,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Все условия обучения соответствуют современным стандартам образования и требованиям МЧС России',
                              style: TextStyle(fontSize: 14, height: 1.5),
                              textAlign: TextAlign.center,
                            ),
                          ],
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

class _BenefitCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _BenefitCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
