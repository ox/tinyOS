[GLOBAL gdt_flush] ;allows C code to call gdt_flush()
[GLOBAL idt_flush]    ; Allows the C code to call idt_flush().

idt_flush:
   mov eax, [esp+4]  ; Get the pointer to the IDT, passed as a parameter. 
   lidt [eax]        ; Load the IDT pointer.
   ret

gdt_flush:
	mov eax, [esp+4]	;get the pointer to the GDT, passes as a param
	lgdt [eax]			;load the new GDT pointer
	
	mov ax, 0x10 		;0x10 is the offset in the GDT to our data segment
	mov ds, ax			;load all data segment selectors
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax
	jmp 0x08:.flush		; 0x08 is the offset to our code segment: far jump!
.flush:
	ret