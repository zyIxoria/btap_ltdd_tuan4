import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
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
                children: [
                  // ===== TOP BAR =====
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _softButton(Icons.arrow_back_ios_new, iconSize: 18),
                      const Text(
                        "PLAYLIST",
                        style: TextStyle(
                          letterSpacing: 3,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7A7A7A),
                        ),
                      ),
                      _softButton(Icons.menu, iconSize: 20),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ===== MUSIC CARD =====
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.9),
                          offset: const Offset(-4, -4),
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          offset: const Offset(4, 4),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // fake album cover
                        Container(
                          width: double.infinity,
                          height: width * 0.7,
                          constraints: const BoxConstraints(
                            minHeight: 180,
                            maxHeight: 320,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFF26B5E),
                                Color(0xFFF48B6A),
                                Color(0xFFE95A7B),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              // simple decorative palms
                              Positioned(
                                top: 12,
                                left: 14,
                                child: Icon(
                                  Icons.park,
                                  color: Colors.black.withOpacity(0.35),
                                  size: 42,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 16,
                                child: Icon(
                                  Icons.park,
                                  color: Colors.black.withOpacity(0.35),
                                  size: 42,
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                right: 20,
                                child: Container(
                                  height: 58,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.18),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  "To See A Dream",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // song info
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kota The Friend",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF7B7B7B),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Birdie",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2D2D2D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 28,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 26),

                  // ===== TIME + SMALL CONTROLS =====
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "0:00",
                        style: TextStyle(
                          color: Color(0xFF7A7A7A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.shuffle, color: Color(0xFF6D6D6D), size: 22),
                          SizedBox(width: 20),
                          Icon(Icons.repeat, color: Color(0xFF6D6D6D), size: 22),
                        ],
                      ),
                      Text(
                        "4:22",
                        style: TextStyle(
                          color: Color(0xFF7A7A7A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ===== PROGRESS BAR =====
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.9),
                          offset: const Offset(-4, -4),
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          offset: const Offset(4, 4),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: 0.78,
                        minHeight: 8,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF38C172),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 26),

                  // ===== BIG PLAYER BUTTONS =====
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _playerButton(
                          icon: Icons.skip_previous,
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        flex: 2,
                        child: _playerButton(
                          icon: Icons.play_arrow,
                          size: 40,
                          isMain: true,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: _playerButton(
                          icon: Icons.skip_next,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _softButton(IconData icon, {double iconSize = 20}) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            offset: const Offset(-4, -4),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(4, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Icon(icon, color: const Color(0xFF4B4B4B), size: iconSize),
    );
  }

  Widget _playerButton({
    required IconData icon,
    required double size,
    bool isMain = false,
  }) {
    return Container(
      height: isMain ? 78 : 70,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            offset: const Offset(-4, -4),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(4, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Icon(icon, size: size, color: const Color(0xFF2F2F2F)),
    );
  }
}