# capybaras-corner-mobile

## Tugas 7

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
<br/>
=============== 3 ===============
<br/>
<br/>
=============== 4 ===============
<br/>

| Sifat                         | `const`                              | `final`                            | Variabel Instance        |
|-------------------------------|--------------------------------------|------------------------------------|---------------------------|
| Waktu penentuan nilai         | Compile-time                         | Run-time                           | Run-time                  |
| Dapat berubah nilainya?       | Tidak                                | Tidak                              | Bisa (default)           |
| Penggunaan pada variabel instance? | Tidak bisa                        | Bisa                               | Bisa                      |
| Memerlukan kata kunci `static` untuk class-level konstanta? | Ya                                  | Tidak (tidak bisa const)  | Tidak                      |
| Bersifat immutable (tidak dapat diubah) | Ya, mutlak (benar-benar konstan) | Ya, tetapi nilai di-set saat run-time | Bisa diubah (default)    |
| Cocok untuk                   | Nilai konstan di seluruh aplikasi    | Nilai yang diketahui saat run-time dan hanya di-set sekali | Nilai berbeda per objek   |
| Contoh                         | `static const double pi = 3.14;`    | `final DateTime now = DateTime.now();` | `int speed = 60;`        |

<br/>
=============== 5 ===============
<br/>
Hal pertama yang dilakukan adalah membuat file baru bernama ``menu.dart`` pada folder lib. Lalu memindahkan class `MyHomePage` dari ``main.dart`` kemudian mengubah jenisnya menjadi stateless widget. Kemudian mengisi isi class `MyHomePage` sesuai definisi yang diperlukan suatu stateless widget. Lalu juga menambahkan 3 variable Strings (nama, kelas, npm) sebagai data yang ditunjukkan pada info card nanti.

Selanjutnya, membuat class baru bernama `InfoCard` di ``menu.dart`` yang akan menunjukkan data nama, kelas, npm yang di-define pada `MyHomePage`. class `InfoCard` ini akan membuat suatu widget Card yang berbentuk kotak dan akan menampilkan data dan title dari data tersebut.

Kemudian buat class `ItemHomePage` yang punya atribut name, icon, dan colors. name disini bertipe String, icon bertipe IconData, colors bertipe MaterialColor. Lalu buat konstruktor untuk class ini. Jadi tiap instance ItemHomePage akan memiliki name, icon, dan colors.

Kembali ke Class `MyHomePage`, tambahkan list of `ItemHomePage` sebagai button-button yang ingin ditambahkan. Pada buttonnya kita bisa memberi warna yang kita inginkan sesuai dengan yang kita masukkan pada pembuatan instance `ItemHomePage` nya.

Kemudian untuk menunjukkan bentuk button dan logic buttonnya, kita buat class `ItemCard`. yang akan memiliki variable class nya yaitu instance dari `ItemHomePage`. Build context dari `ItemCard` akan mengembalikan widget Material dengan color dan icon diambil dari attribut `ItemHomePage`. Kemudian ketika di-click, akan menunjukkan snackbar yang memberi pesan "Kamu telah menekan tombol (nama tombol)".

Setelah itu, kita perlu mengintegrasikan class-class ini ke Home Page. Widget yang akan di-build akan berupa scaffold yang mana kita harus mendefine AppBar dan Body nya. 
