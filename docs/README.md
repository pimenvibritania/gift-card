# Deliverable Notes
- Source code repository git
    - Link repository [Bitbucket](https://bitbucket.org/pimenvibritania13/gift-card/src/master/)
- Export schema dan data pada Database (dalam bentuk .zip atau .rar)
    - Karenan di Laravel menggunakan migration jadi cukup jalankan perinah `php artisan migrate` untuk mengimport schema database & `php artisan db:seed` untuk seeding dummy data, untuk antisipasi sudah saya sediakan juga file sql berikut datanya. 
- Jelaskan alasan mengapa memilih menggunakan Laravel
    - Laravel selalu update dan mengoptimasi framework terbaru, sehingga dapat menjadi pilihan terbaik untuk membuat aplikasi web / REST API.
    - Mudah dan Dokumentasi Lengkap
    - Mempunyai Banyak Library Object Oriented
    - Tersedia Tool Artisan & Tinker
    - Memiliki Fitur Migration
- Jelaskan alasan mengapa memilih MySQL
    - Memiliki Database yang bisa di backups
    - Portability, Mysql dapat berjalan stabil pada berbagai sistem oprasi Windows, Linux, Sun Os, Mac, unix, dan masih banyak.
    - Dukungan komunitas yang terus berkembang
- Jelaskan mengenai schema DB yang dibuat
    - ![Schema DB](https://imgur.com/6VQ8sIl.png)


####NOTE - Untuk kalkulasi rating & Stock:
- Initial rating = 0 untuk product A
- Initial stock = 5 untuk product A
- Asumsi user A telah meredeem product A sebanyak 3 dan memberi rating senilai 3,67 
- Current rating = 3.67
- Current stock = 2
- Asumsi user B telah meredeem product A sebanyak 2 dan memberi rating senilai 4,25 
- Curren rating = (7,92/2) = 3,96
- Rating dibulatkan menjadi 4.0
- Current stock = 0
- Asumsi user C telah meredeem product A sebanyak 1
- User C tidak bisa meredeem, stock habis
