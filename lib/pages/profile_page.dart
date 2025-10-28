import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/session_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameC = TextEditingController();
  final bioC = TextEditingController();

  @override
  void initState() {
    super.initState();
    final u = session.user ?? {};
    nameC.text = (u['name'] ?? '').toString();
    bioC.text = (u['bio'] ?? '').toString();
  }

  @override
  void dispose() {
    nameC.dispose();
    bioC.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    await session.updateProfile(name: nameC.text, bio: bioC.text);
    Get.snackbar('Tersimpan', 'Profil berhasil diperbarui',
        snackPosition: SnackPosition.TOP);
    Get.back(); // kembali ke Home
  }

  @override
  Widget build(BuildContext context) {
    final u = session.user ?? {};
    final email = (u['email'] ?? '-').toString();

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Email'),
            const SizedBox(height: 6),
            TextField(
              controller: TextEditingController(text: email),
              readOnly: true,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            const Text('Nama'),
            const SizedBox(height: 6),
            TextField(
              controller: nameC,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nama Anda',
              ),
            ),
            const SizedBox(height: 12),
            const Text('Bio'),
            const SizedBox(height: 6),
            TextField(
              controller: bioC,
              minLines: 2,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tuliskan bio singkat…',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: _save,
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
