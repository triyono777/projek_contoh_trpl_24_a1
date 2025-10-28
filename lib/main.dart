import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'services/session_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // WAJIB: init storage sebelum dipakai
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Tentukan halaman awal berdasarkan session
    final startPage = session.isLoggedIn ? const HomePage() : const LoginPage();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetStorage + Get (Simple)',
      home: startPage, // tanpa GetPage/named routes
    );
  }
}
