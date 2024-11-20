# capybaras-corner-mobile
<details>
<summary> Tugas 7 </summary>

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
4. Jelaskan perbedaan antara const dengan final.
5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

=============== 1 ===============
<br/>
Stateless dan stateful adalah dua jenis keadaan widget yang ada pada flutter. Stateless widget artinya adalah widget yang menampilkan data yang tetap/konstan atau tidak sering berubah. Kebalikannya, stateful widget digunakan ketika kita ingin menampilkan data yang sering berubah selama berjalannya aplikasi. Contoh simple stateful widget seperti label yang menunjukkan sebuah counter, tentu akan menunjukkan angka yang berubah (incrementing) sedangkan contoh stateless misalkan label yang menunjukkan nama aplikasi.
<br/>
=============== 2 ===============
<br/>
| Widget                       | Kegunaan                                                                                                             |
|------------------------------|----------------------------------------------------------------------------------------------------------------------|
| `MaterialApp`                | Root aplikasi dengan struktur Material Design, menyediakan navigasi dan tema.                                       |
| `ThemeData`                  | Mengatur tema visual aplikasi, seperti warna, font, dan gaya lainnya.                                               |
| `ColorScheme.fromSwatch`     | Membuat skema warna dari palet warna yang dipilih, menetapkan `primarySwatch` dan warna sekunder.                   |
| `MyHomePage`                 | Widget yang akan menjadi halaman beranda atau home page dari aplikasi.                                              |
| `MyApp`                      | Custom widget sebagai root aplikasi, menyusun `MaterialApp` dan pengaturan tema serta halaman awal.                 |
| `runApp`                     | Fungsi untuk menjalankan aplikasi, menampilkan widget utama (`MyApp`) dalam hierarchy aplikasi Flutter.             |
| `Scaffold`                   | Menyediakan struktur halaman dasar dengan `AppBar` dan `body`.                                                      |
| `AppBar`                     | Toolbar di bagian atas halaman, menampilkan judul dan ikon aplikasi.                                                |
| `Text`                       | Menampilkan teks statis pada layar. Digunakan untuk judul, sambutan, dan informasi lainnya.                         |
| `Padding`                    | Menambahkan jarak di sekitar widget untuk tata letak yang lebih rapi.                                               |
| `Column`                     | Menyusun widget secara vertikal, seperti teks dan kartu dalam halaman.                                              |
| `Row`                        | Menyusun widget secara horizontal, seperti `InfoCard` dalam satu baris.                                             |
| `InfoCard`                   | Custom widget yang menampilkan informasi sederhana (judul dan konten).                                              |
| `ItemCard`                   | Custom widget untuk ikon dan teks opsional. Respon `onTap` untuk interaksi pengguna.                               |
| `GridView.count`             | Menampilkan grid dengan jumlah kolom tetap, seperti `ItemCard` dalam 3 kolom.                                       |
| `Card`                       | Menampilkan kotak dengan elevasi, memberikan tampilan visual untuk `InfoCard`.                                      |
| `Material`                   | Menambahkan efek Material Design pada `ItemCard`, seperti warna latar belakang dan sudut melengkung.               |
| `InkWell`                    | Menambahkan efek klik pada `ItemCard` dan menampilkan `SnackBar` saat ditekan.                                      |
| `SnackBar`                   | Menampilkan pesan sementara di bagian bawah layar, sebagai respons ketika `ItemCard` ditekan.                      |
| `MediaQuery.of(context)`     | Mengambil ukuran layar untuk menyesuaikan tampilan secara responsif.                                                |
| `SizedBox`                   | Menambahkan jarak vertikal antara elemen-elemen dalam kolom.                                                        |
<br/>
=============== 3 ===============
<br/>
setState() digunakan untuk memberi sinyal framework bahwa isi dari sebuah `StatefulWidget` telah berubah dan butuh dicek.
setState() hanya berdampak pada variabel atau data yang berada dalam State dari widget tersebut, khususnya variabel-variabel yang digunakan dalam metode build. Variabel yang terpengaruh antara lain:
1. Variabel dengan nilai dinamis atau bisa berubah: Variabel seperti int counter, String text, atau List items yang diinisialisasi dalam State widget bisa diubah, dan setState() akan memperbarui tampilan sesuai perubahan tersebut.
2. Data yang ditampilkan di UI: Semua data yang digunakan di dalam build method, seperti teks, gambar, ukuran, atau warna, jika terhubung dengan variabel dalam state yang berubah, akan terpengaruh oleh setState().
3. Properti widget: Jika suatu properti dari widget bergantung pada nilai variabel dalam State, maka perubahan nilai tersebut juga mempengaruhi tampilan widget. Misalnya, properti color dari widget Container yang bergantung pada nilai dari variabel dalam state.
<br/>
=============== 4 ===============
<br/>

| Sifat                         | `const`                              | `final`                            | 
|-------------------------------|--------------------------------------|------------------------------------|
| Waktu penentuan nilai         | Compile-time                         | Run-time                           | 
| Dapat berubah nilainya?       | Tidak                                | Tidak                              | 
| Penggunaan pada variabel instance? | Tidak bisa                        | Bisa                               | 
| Memerlukan kata kunci `static` untuk class-level konstanta? | Ya                                  | Tidak (tidak bisa const)  | 
| Bersifat immutable (tidak dapat diubah) | Ya, mutlak (benar-benar konstan) | Ya, tetapi nilai di-set saat run-time | 
| Cocok untuk                   | Nilai konstan di seluruh aplikasi    | Nilai yang diketahui saat run-time dan hanya di-set sekali | 
| Contoh                         | `static const double pi = 3.14;`    | `final DateTime now = DateTime.now();` |

<br/>
=============== 5 ===============
<br/>
Hal pertama yang dilakukan adalah membuat file baru bernama ``menu.dart`` pada folder lib. Lalu memindahkan class `MyHomePage` dari ``main.dart`` kemudian mengubah jenisnya menjadi stateless widget. Kemudian mengisi isi class `MyHomePage` sesuai definisi yang diperlukan suatu stateless widget. Lalu juga menambahkan 3 variable Strings (nama, kelas, npm) sebagai data yang ditunjukkan pada info card nanti.

Selanjutnya, membuat class baru bernama `InfoCard` di ``menu.dart`` yang akan menunjukkan data nama, kelas, npm yang di-define pada `MyHomePage`. class `InfoCard` ini akan membuat suatu widget Card yang berbentuk kotak dan akan menampilkan data dan title dari data tersebut.

Kemudian buat class `ItemHomePage` yang punya atribut name, icon, dan colors. name disini bertipe String, icon bertipe IconData, colors bertipe MaterialColor. Lalu buat konstruktor untuk class ini. Jadi tiap instance ItemHomePage akan memiliki name, icon, dan colors.

Kembali ke Class `MyHomePage`, tambahkan list of `ItemHomePage` sebagai button-button yang ingin ditambahkan. Pada buttonnya kita bisa memberi warna yang kita inginkan sesuai dengan yang kita masukkan pada pembuatan instance `ItemHomePage` nya.

Kemudian untuk menunjukkan bentuk button dan logic buttonnya, kita buat class `ItemCard`. yang akan memiliki variable class nya yaitu instance dari `ItemHomePage`. Build context dari `ItemCard` akan mengembalikan widget Material dengan color dan icon diambil dari attribut `ItemHomePage`. Kemudian ketika di-click, akan menunjukkan snackbar yang memberi pesan "Kamu telah menekan tombol (nama tombol)".

Setelah itu, kita perlu mengintegrasikan class-class ini ke Home Page. Widget yang akan di-build akan berupa scaffold yang mana kita harus mendefine AppBar dan Body nya. 
<br/>
</details>

<details>
<summary> Tugas 8 </summary>
  1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan
const, dan kapan sebaiknya tidak digunakan? <br/>
  2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!<br/>
  3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input
Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!<br/>
  4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan
tema pada aplikasi yang kamu buat?<br/>
  5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

=============== 1 ===============
<br/>
Const di flutter berguna sebagai penanda bahwa suatu variable itu konstan. Berbeda dengan final, const ditentukan nilainya saat compile time jadi dapat mempercepat jalannya aplikasi. Sebaiknya gunakan const pada variable/pemanggilan fungsi yang tidak akan berubah statenya. Const sebaiknya tidak digunakan pada variable atau instansiasi suatu class yang akan membutuhkan/dapat nilainya ketika runtime.
<br/>
=============== 2 ===============
<br/>
1. Widget Column
Column adalah widget yang menyusun elemen-elemen secara vertikal (dari atas ke bawah). Widget ini berguna untuk menumpuk komponen secara vertikal, misalnya daftar teks atau tombol yang harus disusun dalam satu kolom.
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center, // Menempatkan widget di tengah vertikal
  crossAxisAlignment: CrossAxisAlignment.center, // Menempatkan widget di tengah horizontal
  children: [
    Text('Hello'),
    Text('Welcome to Flutter'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Click Me'),
    ),
  ],
)
```
2. Widget Row
Row adalah widget yang menyusun elemen-elemen secara horizontal (dari kiri ke kanan). Widget ini sering digunakan ketika Anda ingin menempatkan elemen-elemen yang perlu ditampilkan secara berdampingan, misalnya ikon dan teks dalam satu baris.
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Menyebar widget secara merata
  crossAxisAlignment: CrossAxisAlignment.center, // Menempatkan widget di tengah vertikal
  children: [
    Icon(Icons.home, size: 32),
    Text('Home'),
    Icon(Icons.settings, size: 32),
    Text('Settings'),
  ],
)
```
<br/>
=============== 3 ===============
<br/>
1. TextFormField: adalah widget dasar yang sering dipakai untuk input teks seperti nama, alamat, atau deskripsi. Elemen ini bisa digunakan dengan validator untuk memeriksa validitas input.
Dalam Project ini saya hanya menggunakan TextFormField, mungkin untuk pemilihan `Chill Level` saya bisa menggunakan slider.

Widget form input lainnya, yang sering dipakai:
- DropdownButtonFormField: Sering digunakan untuk memilih dari sekumpulan pilihan tetap, seperti kategori produk atau jenis kelamin.
- Checkbox: Untuk input yang hanya memerlukan pilihan "ya" atau "tidak," seperti setuju pada syarat dan ketentuan.
- Radio: Jika pilihan terbatas pada satu opsi dari beberapa, misalnya, pilihan jenis pembayaran.
- Slider: Berguna untuk memilih nilai numerik dalam rentang tertentu, seperti intensitas atau level sesuatu.
- Switch: Biasanya digunakan untuk pengaturan aktif/nonaktif, misalnya, notifikasi aplikasi.
- DatePicker: Menampilkan kalender untuk memilih tanggal, seperti pada formulir pemesanan.
- TimePicker: Untuk memilih waktu spesifik, misalnya untuk pengaturan jadwal.

<br/>
=============== 4 ===============
<br/>
Pada tanggal readme ini ditulis ``12/11/2024``, saya baru menggunakan widget ``ThemeData`` pada ``main.dart`` untuk mengatur theme color aplikasi. Saya juga menerapkan ``IconThemeData`` pada bagian AppBar di ``menu.dart``. Untuk pengaplikasian theme warna aplikasinya, dapat menggunakan ``Theme.of(context)``.
<br/>
=============== 5 ===============
<br/>
Tentu saja dengan widget Navigator adalah yang paling umum, cara kerjanya bisa dibayangkan sebagai stack of screens. Dimana ketika ingin berganti screen (dari top of stack) kita bisa lakukan push sebuah screen(widget), pop, ataupun mengganti top of stack dengan screen lain secara langsung. Penggunaan stack ini memungkinkan pengguna untuk rollback ke screen sebelumnya (dengan pop stack).
<br/>
</details>


<details>
  <summary> Tugas 9 </summary>
<br/>
1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu? <br/>
2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini <br/>
3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter. <br/>
4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter. <br/>
5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter. <br/>
6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial) <br/>

=============== 1 ===============
<br/>
Alasan perlunya membuat model dalam data delivery JSON:
- Struktur Jelas: Model memastikan data yang diterima atau dikirim memiliki format yang konsisten.
- Parsing Mudah: Model mempermudah mengubah JSON ke objek yang bisa langsung dipakai di kode.
- Validasi Data: Model bisa memeriksa tipe dan format data agar sesuai sebelum dipakai.
- Kode Rapi: Dengan model, kode jadi lebih bersih dan lebih mudah dipahami.

Jika tidak membuat model, error tidak selalu terjadi namun ada beberapa hal yang dapat terjadi jika tidak membuat model yaitu
- Error Tipe Data: Data dari JSON bisa salah tipe (contoh, angka ternyata string).
- Kesulitan Debugging: Kalau ada masalah, jadi sulit melacak kesalahan karena data diproses manual.
- Kode Berantakan: Anda harus menulis banyak logika tambahan untuk mengakses atau memeriksa data.
- Error Tak Terduga: Kalau API berubah (misalnya, atribut dihapus atau diubah namanya), aplikasi bisa gagal tanpa pemberitahuan yang jelas.

<br/>
=============== 2 ===============
<br/>
Library http pada tugas ini digunakan untuk melakukan komunikasi antara aplikasi dengan server melalui protokol HTTP. Fungsi utamanya meliputi:
* Mengirim Permintaan HTTP: http memungkinkan aplikasi mengirim permintaan HTTP seperti GET, POST, PUT, dan DELETE ke server untuk mengambil atau mengubah data.
* Mengelola Respons dari Server: Library ini memproses respons dari server, seperti data JSON yang dikembalikan, status kode HTTP (misalnya, 200 untuk sukses atau 404 untuk tidak ditemukan), dan header respons lainnya.
* Parsing Data JSON: Data yang diterima dari server biasanya dalam format JSON. Dengan http, data ini dapat dengan mudah diubah menjadi objek Dart agar lebih mudah digunakan.
* Mendukung Aplikasi Berbasis REST API: http memudahkan integrasi aplikasi dengan REST API, seperti dalam tugas ini, di mana aplikasi Anda berkomunikasi dengan backend untuk mengambil atau mengirimkan data.
<br/>
=============== 3 ===============
<br/>
**CookieRequest** digunakan untuk menangani komunikasi HTTP dengan server, terutama yang membutuhkan autentikasi berbasis cookie. Fungsinya adalah:
Mengelola cookie: Menyimpan dan mengirim cookie untuk menjaga sesi pengguna.
Mempermudah request HTTP: Menangani pengiriman data (GET/POST) tanpa perlu mengatur cookie secara manual.
Otentikasi otomatis: Memastikan pengguna yang login tetap terautentikasi saat mengakses data atau halaman tertentu.

Kenapa Perlu Dibagikan ke Semua Komponen?
Menjaga sesi: Semua halaman butuh akses ke cookie agar pengguna tidak logout saat berpindah halaman.
Konsistensi data: Instance yang sama mencegah perbedaan data atau cookie antar halaman.
Efisiensi: Menghindari duplikasi kerja dan meminimalkan error saat berkomunikasi dengan server.
<br/>
=============== 4 ===============
<br/>
Misalkan input dari suatu website, akan diproses dari website tersebut yang mana akan mengirimkan endpointnya yang berisi data dari input tersebut dalam bentuk JSON. Kemudian dari Flutter
akan mengambil data JSON nya dengan await http. Kemudian data JSON yang sudah diambil akan diproses sesuai kebutuhan, lalu ditampilkan sesuai dengan yang diinginkan.
<br/>
=============== 5 ===============
<br/>
Dimulai dari register dari flutter, disini akan diminta input nama dan password yang akan dikirimkan dalam bentuk JSON ke website yang sesuai url kiriman dengan metode POST. Kemudian ke backend websitenya JSON dari flutter digunakan sebagai input untuk login di websitenya kemudian akan menghasilkan response yang sesuai dengan status login dan lagi response ini berupa JSON dari websitenya. Jika berhasil akan menghasilkan status success, kembali ke Flutter, flutter akan menunggu response JSON ini dan akan mengirimkan page login jika register berhasil.

Untuk bagian Login kurang lebih sama, input nama dan password dari Flutter dalam JSON ke website lalu diproses di Website yang hasilnya akan mengirim response JSON yang ditunggu oleh Flutter, kemudian Flutter bertindak sesuai hasil response JSON dari websitenya. Dalam kasus ini jika dikembalikan status = True, maka user sudah terlogin. Lalu di Flutter nya push page untuk menu utama.

Untuk bagian logout, Flutter hanya melakukan request.logout yang juga menunggu response JSON dari website. Di backend websitenya diproses untuk logout user kemudian dia mengembalikan JSON response lagi. Lalu jika response message nya berhasil Flutter mengembalikan user ke login page.

<br/>
=============== 6 ===============
<br/>
Pertama tentu saja mengatur Integrasi antara Flutter dengan Django, dengan menginstall dependencies yang dibutuhkan di Flutternya dan Django. Lalu juga membuat aplikasi baru pada Django nya bernama authentication yang akan mengatur masalah autentikasi dari Flutter ke Django. Kemudian ubah main.dart supaya memiliki CookieRequest fungsinya sesuai yang telah disebutkan di atas.

Pada aplikasi authentication di Django tambahkan semua fungsi views.py yang akan menghandle request dari Flutter dan mengembalikan response (bisa berupa JSON) ke Flutter. 

Lalu, pada flutter sendiri tambahkan semua file ``.dart`` yang berfungsi untuk menunjukkan fitur kepada user, seperti login, register, list produk.

Untuk bagian list produk pada Flutter, kita akan melakukan Fetch data dari Django tepatnya dari app main. Kita buat dulu modelsnya di Flutter supaya memudahkan validasi data dari Djangonya. Tentu saja untuk mendapatkan datanya, dari Django mengirimkan data JSON yang akan diolah di Flutter sesuai models. Kemudian baru ditunjukkan sesuai kebutuhan.

Karena diminta untuk menunjukkan detail untuk setiap produk dalam pagenya sendiri. Kita perlu membuat ``product_detail.dart`` untuk menghandle itu. pada list product page akan ada tombol yang mengarahkan ke page sesuai yang berisi detail produk yang diclick. Dari list product itu juga dikirimkan data yang telah di fetch disitu ke page detailnya.
Kemudian di page detail productnya tinggal menunjukkan hasil fetch data yang telah dilakukan di list product.

Kemudian kita juga harus mengintegrasikan form produk pada flutter dengan yang di django. Untuk ini kita perlu membuat fungsi views baru di Django, yang akan menerima data JSON dari Flutter, lalu di Djangonya, dibentuklah produknya, jika berhasil akan dikirimkan response berupa JSOn lagi ke Flutter. Produk yang berhasil ditambahkan itu akan masuk ke database Django.

<br/>

  
</details>
