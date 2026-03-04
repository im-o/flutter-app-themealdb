# Meals Master 🍳

**Meals Master** adalah aplikasi katalog resep masakan modern yang dirancang untuk membantu pecinta kuliner mengeksplorasi cita rasa khas Nusantara dengan cara yang mudah, cepat, dan elegan.

[![Get it on Google Play](https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png)](https://play.google.com/store/apps/details?id=com.rivaldy.mealsmaster)

---

## ✨ Fitur Utama
- **Eksplorasi Resep Nusantara**: Temukan berbagai macam resep masakan Indonesia mulai dari Ayam, Daging, hingga Camilan.
- **Pencarian Cerdas**: Cari resep menggunakan teks dengan fitur *clear search* yang responsif.
- **Filter Kategori**: Filter resep berdasarkan kategori favorit Anda untuk navigasi yang lebih cepat.
- **Visual Premium**: Antarmuka pengguna (UI) yang modern dengan efek Glassmorphism dan animasi transisi yang mulus.
- **Splash Screen Animatif**: Sambutan awal yang elegan setiap kali Anda membuka aplikasi.
- **Progressive Image Loading**: Indikator loading yang detail saat mengunduh gambar resep.

---

## 🛠️ Teknologi & Library
Aplikasi ini dikembangkan menggunakan **Flutter** dengan arsitektur yang bersih dan library terkini:
- **State Management**: [Flutter Bloc](https://pub.dev/packages/flutter_bloc)
- **Networking**: [Dio](https://pub.dev/packages/dio) & [TheMealDB API](https://www.themealdb.com/api.php)
- **Dependency Injection**: [Get It](https://pub.dev/packages/get_it)
- **Image Caching**: [Cached Network Image](https://pub.dev/packages/cached_network_image)
- **UI Components**: [Google Fonts](https://pub.dev/packages/google_fonts), [Staggered Grid View](https://pub.dev/packages/flutter_staggered_grid_view)
- **Logging**: [Logger](https://pub.dev/packages/logger)

---

## 📱 Persyaratan Sistem
- **Platform**: Android 5.0 (API 21) ke atas
- **Kepatuhan Terbaru**:
  - Target **Android 15 (API 35)**
  - Mendukung **16 KB Memory Page Sizes**
  - Menggunakan Android Gradle Plugin (AGP) 8.5.1 & Kotlin 2.1.0

---

## 🚀 Cara Menjalankan Project

1. **Clone Repository**:
   ```bash
   git clone https://github.com/username/flutter-app-themealdb.git
   ```

2. **Dapatkan Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Jalankan Aplikasi**:
   ```bash
   flutter run
   ```

4. **Build Bundle (Release)**:
   ```bash
   flutter build appbundle --release
   ```

---

## 📝 Catatan Rilis Terbaru (v1.0.9)
- Pembaruan Target SDK ke level 35 (Android 15).
- Penyesuaian konfigurasi internal untuk mendukung RAM halaman 16 KB.
- Perbaikan pada sistem pencarian dan penambahan tombol "Clear Search".
- Penjajaran ulang asset logo dan tagline aplikasi menjadi "Citarasa Otentik Kuliner Nusantara".

---

Developed with ❤️ by **Rivaldy**
