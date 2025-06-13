# 🏆 League of Legends AI Coach Uygulaması

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![League of Legends](https://img.shields.io/badge/League%20of%20Legends-C89B3C?style=for-the-badge&logo=riotgames&logoColor=white)

**Modern ve AI destekli League of Legends coach uygulaması**

[📱 İndir](#kurulum) • [🎮 Özellikler](#özellikler) • [📖 Kullanım](#kullanım-kılavuzu) • [🚀 Başlangıç](#başlangıç)

</div>

---

## 📋 İçindekiler

- [🎯 Proje Hakkında](#-proje-hakkında)
- [✨ Özellikler](#-özellikler)
- [📱 Ekran Görüntüleri](#-ekran-görüntüleri)
- [🚀 Başlangıç](#-başlangıç)
- [📖 Kullanım Kılavuzu](#-kullanım-kılavuzu)
- [🛠️ Kurulum](#️-kurulum)
- [🎮 Champion Rehberi](#-champion-rehberi)
- [⭐ Favoriler Sistemi](#-favoriler-sistemi)
- [🔧 Teknik Detaylar](#-teknik-detaylar)
- [🤝 Katkıda Bulunma](#-katkıda-bulunma)

---

## 🎯 Proje Hakkında

**LoL AI Coach**, League of Legends oyuncuları için geliştirilmiş modern bir mobil uygulamadır. Riot Games API'si ile entegre çalışarak, gerçek zamanlı champion istatistikleri, profesyonel build rehberleri ve AI destekli champion önerileri sunar.

### 🎪 Ne Yapar?

- 🏅 **Kişiselleştirilmiş Champion Önerileri** - Oyun tarzınıza uygun championlar
- 📊 **Gerçek Zamanlı İstatistikler** - Win rate, pick rate, ban rate analizi
- 🛠️ **Profesyonel Build Rehberleri** - Pro player build rotasyonları
- 🔮 **Optimize Rune Sayfaları** - Meta'ya uygun rune setleri
- 📚 **Detaylı Champion Rehberleri** - Combo'lar, counter'lar, ipuçları
- ⭐ **Favoriler Sistemi** - Sevdiğiniz championları kaydedin ve yönetin

---

## ✨ Özellikler

### 🎮 **Champion Yönetimi**
- **67 Champion** için detaylı bilgiler
- Role bazlı filtreleme *(Top, Jungle, Mid, ADC, Support)*
- Arama ve keşif sistemi
- Zorluk seviyesi gösterimi *(Easy, Medium, Hard)*

### 📊 **İstatistik Analizi**
- Güncel **Win Rate** verileri
- **Pick Rate** ve **Ban Rate** metrikleri
- Champion popülerlik trendleri
- Meta analiz ve öneriler

### 🛠️ **Build Sistemi**
- **Core Items** - Ana build rotasyonu
- **Boots Options** - Duruma özel ayakkabılar
- **Situational Items** - Matchup'a göre eşyalar
- **Starting Items** - Optimal başlangıç build'i
- **Skill Order** - Yetenek geliştirme sırası

### 🔮 **Rune Sistemi**
- **Primary/Secondary Trees** - Optimal rune kombinasyonları
- **Stat Shards** - Bonus istatistikler
- **Strateji Açıklamaları** - Rune sinerjisi açıklamaları
- **Meta Uyumlu** - Güncel patch için güncellendi

### 📚 **Champion Rehberleri**
- **Laning Phase** stratejileri
- **Team Fighting** pozisyonlaması
- **Combos & Mechanics** - Yetenek kombinasyonları
- **Tips & Tricks** - Pro player ipuçları
- **Counter Matchups** - Zor rakipler
- **Team Synergies** - En iyi takım arkadaşları

---

## 📱 Ekran Görüntüleri

![image](https://github.com/user-attachments/assets/0ffdb0ed-79d5-4e50-8858-d8152535045f)
![image](https://github.com/user-attachments/assets/99946f22-ad16-4688-a816-a4f8b2c1e2ab)
![image](https://github.com/user-attachments/assets/909e54b6-0f2e-4e60-a4cb-a75dc30b67e0)
![image](https://github.com/user-attachments/assets/752447b3-7447-42c1-9d74-2214104d2076)
![image](https://github.com/user-attachments/assets/946d95ed-dec1-4160-b9f2-5512398745e9)
![image](https://github.com/user-attachments/assets/f57f8192-a8f0-4e50-bd1d-2cc8286f765e)

---

## 🚀 Başlangıç

### 📋 Gereksinimler

Uygulamayı çalıştırmadan önce şunlara sahip olduğunuzdan emin olun:

- **Flutter SDK** (3.0.0 veya üzeri)
- **Dart SDK** (2.17.0 veya üzeri)
- **Android Studio** veya Flutter eklentili **VS Code**
- **Git** versiyon kontrolü için

### 🔑 API Kurulumu

1. **Riot API Key Alın:**
   ```bash
   # Şu adresi ziyaret edin: https://developer.riotgames.com/
   # Riot hesabınızla giriş yapın
   # Yeni bir API key oluşturun
   ```

2. **API Key'i Yapılandırın:**
   ```dart
   // lib/api_service.dart dosyasında
   static const String apiKey = 'RIOT_API_KEY_BURAYA';
   ```

---

## 🛠️ Kurulum

### 📱 **Yöntem 1: Repository'yi Klonlayın**

```bash
# Repository'yi klonlayın
git clone https://github.com/kullaniciadi/LoL-AI-Coach-Application.git

# Proje dizinine gidin
cd LoL-AI-Coach-Application

# Bağımlılıkları yükleyin
flutter pub get

# Uygulamayı çalıştırın
flutter run
```

### 📦 **Yöntem 2: Release İndirin**

1. [Releases](https://github.com/kullaniciadi/LoL-AI-Coach-Application/releases) sayfasına gidin
2. En son APK dosyasını indirin
3. Android cihazınıza yükleyin
4. Açın ve keyfini çıkarın!

---

## 📖 Kullanım Kılavuzu

### 🏠 **Ana Ekran**
- **Champion Önerileri** - Kişiselleştirilmiş öneriler alın
- **Lane Seçimi** - Tercih ettiğiniz rolü seçin
- **Rastgele Seçim** - AI'ın size champion önermesini sağlayın
- **İstatistik Özeti** - Uygulama metriklerini görüntüleyin

### 🔍 **Champion Keşfi**
1. **Tüm Championları Gözden Geçirin** - Komple roster'ı keşfedin
2. **Role Göre Filtreleyin** - Top, Jungle, Mid, ADC, Support
3. **Arama Fonksiyonu** - Championları isme göre bulun
4. **Zorluk Filtresi** - Easy, Medium, Hard

### 📊 **Champion Detayları**
- **İstatistik Kartı** - Win/Pick/Ban oranları
- **Build Rehberi** - Profesyonel eşya build'leri
- **Rune Sayfaları** - Optimize edilmiş rune kurulumları
- **Strateji Rehberi** - Detaylı oynanış ipuçları

### ⭐ **Favoriler Yönetimi**
- **Favorilere Ekle** - Champion kartlarında kalp ikonu
- **Favoriler Sayfası** - Header'daki buton ile erişim
- **Hızlı Eylemler** - Favorilerden Build/Runes/Guide
- **Favorileri Kaldır** - Tek dokunuşla yönetim

---

## 🎮 Champion Rehberi

### 🛠️ **Build Sistemi Kullanımı**

1. **Champion'a Git** → Herhangi bir champion seçin
2. **"Build" Butonuna Tıklayın** → Profesyonel build'leri görüntüleyin
3. **Core Items** → Champion için temel eşyalar
4. **Situational Items** → Düşman takım kompozisyonuna uyarlayın
5. **Skill Order** → Yetenekleri optimal şekilde geliştirin

### 🔮 **Rune Sayfaları**

1. **Rune'lara Erişin** → Champion detayı → "Runes" butonu
2. **Primary Tree** → Ana rune seçimi
3. **Secondary Tree** → Destekleyici rune'lar
4. **Stat Shards** → Bonus istatistikler
5. **Kurulumu Kopyalayın** → Oyun içinde kullanın

### 📚 **Strateji Rehberleri**

1. **Champion Guide** → Detaylı oynanış bilgileri
2. **Laning Phase** → Erken oyun stratejileri
3. **Team Fighting** → Orta-geç oyun pozisyonlaması
4. **Combos** → Yetenek rotasyon rehberleri
5. **Counters** → Zor eşleşmeler ve çözümler

---

## ⭐ Favoriler Sistemi

### 💫 **Favoriler Nasıl Kullanılır**

1. **Champion Ekleme:**
   - Herhangi bir champion kartında kalp ikonuna dokunun
   - Veya champion detaylarında "Favorilere Ekle"yi kullanın

2. **Favorileri Yönetme:**
   - Header'daki favoriler butonuna erişim
   - Tüm kayıtlı championları tek yerde görüntüleyin
   - Build/Runes/Guide'a hızlı erişim

3. **Favorileri Kaldırma:**
   - Kalp ikonuna dokunarak kaldırın
   - Veya "Tümünü Temizle" seçeneğini kullanın

### 🎯 **Favoriler Özellikleri**

- **Gerçek Zamanlı Badge** - Favori sayısını gösterir
- **Hızlı Erişim** - Rehberlere hızlı navigasyon
- **Kalıcı Depolama** - Oturumlar arası favori kaydetme
- **Görsel Göstergeler** - Favori championlarda altın kalp

---

## 🔧 Teknik Detaylar

### 🏗️ **Mimari**

```
lib/
├── main.dart                 # Uygulama giriş noktası
├── champions.dart            # Champion listesi ve yönetimi
├── champion_detail_pages.dart # Build/Runes/Guide sayfaları
├── favorites_manager.dart    # Favoriler sistemi
├── favorites_page.dart       # Favoriler UI
├── api_service.dart          # Riot API entegrasyonu
└── riot_champion.dart        # Veri modelleri
```

### 📊 **Kullanılan Teknolojiler**

- **Flutter Framework** - Cross-platform mobil geliştirme
- **Dart Dili** - Uygulama mantığı
- **Riot Games API** - Gerçek zamanlı champion verileri
- **HTTP Package** - API iletişimi
- **Cached Network Image** - Optimize edilmiş resim yüklemesi
- **Material Design** - Modern UI bileşenleri

### 🎨 **Tasarım Sistemi**

- **Dark/Light Tema** - Uyarlanabilir temalama
- **League of Legends Renkleri** - Otantik renk paleti
- **Smooth Animasyonlar** - 60fps etkileşimler
- **Responsive Layout** - Tüm ekran boyutlarında çalışır

---

## 🤝 Katkıda Bulunma

Katkılarınızı memnuniyetle karşılıyoruz! İşte nasıl yardımcı olabilirsiniz:

### 🔧 **Geliştirme Kurulumu**

1. **Repository'yi fork edin**
2. **Feature branch oluşturun:** `git checkout -b feature/amazing-feature`
3. **Değişiklikleri commit edin:** `git commit -m 'Add amazing feature'`
4. **Branch'e push edin:** `git push origin feature/amazing-feature`
5. **Pull Request açın**

### 📝 **Katkı Kuralları**

- Dart/Flutter kodlama standartlarını takip edin
- Yeni özellikler için test ekleyin
- Dokumentasyonu gerektiği gibi güncelleyin
- Göndermeden önce tüm testlerin geçtiğinden emin olun

### 🐛 **Hata Raporları**

Hata buldunuz mu? Lütfen şunlarla birlikte bir issue açın:
- Cihaz bilgileri
- Tekrarlama adımları
- Beklenen vs gerçek davranış
- Uygulanabilirse ekran görüntüleri

---

## 📄 Lisans

Bu proje MIT Lisansı altında lisanslanmıştır - detaylar için [LICENSE](LICENSE) dosyasına bakın.

---

## 🙏 Teşekkürler

- **Riot Games** - Kapsamlı API için
- **Flutter Takımı** - Harika framework için
- **League of Legends Topluluğu** - İlham ve geri bildirim için
- **Katkıda Bulunanlar** - Değerli katkılarınız için teşekkürler!

---

<div align="center">

**League of Legends topluluğu için ❤️ ile yapıldı**

[⬆ Başa Dön](#-league-of-legends-ai-coach-uygulaması)

</div>
