import 'package:flutter/material.dart';

class MedicalScreen extends StatelessWidget {
  const MedicalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== HEADER =====
                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF6B6B6B),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Mitch Koko",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D2D2D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE7D9FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Color(0xFF7E57C2),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // ===== FEELING CARD =====
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7B7D2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.18,
                          height: width * 0.18,
                          constraints: const BoxConstraints(
                            minWidth: 64,
                            minHeight: 64,
                            maxWidth: 90,
                            maxHeight: 90,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFB39DDB),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "How do you feel?",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4A3B5C),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Fill out your medical card\nright now",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF5E4F72),
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: _StartButton(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // ===== SEARCH BAR =====
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE2FF),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Color(0xFF8B7AA8)),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "How can we help you?",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF8B7AA8),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // ===== CATEGORIES =====
                  Row(
                    children: const [
                      Expanded(
                        child: CategoryCard(
                          icon: Icons.medical_services_outlined,
                          title: "Dentist",
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: CategoryCard(
                          icon: Icons.person_outline,
                          title: "Surgeon",
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: CategoryCard(
                          icon: Icons.local_hospital_outlined,
                          title: "Pharmacist",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 26),

                  // ===== DOCTOR LIST HEADER =====
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Doctor list",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D2D2D),
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8B7AA8),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // ===== DOCTOR CARDS =====
                  Row(
                    children: const [
                      Expanded(
                        child: DoctorCard(
                          name: "Dr. Mitch Koko",
                          specialty: "Psychologist",
                          experience: "7 y.e.",
                          rating: "4.4",
                          avatarColor: Color(0xFFF48FB1),
                          avatarIcon: Icons.person,
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: DoctorCard(
                          name: "Dr. Steve Jobs",
                          specialty: "Surgeon",
                          experience: "7 y.e.",
                          rating: "5.0",
                          avatarColor: Color(0xFFCE93D8),
                          avatarIcon: Icons.person_outline,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ===== NÚT GET STARTED =====
class _StartButton extends StatelessWidget {
  const _StartButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF8E6CEB),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Center(
        child: Text(
          "Get Started",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

// ===== CATEGORY CARD =====
class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE2FF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF7E57C2), size: 28),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5E4F72),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// ===== DOCTOR CARD =====
class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String experience;
  final String rating;
  final Color avatarColor;
  final IconData avatarIcon;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.rating,
    required this.avatarColor,
    required this.avatarIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE2FF),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar
          Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: avatarColor,
              ),
              child: Icon(
                avatarIcon,
                color: Colors.white,
                size: 38,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // rating
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),
              const SizedBox(width: 4),
              Text(
                rating,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A3B5C),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2D2D),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 6),

          Text(
            "$specialty $experience",
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF6B6B6B),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}