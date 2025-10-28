import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/session_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  bool loading = false;

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  Future<void> _doLogin() async {
    // Validasi ringan (opsional — boleh dihapus agar makin polos)
    if (emailC.text.trim().isEmpty || passC.text.isEmpty) {
      Get.snackbar('Validasi', 'Email dan password wajib diisi',
          snackPosition: SnackPosition.TOP);
      return;
    }

    setState(() => loading = true);
    final ok = await session.login(emailC.text, passC.text);
    setState(() => loading = false);

    if (ok) {
      Get.snackbar('Berhasil', 'Login sukses', snackPosition: SnackPosition.TOP);
      Get.to(() => HomePage()); // hanya Get.to()
    } else {
      Get.snackbar('Gagal', 'Email atau password salah',
          snackPosition: SnackPosition.TOP);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login (Simple)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Email'),
            const SizedBox(height: 6),
            TextField(
              controller: emailC,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'nama@email.com',
              ),
            ),
            const SizedBox(height: 12),
            const Text('Password'),
            const SizedBox(height: 6),
            TextField(
              controller: passC,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '••••••••',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: loading ? null : _doLogin,
                child: loading
                    ? const SizedBox(
                        height: 18, width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Masuk'),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Catatan: Jika belum ada user, login pertama otomatis membuat akun dari email & password yang Anda isi.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
