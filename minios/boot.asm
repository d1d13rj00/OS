    BITS 16
    ORG 0x7c00

start:
;---------------------------------
;Print a character using BIOS call
;---------------------------------

    mov ah,0x0e		    ; Print a character
    mov al,'D'		    ;
    int 0x10		    ; print call

;-------------------------------------------------------------
;Print a character using direct video memory access
;-------------------------------------------------------------

;Video memory starts at 0xB8000
;2 bytes per charater: 
;byte 1 for ASCII
;byte 2 for color attribute


    mov al,0
    mov ah,'*' 
    mov word [0xb8000],ax
;    mov ah,0		    ; Color attribute
;    mov dx,mystring	    ; Loading address for string data
;    call print_str

loop:			    ; Endless loop to end application
    jmp loop

;print_str:
;    mov cx,0		    ; keep counter for video memory
;print_str_start:
;    cmp [dx],0		    ; Check if end of string has been reached
;    jz print_str_end
;    mov [0xb8000 + cx],[dh]
;    mov [0xb8000 + cx + 1],ah
;    add cx,0x2		    ; Increase counter
;    inc dx		    ; Get new character
;    jmp print_str_start
;print_str_end:
;    ret			    ; Return to caller

end: 
    mystring: db 'miniOS',0
    times 510-($-$$) db 0   ; Pad code with zero
    dw	0xAA55		    ; Boot signature
