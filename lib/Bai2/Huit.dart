import 'package:flutter/material.dart';

class FacilityScreen extends StatefulWidget {
  const FacilityScreen({super.key});

  @override
  State<FacilityScreen> createState() => _FacilityScreenState();
}

class _FacilityScreenState extends State<FacilityScreen> {
  int currentIndex = 0;

  final List<String> titles = [
    "Trang chủ",
    "Cơ sở vật chất",
    "Thư viện",
    "Liên hệ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD6E5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          titles[currentIndex],
          style: const TextStyle(
            color: Color(0xFFAD1457),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFAD1457)),
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            switch (currentIndex) {
              case 0:
                return _buildHomePage(constraints);
              case 1:
                return _buildFacilityPage(constraints);
              case 2:
                return _buildLibraryPage(constraints);
              case 3:
                return _buildContactPage(constraints);
              default:
                return _buildHomePage(constraints);
            }
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFE91E63),
        unselectedItemColor: Colors.pink[200],
        selectedFontSize: 12,
        unselectedFontSize: 11,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment_rounded),
            label: "Cơ sở",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_rounded),
            label: "Thư viện",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone_rounded),
            label: "Liên hệ",
          ),
        ],
      ),
    );
  }

  // ================= TRANG CHỦ =================
  Widget _buildHomePage(BoxConstraints constraints) {
    double width = constraints.maxWidth;

    return SingleChildScrollView(
      padding: EdgeInsets.all(width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBannerCard(
            title: "ĐẠI HỌC CÔNG THƯƠNG TP.HCM",
            subtitle: "Giới thiệu cơ sở vật chất hiện đại, tiện nghi và thân thiện",
            icon: Icons.school_rounded,
          ),
          const SizedBox(height: 16),

          _buildSectionTitle("Thông tin nổi bật"),
          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.location_city,
            title: "Khuôn viên rộng rãi",
            subtitle: "Không gian học tập thoáng mát, nhiều khu chức năng.",
          ),
          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.computer_rounded,
            title: "Phòng máy hiện đại",
            subtitle: "Trang bị máy tính phục vụ học tập và thực hành.",
          ),
          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.menu_book_rounded,
            title: "Thư viện tiện nghi",
            subtitle: "Nhiều đầu sách, khu tự học yên tĩnh và hiện đại.",
          ),
          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.sports_basketball_rounded,
            title: "Khu thể thao",
            subtitle: "Hỗ trợ rèn luyện thể chất và hoạt động ngoại khóa.",
          ),
        ],
      ),
    );
  }

  // ================= CƠ SỞ VẬT CHẤT =================
  Widget _buildFacilityPage(BoxConstraints constraints) {
    double width = constraints.maxWidth;

    return SingleChildScrollView(
      padding: EdgeInsets.all(width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Các khu vực nổi bật"),
          const SizedBox(height: 12),

          _buildFacilityCard(
            icon: Icons.meeting_room_rounded,
            title: "Phòng học lý thuyết",
            subtitle: "Không gian rộng rãi, đầy đủ bàn ghế, máy chiếu và điều hòa.",
          ),
          const SizedBox(height: 12),

          _buildFacilityCard(
            icon: Icons.computer_rounded,
            title: "Phòng thực hành máy tính",
            subtitle: "Phục vụ các môn lập trình, thiết kế và công nghệ thông tin.",
          ),
          const SizedBox(height: 12),

          _buildFacilityCard(
            icon: Icons.science_rounded,
            title: "Phòng thí nghiệm",
            subtitle: "Trang bị thiết bị phục vụ thực hành chuyên ngành.",
          ),
          const SizedBox(height: 12),

          _buildFacilityCard(
            icon: Icons.restaurant_rounded,
            title: "Căn tin sinh viên",
            subtitle: "Khu ăn uống sạch sẽ, tiện lợi với nhiều món ăn.",
          ),
          const SizedBox(height: 12),

          _buildFacilityCard(
            icon: Icons.park_rounded,
            title: "Sân sinh hoạt chung",
            subtitle: "Không gian tổ chức sự kiện, giao lưu và hoạt động ngoại khóa.",
          ),
        ],
      ),
    );
  }

  // ================= THƯ VIỆN =================
  Widget _buildLibraryPage(BoxConstraints constraints) {
    double width = constraints.maxWidth;

    return SingleChildScrollView(
      padding: EdgeInsets.all(width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBannerCard(
            title: "THƯ VIỆN TRƯỜNG",
            subtitle: "Không gian học tập, nghiên cứu và tự học cho sinh viên",
            icon: Icons.local_library_rounded,
          ),
          const SizedBox(height: 16),

          _buildSectionTitle("Tiện ích thư viện"),
          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.book_rounded,
            title: "Nhiều đầu sách",
            subtitle: "Giáo trình, sách tham khảo và tài liệu học tập đa dạng.",
          ),
          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.chair_alt_rounded,
            title: "Khu tự học",
            subtitle: "Bàn học rộng rãi, yên tĩnh, phù hợp học nhóm hoặc cá nhân.",
          ),
          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.wifi_rounded,
            title: "Wi-Fi miễn phí",
            subtitle: "Hỗ trợ truy cập tài liệu trực tuyến và học tập hiệu quả.",
          ),
          const SizedBox(height: 12),

          _buildInfoCard(
            icon: Icons.computer_rounded,
            title: "Tra cứu điện tử",
            subtitle: "Có khu vực máy tính tra cứu tài liệu nhanh chóng.",
          ),
        ],
      ),
    );
  }

  // ================= LIÊN HỆ =================
  Widget _buildContactPage(BoxConstraints constraints) {
    double width = constraints.maxWidth;

    return SingleChildScrollView(
      padding: EdgeInsets.all(width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Thông tin liên hệ"),
          const SizedBox(height: 12),

          _buildContactCard(
            icon: Icons.location_on_rounded,
            title: "Địa chỉ",
            subtitle: "140 Lê Trọng Tấn, Tây Thạnh, Tân Phú, TP.HCM",
          ),
          const SizedBox(height: 12),

          _buildContactCard(
            icon: Icons.phone_rounded,
            title: "Số điện thoại",
            subtitle: "(028) 3816 3319",
          ),
          const SizedBox(height: 12),

          _buildContactCard(
            icon: Icons.language_rounded,
            title: "Website",
            subtitle: "www.huit.edu.vn",
          ),
          const SizedBox(height: 20),

          _buildBannerCard(
            title: "Chào mừng bạn đến với HUIT 💗",
            subtitle: "Môi trường học tập hiện đại – năng động – sáng tạo",
            icon: Icons.favorite_rounded,
          ),
        ],
      ),
    );
  }

  // ================= WIDGET DÙNG CHUNG =================

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFFAD1457),
      ),
    );
  }

  Widget _buildBannerCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFD6E5),
            Color(0xFFFFEAF1),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: Icon(icon, color: const Color(0xFFE91E63), size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF880E4F),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.pink[700],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFFFD6E5)),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFFFEAF1),
            child: Icon(icon, color: const Color(0xFFE91E63)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF880E4F),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.pink[700],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFacilityCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBFC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFD6E5)),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD6E5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFFAD1457)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF880E4F),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.pink[700],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFFFFD6E5)),
      ),
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFFFEAF1),
        child: Icon(icon, color: const Color(0xFFE91E63)),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF880E4F),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.pink[700]),
      ),
    );
  }
}