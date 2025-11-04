# Materi Praktik: Navigasi di Flutter

## Tujuan Pembelajaran
- Memahami konsep dasar navigasi di Flutter (push, pop, dan named route).
- Menggunakan paket `get` untuk menyederhanakan navigasi dan manajemen state ringan.
- Membangun skenario navigasi terintegrasi: login → home → profil, termasuk bottom navigation.

## Prasyarat
- Flutter SDK telah terinstal dan tersambung ke device/emulator.
- Dependency `get` dan `animated_bottom_navigation_bar` sudah ditambahkan ke `pubspec.yaml`.
- Struktur halaman minimal: `LoginPage`, `HomePage`, `ProfilePage`.

## Rangkaian Praktik
1. **Konfigurasi Awal Route**
   ```dart
   void main() {
     runApp(const MyApp());
   }
   
   class MyApp extends StatelessWidget {
     const MyApp({super.key});
   
     @override
     Widget build(BuildContext context) {
       return GetMaterialApp(
         title: 'Demo Navigasi',
         debugShowCheckedModeBanner: false,
         home: const LoginPage(),
       );
     }
   }
   ```
   Gunakan `GetMaterialApp` agar seluruh fitur `Get` tersedia di aplikasi.

2. **Navigasi Dasar (Push/Pop)**
   - Dari `LoginPage`, setelah validasi, arahkan pengguna ke `HomePage`:
     ```dart
     Get.off(() => const HomePage());
     ```
     `Get.off` menutup halaman saat ini dan membuka halaman tujuan.
   - Dari `HomePage`, tekan tombol profil untuk melihat data lengkap:
     ```dart
     Get.to(() => const ProfilePage());
     ```
     `Get.to` menambahkan halaman baru ke atas stack.
   - Di `ProfilePage`, gunakan `Get.back()` untuk kembali ke `HomePage`.

3. **Mengirim Data Antar Halaman**
   Misal, kirim email pengguna dari Login ke Home:
   ```dart
   Get.off(() => const HomePage(), arguments: {'email': emailC.text});
   ```
   Ambil data di `HomePage`:
   ```dart
   final email = (Get.arguments?['email'] ?? '-') as String;
   ```

4. **Menerapkan Bottom Navigation Terintegrasi**
   - Sediakan daftar ikon & indeks aktif di `HomePage`.
   - Gunakan `IndexedStack` agar setiap tab menyimpan state-nya.
   - Contoh alur tab:
     | Tab | Konten | Aksi |
     | --- | --- | --- |
     | Home | Sapaan + informasi singkat pengguna. | Tombol ke profil. |
     | Profil | Ringkasan data akun + tombol edit profil penuh. | `Get.to(ProfilePage)` |
     | Login | Shortcut kembali ke halaman login. | `Get.offAll(LoginPage)` |
   - Manfaatkan `AnimatedBottomNavigationBar` untuk transisi smoother.

5. **Logout & Reset Stack**
   Untuk memastikan pengguna tidak bisa kembali ke halaman sebelumnya setelah logout:
   ```dart
   await session.logout();
   Get.offAll(() => const LoginPage());
   ```

## Tantangan Lanjutan
1. Buat route bernama dengan `Get.toNamed`, `Get.offNamed`, dan `GetPage` untuk konfigurasi terpusat.
2. Tambahkan middlewares (mis. auth guard) menggunakan `GetMiddleware`.
3. Integrasikan deep link sederhana: buka `ProfilePage` langsung dari notifikasi.
4. Simpan riwayat navigasi dengan `GetObserver` untuk kebutuhan analitik.
5. Buat versi simple menggunakan navigator bawaan (`Navigator.push`) kemudian bandingkan jumlah kode dan kompleksitas dengan `Get`.

## Referensi
- Dokumentasi navigasi Flutter: https://docs.flutter.dev/ui/widgets/navigation
- Paket GetX: https://pub.dev/packages/get
- Animated Bottom Navigation Bar: https://pub.dev/packages/animated_bottom_navigation_bar
