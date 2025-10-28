import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/session_service.dart';
import 'login_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final u = session.user ?? {};
    final name = (u['name'] ?? 'Pengguna').toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            tooltip: 'Profil',
            icon: const Icon(Icons.person),
            onPressed: () {
              Get.to(() => const ProfilePage()); // hanya Get.to()
            },
          ),
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await session.logout();
              Get.snackbar('Logout', 'Anda telah keluar',
                  snackPosition: SnackPosition.TOP);
              // Supersimpel: dorong ke Login (untuk produksi bisa Get.offAll)
              Get.to(() => const LoginPage());
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Halo, $name!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
