facts
nondeterm pertanyaan(integer,symbol)
nondeterm jawaban(integer,symbol)
nondeterm hasil(symbol,symbol)
clauses

jawaban(1,"34").
jawaban(2,"0541").
jawaban(3,"4289").
jawaban(4,"21").
jawaban(5,"1945").
pertanyaan(1,"\nAda Berapa Provinsi kah Negara Indonesia ?").
pertanyaan(2,"\nKode telepon daerah Kota Samarinda ?").
pertanyaan(3,"\nSelesaikan hitungan berikut 5*55+28/2+4000 ?").
pertanyaan(4,"\nTanggal Lahir RA Kartini?").
pertanyaan(5,"\nTahun Kemerdekaan Negara Indonesia ?").

/*hasil(berhasil,"Kode yang Benar : \n\n34 - 0541 - 4289 - 10 - 1945\n\nBom Deactivated Congratulation !! ").
hasil(gagal,"BOOOMMMMMM !!! gagal \n\n").*/
goal
save("database.db").