    BITS 16

start:

    times 510-($-$$) db 0   ; Pad code with zero
    dw	0xAA55		    ; Boot signature
