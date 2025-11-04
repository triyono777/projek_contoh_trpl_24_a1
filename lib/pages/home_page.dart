import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/session_service.dart';
import 'login_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _iconList = const [
    Icons.home_rounded,
    Icons.person_rounded,
    Icons.login_rounded,
  ];

  int _bottomNavIndex = 0;

  Future<void> _openProfile() {
    return Get.to(() => const ProfilePage());
  }

  Future<void> _logout() async {
    await session.logout();
    Get.snackbar('Logout', 'Anda telah keluar',
        snackPosition: SnackPosition.TOP);
    Get.offAll(() => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    final u = session.user ?? {};
    final name = (u['name'] ?? 'Pengguna').toString();
    const titles = ['Home', 'Profil', 'Login'];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_bottomNavIndex]),
        actions: [
          if (_bottomNavIndex == 0)
            IconButton(
              tooltip: 'Profil',
              icon: const Icon(Icons.person),
              onPressed: () async {
                await _openProfile();
              },
            ),
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _logout();
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: [
          _HomeTab(name: name),
          _ProfileTab(
            userData: u,
            onEditProfile: _openProfile,
          ),
          _LoginShortcutTab(
            onGoToLogin: _logout,
          ),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        activeColor: Theme.of(context).colorScheme.primary,
        inactiveColor: Theme.of(context).disabledColor,
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  final String name;

  const _HomeTab({required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Halo, $name!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          const Text(
            'Selamat datang di halaman utama aplikasi.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  final Map<String, dynamic> userData;
  final Future<void> Function() onEditProfile;

  const _ProfileTab({
    required this.userData,
    required this.onEditProfile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final email = (userData['email'] ?? '-').toString();
    final name = (userData['name'] ?? '-').toString();
    final bio = (userData['bio'] ?? '-').toString();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(name),
              subtitle: Text(email),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              title: const Text('Bio'),
              subtitle: Text(
                bio.isEmpty ? 'Belum ada bio' : bio,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () async {
              await onEditProfile();
            },
            icon: const Icon(Icons.edit),
            label: const Text('Ubah Profil Lengkap'),
          ),
        ],
      ),
    );
  }
}

class _LoginShortcutTab extends StatelessWidget {
  final Future<void> Function() onGoToLogin;

  const _LoginShortcutTab({
    required this.onGoToLogin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.login,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          const Text(
            'Gunakan tombol di bawah jika Anda ingin kembali ke halaman login.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await onGoToLogin();
            },
            child: const Text('Pergi ke Login'),
          ),
        ],
      ),
    );
  }
}
