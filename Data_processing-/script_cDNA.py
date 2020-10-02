numeros = ['1','2','3','4','5','6','7','8','9']
DNA = input("Inserir a sequência de DNA: ")
while True:
  try:
    if DNA in numeros:
       raise ValueError #this will send it to the print message and back to the input option
       break
  except ValueError:
    print("Por favor, inserir valores novamente (DNA -> String).")
    break
  try:
    N1 = int(input("Inserir o valor de N1: "))
    N2 = int(input("Inserir o valor de N2: "))
    N3 = int(input("Inserir o valor de N3: "))
    N4 = int(input("Inserir o valor de N4: "))
    N = [N1,N2,N3,N4]
  except ValueError:
    print("Por favor, inserir valores novamente (N -> inteiro).")
    break
  if N1 >= N2 :
    print("Valores de N1 maiores ou iguais a N2.")
  elif N2 >= N3:
    print("Valores de N2 maiores ou iguais a N3.")
  elif N3 >= N4:
    print("Valores de N3 maiores ou iguais a N4.")
  elif N2 >= N4:
    print("Valores de N2 maiores ou iguais a N4.")
  elif N1 >= N3:
    print("Valores de N1 maiores ou iguais a N3.")
  elif max(N) > len(DNA):
    print("Valor máximo de N maior ou igual ao que o comprimento da sequência de DNA informada.")
  else:
    print(f"O valor do N1 digitado foi: {N1}\nO valor do N2 digitado foi: {N2}\nO valor do N3 digitado foi: {N3}\nO valor do N4 digitado foi: {N4}\nA Sequência de DNA digitada foi: {DNA}")
    CDS_1 = DNA[N1 - 1:N2]
    CDS_2 = DNA[N3 - 1:N4]
    if CDS_1.startswith('ATG'):
        if CDS_2.endswith('ATG') or CDS_2.endswith('TAG') or CDS_2.endswith('TAA') or CDS_2.endswith('TGA'):
            CDS_final = CDS_1 + CDS_2
            print(f"A concatenação de CDS1 e CDS2 é: {CDS_final}")
        else:
            print("Não possui códons de parada")
    else:
        print("Não possui o códon de início")
    break
