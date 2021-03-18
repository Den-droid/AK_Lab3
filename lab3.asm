;-----------------------------------------
;--ЛР№3 Дослідження механізмів адресації--
;----------------Група №5:----------------
;--Яремчук Д.В.--Митєв А.Ю.--Шевчук Д.Д.--		 		  
;-----------------------------------------

IDEAL			; Директива - тип Асемблера tasm 
MODEL SMALL		; Директива - тип моделі пам’яті 
STACK 512		; Директива - розмір стеку 

DATASEG

; Оголошуємо двовимірний масив 16х16
array2Db db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah
		 db 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah, 2Ah

exCode db 0
CODESEG
Start:	
mov	ax, @data	  ; ax <- @data
mov	ds, ax		  ; ds <- ax

mov bx, 30h		  ; готуємо базовий регістр, пересування по вертикалі
mov si, 0Fh	      ; готуємо індексний регістр, пересування по горізонт.

; Використовуємо базово-індексну адресацію для запису даних в двовимірний масив
mov cx, 4 		  ; готуємо регістр cx для подальшого використання дла циклу 
ptr_1:
	mov al, 59h	  ; записуємо до молодшої частини ax Y
	add bx, 10h	  ; додаємо до регістру bx 10 для переходу до наступного рядку при запису даних в масив
	mov [array2Db+si+bx], al ; M(DS*16 + array2Db+SI+BX)
	dec si 		  ; зменшуємо значення в регістрі si для подальшого використання при запису даних в масив
	mov al, 41h   ; записуємо до молодшої частини ax A
	mov [array2Db+si+bx], al ; M(DS*16 + array2Db+SI+BX)
	loop ptr_1    ; виклик циклу, значення регістру сх зменшується на 1
	
mov cx, 4 		  ; готуємо регістр cx для подальшого використання дла циклу 
ptr_2:
	mov al, 56h	  ; записуємо до молодшої частини ax V
	add bx, 10h	  ; додаємо до регістру bx 10 для переходу до наступного рядку при запису даних в масив
	mov [array2Db+si+bx], al ; M(DS*16 + array2Db+SI+BX)
	dec si 		  ; зменшуємо значення в регістрі si для подальшого використання при запису даних в масив
	mov al, 44h	  ; записуємо до молодшої частини ax D
	mov [array2Db+si+bx], al ; M(DS*16 + array2Db+SI+BX)
	loop ptr_2    ; виклик циклу, значення регістру сх зменшується на 1
	
mov cx, 4 		  ; готуємо регістр cx для подальшого використання дла циклу 
ptr_3:
	mov al, 44h	  ; записуємо до молодшої частини ax D
	add bx, 10h	  ; додаємо до регістру bx 10 для переходу до наступного рядку при запису даних в масив
	mov [array2Db+si+bx], al ; M(DS*16 + array2Db+SI+BX)
	dec si 		  ; зменшуємо значення в регістрі si для подальшого використання при запису даних в масив
	mov al, 44h	  ; записуємо до молодшої частини ax D
	mov [array2Db+si+bx], al ; M(DS*16 + array2Db+SI+BX)
	loop ptr_3    ; виклик циклу, значення регістру сх зменшується на 1
	
; Exit:
mov ah,04Ch
mov al,[exCode]   ; отримання коду виходу
int 21h           ; виклик функції 04ch  
;----------
END Start
;----------