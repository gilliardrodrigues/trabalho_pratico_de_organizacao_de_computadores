######################################## LEGENDA ########################################
# x10 = Potência (Pe)
# x11 = Torque (TO)
# x12 = Rotação (N)
# x5, x6, x7, x28 = auxiliares

# Fórmula:
# Pe = (π * TO * N) / 2250
# Considerando π = 3
#########################################################################################

### Implementação do 'main' para testes:
# Primeiro vamos testar o cálculo da potência (Pe), para isso usaremos TO = 300 e N = 400, o resultado em x10 deverá ser 160.
li x10, 0 # Pe = 0
li x11, 300 # TO = 300
li x12, 400 # N = 400
jal x1, turbao # Chama o procedimento 'turbao', passando como parâmetros Pe = 0, TO = 300 e N = 400
# Agora vamos testar o cálculo do torque (TO), usaremos Pe = 500 e N = 700, o resultado em x11 deverá ser 535.
li x10, 500 # Pe = 500
li x11, 0 # TO = 0
li x12, 700 # N = 700
jal x1, turbao # Chama o procedimento 'turbao', passando como parâmetros Pe = 500, TO = 0 e N = 700
# Por fim, vamos testar o cálculo da rotação (N), usaremos Pe = 600 e TO = 400, o resultado em x12 deverá ser 1125.
li x10, 600 # Pe = 600
li x11, 400 # TO = 400
li x12, 0 # N = 0
jal x1, turbao # Chama o procedimento 'turbao', passando como parâmetros Pe = 600, TO = 400 e N = 0
jal x1, fim # Finaliza o programa

### Implementação da função 'turbao':
turbao:
	li x5, 2250 # x5 = 2250
    li x6, 3 # x6 = 3
	beq x10, x0, clausula1 # if(Pe == 0)
    beq x11, x0, clausula2 # if(TO == 0)
    beq x12, x0, clausula3 # if(N == 0)

### Implementação da 1ª clásula da função:
clausula1:
    mul x7, x6, x11 # x7 = 3*TO
    mul x7, x7, x12 # x7 = (3*TO)*N
    div x10, x7, x5 # x10 = (3*TO*N)/2250
    jalr x0, 0(x1) # Volta para o endereço armazenado em x1

### Implementação da 2ª clásula da função:
clausula2:
    mul x7, x5, x10 # x7 = 2250*Pe
    mul x28, x6, x12 # x28 = 3*N
    div x11, x7, x28 # x11 = (2250*Pe)/(3*N)
    jalr x0, 0(x1) # Volta para o endereço armazenado em x1
    
### Implementação da 3ª clásula da função:
clausula3:
    mul x7, x5, x10 # x7 = 2250*Pe
    mul x28, x6, x11 # x28 = 3*TO
    div x12, x7, x28 # x12 = (2250*Pe)/(3*TO)
    jalr x0, 0(x1) # Volta para o endereço armazenado em x1

### Fim do programa:
fim:
	