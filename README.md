# panda_sportswear

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Tugas 7: Elemen Dasar Flutter  
Nama : Ryan Gibran Purwacakra Sihaloho  
Kelas : PBP - C  
NPM : 2406419833  

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.  

    Widget Tree adalah peta atau blueprint dari seluruh tampilan (UI) aplikasi.
    Pada Flutter, semuanya adalah widget. Tombol, teks, padding, layout(Column dan Center) adalah widget. Untuk membuat UI, kita menyusun/menumpuk widget di dalam widget lain. Susunan tumpukan inilah yang membentuk struktur seperti pohon.  

    Hubungan Parent-Child
    Parent memberi batasan/constraints
    Parent memberitahu child (widget didalamnya):"Kmu boleh punya ukuran minimal sekian dan maksimal sekian"
    Child menentukan ukuran(size)
    Setelah menerima constraint, child memutuskan sizenya sendiri
    Parent mengatur posisi
    Setelah child menentukan size, parent akan menentukan dimana posisi childnya akan berada.
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.  
    1) Widget Core Aplikasi (File:main.dart)  
merupakan widget pondasi aplikas.  
MaterialApp: widget pembungkus utama seluruh aplikasi. Berfungsi untuk emberi aplikasi semua fitur standar "Material Design",seperti navigasi, tema (warna, font), dan juga menentukan halaman apa yang pertama kali dibuka (home).  
MyApp: Ini adalah custom widget yang berfungsi sebagai root dari aplikasi.Tuugas utamanya adalah mereturn MaterialApp.

    2) Widget Main Page (File:menu.dart)  
Widget ini membangun struktur halaman yang user lihat.  
MyHomePage:Custom widget yang mendefinisikan seluruh page menu.  
Scaffold: adalah kerangka dasar untuk sebuah halaman. Merupakanwidget yang memberikan struktur standar seperti appBar dan body.  
AppBar: Widget untuk tempat judul di bagian atas layar, tempat kita meletakkan Text "Panda Sportswear".

    3) Widget Layout  
Widget ini tidakterlihat, tapi fungsinya mengatur posisi dan susunan widget lain.  
Padding: Memberi jarak/ruang di sekeliling widget childnya.  
Column: Menyusun widget-widget childnya secara vertikal (dari atas ke bawah).  
Center: Menempatkan widget child persis di tengah-tengah ruang yang tersedia.  
GridView.count: Widget utama untuk membuat grid (kisi-kisi). Kita buat 3 kolom (crossAxisCount: 3), dan secara otomatis mengatur item-item di dalamnya.  
SizedBox: Digunakan di dalam InfoCard untuk membuat kotak kosong. Merupakan cara paling efisien untuk memberi jarak vertikal tetap antara dua widget  
Container: Merupakan kotak serbaguna. Bisa digunakan untuk memberi padding, margin, width, height, atau color.

    4) Widget Visual  
Widget ini adalah apa yang dilihat langsung oleh user (teks, ikon, kotak).  
Text: menampilkan teks di layar.  
Icon: Menampilkan sebuah ikon grafis dari koleksi Material Design   
Card: Container khusus yang memiliki gaya Material Design (sudut melengkung dan sedikit bayangan/shadow)   
Material: widget dasar yang memberi bentuk visual.Digunakan untuk mengatur color (warna tombol) dan borderRadius (sudut melengkung) pada tombol

    5) Widget Interaktif  
Widget ini berhubungan dengan input atau respons dari user.  
InkWell: widget tak terlihat yang membuat widget childnya (Container) menjadi bisa diklik. juga yang memberikan efek splash saat tombol diklik  
SnackBar: Widget yang menampilkan pesan pop-up sementara di bagian bawah laya.

    6) Widget Dasar (Template)  
StatelessWidget: Merupakan cetakan (class) yang digunakan untuk membuat widget sendiri (seperti MyApp, MyHomePage, InfoCard, ItemCard). Disebut "stateless" karena propertinya tidak bisa berubah setelah widget dibuat.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.  
   aterialApp adalah widget pembungkus (wrapper) utama yang menyediakan fungsionalitas dan gaya "Material Design" dari Google untuk seluruh aplikasi.  
Fungsi :
    1) Mengatur Navigasi: MaterialApp membuat Navigator high level,mengelola tumpukan pages/route. Ini memungkinkan kita menggunakan Navigator.push ( pindah ke halaman baru) dan Navigator.pop (untuk kembali)  
    2) Menyediakan Tema: Ini adalah tempat kita mendefinisikan ThemeData (skema warna, font, gaya tombol, dll.) yang akan berlaku secara global. Widget apa pun di bawahnya bisa mengakses tema ini menggunakan Theme.of(context).  
    3) Menentukan Halaman Awal: Developer/kita memberi tahu aplikasi halaman mana yang harus diload pertama kali menggunakan properti home.  

    MaterialApp dianggap  sebagai "widget root" karena perlu (harus) membungkus semua page dan widget lain agar dapat memberikan fungsionalitas intinya


4.  Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?  
    1) Stateless widget (statik)  
widget yang tidak bisa diubah (immutable). tampilannya murni ditentukan oleh data (parameter) yang ditterima dari parentnya saat dibuat.   
Method build()-nya hanya akan dipanggil ulang jika data dari parentnya berubah, sehingga terpaksa untuk membangun ulang dengan data baru.
Contoh: ItemCard dan MyHomePage adalah StatelessWidget .   
Tampilannya (nama, ikon, warna) murni bergantung pada data ItemHomepage yang dilempar dari luar.  
Kondisi untuk menggunakan:  
-Tampilan hanya bergantung pada data dari parent.  
-Tampilannya tidak akan berubah oleh interaksi user.  
-Developer/kita perlu memanggil setState().

    2) Stateful Widget(dinamis)  
Widget yang dirancang khusus untuk menyimpan dan mengelola data yang bisa berubah seiring waktu. Strukturnya terdiri dari dua kelas, yaitu Widget itu sendiri (yang tidak bisa diubah), dan Objek State (yang bisa berubah dan menyimpan data).  
Ketika data internalnya perlu diubah (misal karena user menekan tombol), kita call method setState(). Call ini memberi tahu Flutter supaya call fungsi build() supaya mengupdate data  
Contoh:  
TextField (perlu mengignat apa yang sedang diketik user), Checkbox (perlu mengingat apakah sedang dicentang atau tidak), dan sebagainay  
Kondisi untuk menggunakannya:  
-Perlu menyimpan & mengelola data di dalam dirinya sendiri.  
-Tampilannya berubah oleh interaksi (misal: user mengetik).  
-Kita perlu call setState() untuk update UI.

5.  Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?    
    BuildContext adalah adress/lokasi unik sebuah widget di dalam widget tree. Merupakan handle yang memberi tahu sebuah widget di mana tepatnya ia berada di dalam struktur hirarki aplikasi.  
    BuildContext sangat penting karena ia adalah satu-satunya cara bagi sebuah widget untuk berinteraksi dengan widget di atasnya (parent parent nya).   
Pada tugas ini, build context digunakan untuk mendapatkan tema 
```
backgroundColor: Theme.of(context).colorScheme.primary,
```
dan untuk menampilkan notifikasi snackbar

```
 ScaffoldMessenger.of(context).showSnackBar(...),  
```

Metode build adalah tempat di mana Flutter menggambar suatu widget.  
```
@override
Widget build(BuildContext context) {
  // ...
  return Scaffold(...);
}
```
di dalam metode build, kita menggunakan context yang diterima untuk: Membangun widget anak: (Misalnya Scaffold, Column, Text) dan mengambil data dari Parent: (Misal Theme.of(context)).  

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
   Hot Reload  
Memasukkan / meng-inject kode yang baru dituliske dalam aplikasi yang sedang berjalan tanpa me-restart aplikasi dan tanpa menghapus state/data saat ini.  
hanya me-rebuild widget tree. Jika Kita ubah Padding, Color, atau teks,akan langsung tergambar ulang UI-nya  
State: Tetap aman. Misal Jika kita punya variabel counter di angka 123, setelah Hot Reload, angkanya akan tetap 123.  
Digunakan saat kita mencoba mengubah tampilan (UI) atau layout.

    Hot Restart  
menghancurkan state aplikasi dan menjalankan ulang aplikasi dari awal (dari fungsi main()).  
Cara kerjana me reload semua kode aplikasi, tapi prosesnya jauh lebih cepat daripada kita tekan "Stop" lalu "Run" lagi, karena tidak perlu meng-compile ulang kode native (Java/Kotlin/Swift).  
State: Dihapus total. Jika counter berada pada angka 123, setelah Hot Restart,angkanya akan kembali ke 0.  
Digunakan saat kita mengubah sesuatu yang bukan UI (contohnya globalVariable, initState() dan sebagainya)  


<br>

Tugas 8:Flutter Navigation, Layouts, Forms, and Input Elements  
Nama : Ryan Gibran Purwacakra Sihaloho  
Kelas : PBP - C  
NPM : 2406419833  

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?  
   
   Navigator.push() menambahkan halaman baru (route) di atas halaman saat ini. Flutter secara otomatis menambahkan tombol back di AppBar halaman baru. Kalau user menekan tombol back, Flutter akan "melepas" atau pop() halaman teratas, dan halaman di bawahnya  akan muncul kembali di layar  
   Push digunakan saat Saat kita mau masuk ke sebuah fitur dan berniat untuk kembali nantinya. Contohnya saat user menekan card "Create Product" di GridView pada halaman utama (menu.dart).  
   
   Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru.
   Halaman lama  dihapus dari stack, dan halaman baru diletakkan di tempatnya.Karena halaman lama sudah tidak ada di stack, tidak ada tombol back otomatis yang merujuk ke sana. Menekan back di halaman baru akan memindahkan kita ke halaman apa pun yang ada di bawah halaman yang baru saja diganti.  
   pushReplacement() digunakan saat user pindah ke bagian utama aplikasi yang berbeda, dimana kembali ke halaman sebelumnya tidak masuk akal. Contohnya saat user menekan "Tambah Produk" di LeftDrawer (menu samping).  

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?  
   
   Scaffold (Pondasi / Kerangka): Ini adalah widget induk tingkat atas untuk setiap halaman.  menyediakan "slot" atau area yang sudah ditentukan untuk elemen-elemen umum halaman, seperti: appBar (slot untuk AppBar), drawer (slot untuk Drawer), body (slot untuk konten utama halaman)  
   AppBar (Atap / Navigasi Atas): Ini adalah widget yang kita letakkan di slot appBar milik Scaffold  
   Drawer (Menu Samping / Laci): Ini adalah widget yang kita letakkan di slot drawer milik Scaffold  

   Untuk membangun konsistensi:  
   1. Struktur yang Dapat Digunakan Kembali  
        Daripada membangun ulang AppBar dan Drawer di setiap halaman, kita buat widget khusus (seperti LeftDrawer ).
    2. Separation of Concerns  
        Scaffold mengurus "DIMANA" (struktur dan posisi).  
        AppBar dan Drawer mengurus "APA" (konten navigasi).  
        body mengurus konten unik halaman tersebut (seperti GridView di MyHomePage atau Form di ProductFormPage).
3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.  
   
   Padding: widget yang membungkus widget lain (diletakkan sebagai child) dan memberinya ruang kosong (spasi) di sekelilingnya.  
   Kelebihan:  
   Menciptakan White Space: Padding memberi "ruang bernapas" untuk elemen UI. Tanpa padding, teks dan tombol akan menempel langsung ke tepi layar atau menempel satu sama lain, sehingga keliatan sempit dan susah dibaca.  
   Meningkatkan Estetika: Tampilan yang memiliki padding lebih rapi.  
   Kontrol Granular: Kita bisa menentukan padding di semua sisi (EdgeInsets.all()), atau hanya di sisi tertentu  saja(EdgeInsets.symmetric() atau EdgeInsets.only()).  

   ```
    body: Form(
     key: _formKey, 
     child: SingleChildScrollView(
       
       padding: const EdgeInsets.all(16.0), // <--- ini paddingnya 
       child: Column(
         children: [
           //...
         ],
       ),
     ),
   ),
   ```  
   
   SingleChildScrollView: widget yang membungkus satu widget anak (biasanya Column  atau Row) dan membuatnya scrollable kalau kontennya melebihi ukuran layar.  
   Kelebihan:  
   Mencegah Overflow Error: kalau aplikasi memiliki Column dengan banyak widget yang lebih tinggi dari layar, Flutter akan menampilkan error overflow (garis-garis kuning-hitam). Hal ini dicegah dengan SingleChildScrollView  
   Menangani keyboard: ketika user mengetuk TextFormField di bagian bawah formulir, keyboard muncul dan "mendorong" UI keatas. Tanpa scrolling, bidang yang sedang diketik bisa tersembunyi di balik keyboard. SingleChildScrollView memungkinkan user menscroll untuk melihat apa yang mereka ketik.  
   Adaptif: Formulir yang mungkin muat di layar tablet pasti akan overflow di layar HP kecil. SingleChildScrollView membuat aplikasi berfungsi di semua ukuran layar.
   ```
    body: Form(
     // ...
     child: SingleChildScrollView( // <--- ini dia
       child: Column(
         children: [
           TextFormField(controller: _nameController, ...),
           TextFormField(controller: _priceController, ...),
           TextFormField(controller: _descriptionController, ...),
           // ... dan banyak input yang lain
         ],
       ),
     ),
   ),
   ```  

   ListView:menampilkan daftar widget child dan sudah otomatis scrollable  
   Kelebihan:  
   Bawaan Scrollable: Kita ga perlu membungkusnya lagi. ListView dibuat untuk digulir.  
   Efisiensi Memori: Untuk daftar yang panjang (ratusan item), ListView.builder jauh lebih efisien karena hanya me-render item yang terlihat di layar (+ beberapa di luarnya), tidak seperti Column yang me-render semuanya sekaligus.  
   Dinamis: Sempurna untuk menampilkan data dari database atau API, dimana kitatidak tahu berapa banyak item yang akan ada.  
   ```
      class LeftDrawer extends StatelessWidget {
     // ...
     @override
     Widget build(BuildContext context) {
       return Drawer(
         child: ListView( // <--- "ahh, ini dia yang papa cari"
           padding: EdgeInsets.zero,
           children: [
             DrawerHeader(...),
             ListTile(
               title: const Text('Halaman Utama'),
               onTap: () { ... },
             ),
             ListTile(
               title: const Text('Tambah Produk'),
               onTap: () { ... },
             ),
             // Kalau tambahin 20 menu lagi di sini,
             // ListView akan membuatnya bisa di-scroll.
           ],
         ),
       );
     }
   }
   ```  

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?  
   
   ```
   //main.dart
   class MyApp extends StatelessWidget {
     // ...
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         // ...
         theme: ThemeData(
           
           colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan) //<-- ini dia
               .copyWith(secondary: Colors.green),
         ), 
         home: MyHomePage(),
       );
     }
   }
   ```  
   Dengan mendefinisikan colorScheme di main.dart, kita tidak perlu hardcode warna (seperti Colors.blue atau Colors.red) di setiap widget. kita cukup call  warna tema yang sudah konsisten di menu.dart dan product_form_page.dart.
   Kalau kita mau ganti warna tema aplikasi, cukup ganti kode satu baris pada main.dart.