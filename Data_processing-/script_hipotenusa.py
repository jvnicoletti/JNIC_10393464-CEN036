#importando biblioteca para o cálculo da raíz quadrada
import math
#estabelecendo laço de repetição para que o usuário insira um valor que atenda as condições
while True:
#pedindo ao usuário o input de um valor inteiro
  try:
    a = int(input('Insira o valor do 1° cateto (0<a<1000): '))
#informando o usuário que o valor informado não é inteiro, e vai pedir para inputar novamente o dado
  except ValueError:
    print("Por favor, inserir valor inteiro.")
    continue
#verificando se o valor inputado está dentro do range de valor desejado
#se não atender, o loop irá continuar e será exibida a seguinte imagem
  if a < 0 or a > 1000:
     print("Valores fora do range definido.")
#caso atenda aos valores desejados o laço é cortado com o comando break
  else:
    print(f"O valor do 1° cateto digitado foi: {a}")
    break
#estabelecendo laço de repetição para que o usuário insira um valor que atenda as condições
while True:
#pedindo ao usuário o input de um valor inteiro
  try:
    b = int(input('Insira o valor do 2° cateto (0<b<1000): '))
#informando o usuário que o valor informado não é inteiro, e vai pedir para inputar novamente o dado
  except ValueError:
    print("Por favor, inserir valor inteiro.")
    continue
#verificando se o valor inputado está dentro do range de valor desejado
#se não atender, o loop irá continuar e será exibida a seguinte imagem
  if b < 0 or b > 1000:
     print("Valores fora do range definido.")
#caso atenda aos valores desejados o laço é cortado com o comando break
  else:
    print(f"O valor do 2° cateto digitado foi: {b}")
    break

#realizando o cálculo da hipotenusa
hip = math.sqrt((a**2)+(b**2))
#printando resultados com duas casas decimais
print(f"O valor da hipotenusa é: {hip:.2f} \nO valor do quadrado da hipotenusa é: {hip**2:.2f}")