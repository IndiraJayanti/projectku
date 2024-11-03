import 'package:flutter/material.dart'; // Mengimpor paket material.dart, yang berisi komponen Material Design.

void main() {
  runApp(MyApp()); // Menjalankan aplikasi dengan MyApp sebagai root widget.
}

class MyApp extends StatelessWidget { // Kelas MyApp yang merupakan StatelessWidget karena tidak memiliki state.
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun UI.
    return MaterialApp(
      title: 'Web App Biodata Diri', // Menetapkan judul aplikasi.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Menetapkan warna tema utama aplikasi.
      ),
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug di sudut kanan atas aplikasi.
      home: Scaffold( // Menggunakan Scaffold untuk struktur dasar layout.
        body: ResponsiveLayout(), // Menetapkan ResponsiveLayout sebagai widget utama.
      ),
    );
  }
}

class ResponsiveLayout extends StatefulWidget { // Kelas widget Stateful untuk layout responsif.
  @override
  _ResponsiveLayoutState createState() => _ResponsiveLayoutState(); // Menghubungkan dengan state dari widget ini.
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  String _content = 'Biodata'; // Konten default yang akan ditampilkan adalah 'Biodata'.
  bool _isSidebarVisible = true; // Menyimpan status visibilitas sidebar.

  void _updateContent(String content) { // Fungsi untuk memperbarui konten yang ditampilkan.
    setState(() { // Memanggil setState untuk memperbarui UI.
      _content = content; // Mengatur konten yang ditampilkan berdasarkan pilihan.
    });
  }

  void _toggleSidebar() { // Fungsi untuk menampilkan atau menyembunyikan sidebar.
    setState(() {
      _isSidebarVisible = !_isSidebarVisible; // Mengubah status visibilitas sidebar.
    });
  }

  @override
  Widget build(BuildContext context) { // Metode build untuk membangun UI.
    return LayoutBuilder( // Menggunakan LayoutBuilder untuk menentukan ukuran layar.
      builder: (context, constraints) { // Memperoleh ukuran layar dari constraints.
        if (constraints.maxWidth > 800) { // Jika lebar lebih dari 800, tampilkan layout desktop.
          return Row( // Menggunakan Row untuk tata letak horizontal.
            children: [
              if (_isSidebarVisible) // Sidebar hanya tampil jika _isSidebarVisible bernilai true.
                Flexible( // Menggunakan Flexible agar sidebar dapat mengambil ruang sesuai kebutuhan.
                  flex: 2, // Menetapkan sidebar menggunakan 2 bagian dari layout.
                  child: Container(
                    color: Colors.blueGrey[800], // Warna latar belakang sidebar.
                    child: Column( // Menggunakan Column untuk tata letak vertikal di sidebar.
                      children: [
                        DrawerHeader( // Header sidebar.
                          child: Row( // Menggunakan Row untuk menata elemen di header.
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menyebarkan ruang antara elemen.
                            children: [
                              Text(
                                'Menu', // Judul sidebar.
                                style: TextStyle(color: Colors.white, fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        ListTile( // Menu 'Home' pada sidebar.
                          leading: Icon(Icons.home, color: Colors.white), // Ikon untuk menu Home.
                          title: Text('Home', style: TextStyle(color: Colors.white)), // Teks menu Home.
                          onTap: () => _updateContent('Home'), // Mengatur konten ke 'Home' jika ditekan.
                        ),
                        ListTile( // Menu 'Biodata' pada sidebar.
                          leading: Icon(Icons.info, color: Colors.white), // Ikon untuk menu Biodata.
                          title: Text('Biodata', style: TextStyle(color: Colors.white)), // Teks menu Biodata.
                          onTap: () => _updateContent('Biodata'), // Mengatur konten ke 'Biodata' jika ditekan.
                        ),
                      ],
                    ),
                  ),
                ),
              Expanded(
                flex: 8, // Bagian utama dari layout mengambil 8 bagian dari layout.
                child: Column( // Menggunakan Column untuk tata letak vertikal di bagian utama.
                  children: [
                    Container( // Header di bagian utama.
                      padding: EdgeInsets.all(16), // Memberikan padding di sekitar header.
                      color: Colors.blue, // Warna latar belakang header.
                      child: Center( // Menggunakan Center untuk menempatkan teks di tengah.
                        child: Text(
                          'Biodata Diri', // Teks header.
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container( // Konten utama.
                        color: Colors.white, // Warna latar belakang konten.
                        child: Center( // Menggunakan Center untuk menempatkan konten di tengah.
                          child: _content == 'Biodata' // Mengecek konten yang ditampilkan.
                              ? BiodataContent() // Menampilkan konten Biodata jika _content adalah 'Biodata'.
                              : _content == 'Home'
                                  ? HomeContent() // Menampilkan konten Home jika _content adalah 'Home'.
                                  : Text('Content Area - $_content'), // Menampilkan teks untuk konten lain.
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else { // Layout untuk layar sempit (mobile).
          return Scaffold( // Menggunakan Scaffold untuk struktur dasar layout pada mobile.
            appBar: AppBar(
              title: Center( // Menempatkan judul di tengah.
                child: Text(
                  'Biodata Diri', // Judul di AppBar.
                  style: TextStyle(color: Colors.white),
                ),
              ),
              backgroundColor: Colors.blue, // Warna AppBar.
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.menu), // Ikon untuk membuka drawer.
                    onPressed: () {
                      Scaffold.of(context).openDrawer(); // Membuka drawer jika ikon ditekan.
                    },
                  );
                },
              ),
            ),
            drawer: Drawer( // Drawer untuk sidebar pada mobile.
              backgroundColor: Colors.blueGrey[800], // Warna latar belakang drawer.
              child: ListView( // Menggunakan ListView untuk menampilkan daftar menu di drawer.
                children:  [
                  DrawerHeader( // Header untuk drawer.
                    child: Row( // Menggunakan Row untuk menata elemen di header drawer.
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menyebarkan ruang antara elemen.
                      children: [
                        Text(
                          'Menu', // Judul sidebar.
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  ListTile( // Menu 'Home' di drawer.
                    leading: Icon(Icons.home, color: Colors.white), // Ikon untuk menu Home.
                    title: Text('Home', style: TextStyle(color: Colors.white)), // Teks menu Home.
                    onTap: () {
                      _updateContent('Home'); // Mengatur konten ke 'Home' jika ditekan.
                      Navigator.pop(context); // Menutup drawer setelah ditekan.
                    },
                  ),
                  ListTile( // Menu 'Biodata' di drawer.
                    leading: Icon(Icons.info, color: Colors.white), // Ikon untuk menu Biodata.
                    title: Text('Biodata', style: TextStyle(color: Colors.white)), // Teks menu Biodata.
                    onTap: () {
                      _updateContent('Biodata'); // Mengatur konten ke 'Biodata' jika ditekan.
                      Navigator.pop(context); // Menutup drawer setelah ditekan.
                    },
                  ),
                ],
              ),
            ),
            body: Container(
              color: Colors.white, // Warna latar belakang konten.
              child: Center( // Menggunakan Center untuk menempatkan konten di tengah.
                child: _content == 'Biodata' // Mengecek konten yang ditampilkan.
                    ? BiodataContent() // Menampilkan konten Biodata jika _content adalah 'Biodata'.
                    : _content == 'Home'
                        ? HomeContent() // Menampilkan konten Home jika _content adalah 'Home'.
                        : Text('Content Area - $_content'), // Menampilkan teks untuk konten lain.
              ),
            ),
          );
        }
      },
    );
  }
}

class BiodataContent extends StatelessWidget { // Kelas untuk konten Biodata.
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun UI.
    return SingleChildScrollView( // Membuat tampilan scroll jika konten melebihi layar.
      child: Container(
        width: 600, // Lebar maksimum konten.
        padding: EdgeInsets.all(20.0), // Jarak antara konten dan tepi container.
        child: const Column( // Menggunakan Column untuk menata elemen secara vertikal.
          crossAxisAlignment: CrossAxisAlignment.center, // Konten di tengah.
          children: [
            CircleAvatar( // Widget untuk menampilkan gambar profil.
              radius: 60, // Radius dari avatar.
              backgroundImage: AssetImage('assets/foto.jpeg'), // Gambar profil dari file lokal.
            ),
            SizedBox(height: 20), // Jarak vertikal antara elemen.
            Text(
              'Data Diri:', // Teks untuk menampilkan nama.
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8), // Jarak vertikal antara elemen.
            Column( // Menggunakan Column untuk menata elemen secara vertikal.
              crossAxisAlignment: CrossAxisAlignment.start, // Posisi teks di awal.
              children: [
                Text('Nama: Komang Indira Tri Jayanti', style: TextStyle(fontSize: 16)), // Teks nama.
                Text('Nim: 42230062', style: TextStyle(fontSize: 16)), // Teks NIM.
                Text('Prodi: Teknologi Informasi', style: TextStyle(fontSize: 16)), // Teks prodi.
              ],
            ),
            SizedBox(height: 20), // Jarak vertikal antara elemen.
            Text(
              'Deskripsi Diri:', // Teks header deskripsi diri.
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8), // Jarak vertikal antara elemen.
            Text(
              'Saya adalah seorang mahasiswi semester 5 yang memiliki minat dalam bidang teknologi dan pengembangan perangkat lunak.', // Teks deskripsi diri.
              textAlign: TextAlign.center, // Menyusun teks agar terletak di tengah.
              style: TextStyle(fontSize: 16), // Ukuran font untuk deskripsi.
            ),
            SizedBox(height: 20), // Jarak vertikal antara elemen.
            Text(
              'Kemampuan:', // Teks header kemampuan.
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8), // Jarak vertikal antara elemen.
            Column( // Menggunakan Column untuk menata elemen secara vertikal.
              crossAxisAlignment: CrossAxisAlignment.start, // Posisi teks di awal.
              children: [
                Text('- Pemrograman Flutter', style: TextStyle(fontSize: 16)), // Teks kemampuan 1.
                Text('- ', style: TextStyle(fontSize: 16)), // Teks kemampuan 2 (belum diisi).
                Text('- ', style: TextStyle(fontSize: 16)), // Teks kemampuan 3 (belum diisi).
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Kelas baru untuk konten Home
class HomeContent extends StatelessWidget { // Kelas untuk konten Home.
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun UI.
    return SingleChildScrollView( // Membuat tampilan scroll jika konten melebihi layar.
      child: Container(
        width: 600, // Lebar maksimum konten.
        padding: EdgeInsets.all(20.0), // Jarak antara konten dan tepi container.
        child: const Column( // Menggunakan Column untuk menata elemen secara vertikal.
          crossAxisAlignment: CrossAxisAlignment.center, // Konten di tengah.
          children: [
            Text(
              'Selamat datang di Halaman Home!', // Teks sambutan.
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Ukuran dan tebal font.
            ),
          ],
        ),
      ),
    );
  }
}
