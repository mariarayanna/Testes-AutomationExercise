# Testes Automatizados com Robot Framework - E-commerce

Este projeto contém scripts de testes automatizados desenvolvidos com **Robot Framework** e **SeleniumLibrary**, simulando o comportamento de usuários em um site de e-commerce.

## Objetivo

Automatizar fluxos principais do site Automation Exercise, simulando o comportamento de um usuário real, como:
- Cadastro de usuário
- Login com credenciais válidas
- Compra autenticada
- Tentativa de compra sem login

## Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
- Python 3.x
- Navegador Google Chrome

## Estrutura do Projeto

- **TesteTDS_MRayanna_Ecommerce.robot**  
  Contém os cenários principais de teste:
  - Cadastro de novo usuário
  - Login com credenciais válidas
  - Compra autenticada
  - Tentativa de compra sem login (redirecionamento)

- **Resources_TesteTDS_MRayanna_Ecommerce.robot**  
  Arquivo de recursos com keywords reutilizáveis, variáveis e bibliotecas importadas.

## Como Executar os Testes

1. Clone este repositório: ```bash
git clone https://github.com/mariarayanna/Testes-AutomationExercise.git
cd Testes-AutomationExercise
2. Instale as dependências necessárias: pip install robotframework selenium
3. Execute os testes com: robot TesteTDS_MRayanna_Ecommerce.robot

## Pré-requisitos
Python instalado
Chrome instalado
ChromeDriver compatível com a versão do seu Chrome

## Autora
Maria Rayanna Santos - Engenheira de testes de software.
  
