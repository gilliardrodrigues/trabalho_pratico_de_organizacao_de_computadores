######################################## LEGENDA ########################################
# x5 = a
# x6 = b
# x10 = resul
# x11, x12 = argumentos da função 'multiplica'
#########################################################################################

### Implementação do 'main':
li x5, 3 # int a = 3;
li x6, -3 # int b = -3;
mv x11, x5 # Copia o conteúdo de x5 para x11, ou seja, x11 recebe o valor 3
mv x12, x6 # Copia o conteúdo de x6 para x12, ou seja, x11 recebe o valor -3
jal x1, multiplica # Chama o procedimento pela 1ª vez, recebendo como parâmetros 3 e -3
mv x11, x6 # Copia o conteúdo de x6 para x11, ou seja, x11 recebe o valor -3
mv x12, x10 # Copia o conteúdo de x10 para x12, ou seja, x12 recebe o valor -9
jal x1, multiplica # Chama o procedimento pela 2ª vez, recebendo como parâmetros -3 e -9
jal x1, end # Finaliza o programa

### Implementação da função 'multiplica':
multiplica:
	beq x11, x0, return # if(a == 0)
    beq x12, x0, return # if(b == 0)
    li x10, 0 # int resul = 0;
    blt x11, x0, loop1 # if(a < 0)
    beq x0, x0, loop2 # else
    
### Implementação do 1º while da função:
loop1:
	beq x11, x0, return # if(a == 0), parte do equivalente ao while (a != 0) em C
    sub x10, x10, x12 # resul = resul - b;
    addi x11, x11, 1 # a++;
    beq x0, x0, loop1 # Incondicional, parte do equivalente ao while (a != 0) em C
    
### Implementação do 2º while da função:
loop2:
	beq x11, x0, return # if(a == 0), parte do equivalente ao while (a != 0) em C
    add x10, x10, x12 # resul = resul + b;
    addi x11, x11, -1 # a--;
    beq x0, x0, loop2 # Incondicional, parte do equivalente ao while (a != 0) em C

### Saindo da função e retornando para o main:
return:
    jalr x0, 0(x1) # Volta para o endereço armazenado em x1
    
### Fim do programa:
end: