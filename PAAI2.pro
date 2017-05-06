domains
kondisi = cond*
cond = string

facts	
nondeterm pertanyaan(integer,symbol)
nondeterm jawaban(integer,symbol)
nondeterm hasil(symbol,symbol)
nondeterm pola(integer)
person(kondisi)
false(cond)

predicates
nondeterm go(integer)
nondeterm aturan(symbol,symbol,symbol,integer,integer)
nondeterm data_pengamatan
nondeterm peraturan
nondeterm keluar
nondeterm tampilkel(kondisi)
nondeterm credit
nondeterm begin
nondeterm akhir(char)
kembali(char,char)

	
clauses

/* CREDIT */
person(["\n\tM Rizky Wahyu \t\t(1515015055)",			%isi list
	"\tKaton Nur Riyanto \t\t(1515015084)",		
	"\tFegy Altama \t\t(1515015097)",""]).	
	
%person("Nova Jatmiko","[1515015099]").	

tampilkel([H|T]):-
			not(false(H)),
			write(H),nl,
			tampilkel(T).
	
tampilkel([H|_]):-
			assertz(false(H)).

credit 	:-	write("\n\n==================================================\n"),
		write("=========== CREATED BY KELOMPOK 4 ================\n"),
		write("==================================================\n"),
		write("==================== B 2015 =======================\n"),
		write("==================================================\n"),
		person(Y),
		tampilkel(Y),
		write("\n==================================================\n"),nl.
		
		
credit.	
/* PROGRAM YANG PERTAMA DI JALANKAN */
begin	:-	write("\n\n\t\t<=================================>"),
		write("\n\t\t<======GAME PENJINAKKAN BOM======>"),
		write("\n\t\t<=================================>\n\n\n"),
		write("--> Jinakkan BOM <--\n1. Mulai Penjinakkan"),
		write("\n\n--> Information <--\n2. Penjelasan Permainan\n3. Credits\n4. Keluar \n\nSilahkan pilih menu yang anda inginkan :\n"),
		readint(X),go(X).
/* MENU AWAL */		
go(X):-
X=1, 	nl,peraturan,nl,nl,
	data_pengamatan;

X=2,	write("\n<=====================================================>\n"),
	write("\n\n\t<=================================>"),
	write("\n\t<==========CARA BERMAIN==========>"),
	write("\n\t<=================================>\n\n\n"),
	write("Disini kita bertindak sebagai penjinak bom . \njadi kita di haruskan untuk menjinakkan bom yang telah ada \ndengan menjawab pertanyaan-pertanyaan yang ada \nlalu jawaban tersebut akan disusun menjadi kode penjinakkan bom"),
	nl,nl,nl,write("Temukanlah! Nyawa banyak orang berada di tanganmu!\n"),
	write("\n<=====================================================>\n\n\n"),
	begin;

X=3, 
	credit,
	write("\n\n Apakah anda ingin kembali Ke Menu Utama\n[Y/N]"),
	readchar(A), akhir(A);
X<1,!;

X>3,!.

/* MULAI PERMAINAN */
data_pengamatan:-
	Lifes=1,
	write("Anda memiliki nyawa=",Lifes),
	pertanyaan(No,Tanya),
	write(Tanya),
	write("\nJawab: "),
	readln(Answer),
	jawaban(No,Jawab),
	aturan(Jawab,Answer,Tanya,No,Lifes),nl,nl.
	
	
data_pengamatan.

kembali(Y,Y):-!.		% cut berguna untuk mencegah lacak balik
kembali(_,_):-fail.		% fail berfungsi memaksa lacak balik
	
akhir(A):-kembali(A,'Y'), begin.	%fungsi ini akan di panggil pada redchar yang ada di bawah 		
akhir(A):-kembali(A,'y'), begin.	%yang mana jika kita menginputkan Y atau y maka akan kembali ke begin
akhir(_):-keluar.			%dan akan keluar jika kita memasukkan inputan lain			

/* TAMPILAN KOP AWAL DALAM PERMAINAN */
peraturan:-	
		write("==========================================\n"),
		write("= JAWAB DENGAN BENAR ATAU BOMB MELEDAK ="),
		write("\n==========================================\n").
		
/* TAMPILAN JIKA KITA INGIN KELUAR */
keluar:-	
		write("\n==========================================\n"),
		write("=         SELAMAT TINGGAL DAN TERIMAKASIH        ="),
		write("\n==========================================\n").
		
		
/* ATURAN YANG BERLAKU DALAM PERMAINAN */
aturan(Jawab,Ans,_,5,_):-
		/* aturan yang menghentikan dalam menampilkan pertanyaan yang di mana aturan ini berlaku jika pertanyaan kelima telah di tampilkan */
		Jawab=Ans,
		write("\n======================================"),
		write("\n======================================"),
		write("\n=\tKode yang Benar :                            ="),
		write("\n=\t\t\t\t          =\n=\t34 - 0541- 4289 - 21 - 1945               ="),
		write("\n=\t\t\t\t          =\n=\tBom Deactivated Congratulation !!   ="),
		write("\n======================================"),
		write("\n======================================"),
		write("\n\n Apakah anda ingin kembali Ke Menu Utama\n[Y/N]"),
		readchar(A), akhir(A).		%readchar untuk membaca karakter kalo misalkan kita tekan y kita akan kembali ke begin dan jika memasukkan inputan lain program akan keluar
			
aturan(Jawab,Ans,_,_,1):- 
		/* aturan yang berfungsi jika nyawa tersisa satu dan pemain menjawab dengan salah*/
		Jawab<>Ans, !, 
		write("\n\n======================================"),
		write("\n======================================"),
		write("\n=\t   BOOOOMMMMM !!!!                      ="),
		write("\n=\t      BOMB MELEDAK                        ="),
		write("\n======================================"),
		write("\n======================================"),
		write("\n\n Apakah anda ingin kembali Ke Menu Utama\n[Y/N]"),
		readchar(A), akhir(A).	
		
aturan(Jawab,Ans,Tanya,No,Life):-
		/* aturan yang berfungsi jika jawaban yang di inputkan oleh pemain benar*/
		Jawab=Ans,
		write("Jawaban Anda Benar"),nl,nl,
		write("Anda memiliki nyawa=",Life),
		Nos=No+1,
		pertanyaan(Nos,Tanyas),
		write(Tanyas),
		write("\nJawab: "),
		readln(Answer),
		jawaban(Nos,Jawabs),
		aturan(Jawabs,Answer,Tanyas,Nos,Life);
		
		/* aturan yang berfungsi jika jawaban yang di inputkan oleh pemain benar*/
		Jawab<>Ans, Lifes=Life-1,
		write("Jawaban salah"),
		write("Anda memiliki nyawa=",Lifes),
		Nos=No+1,
		pertanyaan(Nos,Tanyas),
		write(Tanyas),
		readln(Answers),
		jawaban(Nos,Jawabs),
		aturan(Jawabs,Answers,Tanyas,Nos,Lifes).



goal
consult("database.db"), 	%melakukan panggilan kepada databse dengan nama database.db
begin.