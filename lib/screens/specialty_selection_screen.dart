import 'package:flutter/material.dart';
import '../models/user_data.dart';
import 'specialty_detail_screen.dart';
import 'general_info_screen.dart';

class SpecialtySelectionScreen extends StatelessWidget {
  final UserData userData;

  const SpecialtySelectionScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E3A8A),
              Color(0xFF3B82F6),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Эмблема колледжа
              ClipOval(
                child: Image.asset(
                  'assets/images/emblem.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E3A8A), Color(0xFF60A5FA)],
                        ),
                      ),
                      child: const Icon(Icons.shield, size: 50, color: Colors.white),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Привет, ${userData.fullName.split(' ').first}!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Выберите специальность',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 40),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Огнеборец
                      _SpecialtyButton(
                        title: 'Огнеборец',
                        subtitle: 'Пожарная безопасность',
                        icon: Icons.local_fire_department,
                        gradientColors: const [Color(0xFFDC2626), Color(0xFFF97316)],
                        onTap: () {
                          userData.selectedSpecialty = 'Огнеборец';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpecialtyDetailScreen(
                                userData: userData,
                                specialty: 'Огнеборец',
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // Спасатель
                      _SpecialtyButton(
                        title: 'Спасатель',
                        subtitle: 'Защита в чрезвычайных ситуациях',
                        icon: Icons.emergency,
                        gradientColors: const [Color(0xFFF59E0B), Color(0xFFFBBF24)],
                        onTap: () {
                          userData.selectedSpecialty = 'Спасатель';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpecialtyDetailScreen(
                                userData: userData,
                                specialty: 'Спасатель',
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // Диспетчер (Служба 112)
                      _SpecialtyButton(
                        title: 'Служба 112',
                        subtitle: 'Диспетчер оперативного реагирования',
                        icon: Icons.headset_mic,
                        gradientColors: const [Color(0xFF0EA5E9), Color(0xFF06B6D4)],
                        onTap: () {
                          userData.selectedSpecialty = 'Служба 112';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpecialtyDetailScreen(
                                userData: userData,
                                specialty: 'Служба 112',
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      // Общая информация
                      _SpecialtyButton(
                        title: 'Общая информация',
                        subtitle: 'Социальные блага и условия обучения',
                        icon: Icons.info_outline,
                        gradientColors: const [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GeneralInfoScreen(userData: userData),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpecialtyButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const _SpecialtyButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: gradientColors[0].withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white70),
            ],
          ),
        ),
      ),
    );
  }
}
