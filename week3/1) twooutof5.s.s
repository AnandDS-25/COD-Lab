.data 
a: .byte 0x12, 0x13, 0x03, 0x21, 0x86  
b: .byte 0x0, 0x0, 0x0, 0x0, 0x0       

.text
la x20, a              
la x21, b              
addi x22, x0, 5        
back:
    lbu x5, 0(x20)     
    jal x1, two_out_five 
    sb x19, 0(x21)     
    addi x20, x20, 1   
    addi x21, x21, 1   
    addi x22, x22, -1  
    bne x22, x0, back  

same:
    jal x0, same       
two_out_five:
    andi x6, x5, 0xE0  
    bne x6, x0, exit   
    addi x13, x0, 5    
    addi x25, x0, 0    

backk:
    andi x6, x5, 0x01  
    beq x6, x0, next   
    addi x25, x25, 1   

next:
    srli x5, x5, 1     
    addi x13, x13, -1  
    bne x13, x0, backk 

    addi x26, x0, 2    
    bne x25, x26, exit 

    addi x19, x0, 1    
    beq x0, x0, exit2  

exit:
    addi x19, x0, 2    

exit2:
    jalr x0, x1, 0     
