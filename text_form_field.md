# Materi Praktik: TextFormField di Flutter

## Tujuan Pembelajaran
- Memahami perbedaan `TextField` dan `TextFormField`.
- Mengelola validasi input menggunakan `Form` serta `GlobalKey<FormState>`.
- Menangani penyimpanan dan pengambilan nilai dari controller.
- Menerapkan skenario login sederhana dengan validasi.

## Konsep Dasar
1. **TextField vs TextFormField**
   - `TextField`: widget input dasar, cocok untuk kasus tanpa validasi kompleks.
   - `TextFormField`: bagian dari sistem `Form`, memiliki properti `validator`, `onSaved`, dan menyatu dengan `FormState`.
2. **Form dan FormState**
   - Bungkus kumpulan `TextFormField` menggunakan widget `Form`.
   - Gunakan `GlobalKey<FormState>` untuk mengakses metode `validate()` dan `save()`.
3. **TextEditingController**
   - Memudahkan kontrol dan observasi nilai input.
   - Pastikan `dispose()` controller ketika tidak lagi digunakan.

## Rangkaian Praktik
1. **Siapkan Controller & GlobalKey**
   ```dart
   final _formKey = GlobalKey<FormState>();
   final _emailC = TextEditingController();
   final _passwordC = TextEditingController();
   ```

2. **Bangun Struktur Form**
   ```dart
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text('Form Login')),
       body: Padding(
         padding: const EdgeInsets.all(16),
         child: Form(
           key: _formKey,
           child: Column(
             children: [
               TextFormField(
                 controller: _emailC,
                 decoration: const InputDecoration(
                   labelText: 'Email',
                   border: OutlineInputBorder(),
                 ),
                 keyboardType: TextInputType.emailAddress,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Email wajib diisi';
                   }
                   if (!value.contains('@')) {
                     return 'Format email tidak valid';
                   }
                   return null;
                 },
               ),
               const SizedBox(height: 16),
               TextFormField(
                 controller: _passwordC,
                 decoration: const InputDecoration(
                   labelText: 'Password',
                   border: OutlineInputBorder(),
                 ),
                 obscureText: true,
                 validator: (value) {
                   if (value == null || value.length < 6) {
                     return 'Minimal 6 karakter';
                   }
                   return null;
                 },
               ),
               const SizedBox(height: 24),
               ElevatedButton(
                 onPressed: _submit,
                 child: const Text('Login'),
               ),
             ],
           ),
         ),
       ),
     );
   }
   ```

3. **Fungsi Submit**
   ```dart
   void _submit() {
     if (_formKey.currentState!.validate()) {
       Get.snackbar('Sukses', 'Form valid, lanjutkan proses login');
       // TODO: lanjutkan ke service login / navigasi
     }
   }
   ```

4. **Menutup Controller**
   ```dart
   @override
   void dispose() {
     _emailC.dispose();
     _passwordC.dispose();
     super.dispose();
   }
   ```

## Tantangan Lanjutan
1. Tambahkan validasi `TextFormField` untuk konfirmasi password.
2. Buat field nomor telepon dengan `inputFormatters` agar hanya menerima digit.
3. Manfaatkan `autovalidateMode` untuk menampilkan error secara real-time.
4. Simpan data form ke model menggunakan `onSaved` lalu cetak di console.
5. Gunakan `FocusNode` agar tombol "Next" pada keyboard memindahkan fokus antar field.

## Referensi
- Dokumentasi `TextFormField`: https://api.flutter.dev/flutter/material/TextFormField-class.html
- Panduan Form di Flutter: https://docs.flutter.dev/cookbook/forms/validation
