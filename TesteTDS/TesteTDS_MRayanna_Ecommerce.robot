*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          Resources_TesteTDS_MRayanna_Ecommerce.robot
Suite Setup       Abrir Navegador Para Automation Exercise
Suite Teardown    Fechar Navegador

*** Test Cases ***
Cenário 1: Usuário se cadastra com sucesso no site
    [Documentation]    Cadastro de novo usuário no site
    ${RANDOM}=    Generate Random String    6    [LETTERS]
    Set Test Variable    ${EMAIL}    joao.silva${RANDOM}@example.com
    Set Suite Variable    ${EMAIL}
    Set Suite Variable    ${PASSWORD}
    Acessar Página de Cadastro
    Preencher Formulário de Cadastro    ${NAME}    ${EMAIL}
    Preencher Detalhes da Conta
    Verificar Mensagem de Sucesso Cadastro    Account Created!
    Fechar Navegador

Cenário 2: Login com credenciais válidas
    [Documentation]    Login com e-mail e senha válidos
    Abrir Navegador Para Automation Exercise
    Acessar Página de Login
    Efetuar Login    ${EMAIL}    ${PASSWORD}
    Verificar Mensagem de Sucesso Login    Logged in as ${NAME}

Cenário 3: Usuário autenticado realiza compra com sucesso
    [Documentation]    Finalização de compra autenticado
    Adicionar Produto ao Carrinho 1    ${PRODUCT1}    1
    Adicionar Produto ao Carrinho 2   ${PRODUCT2}    2
    Ir Para o Carrinho
    Iniciar Checkout
    Inserir Informações de Pagamento    ${NAME}
    Verificar Mensagem de Sucesso Compra    Order Placed Successfully!
    Fechar Navegador

Cenário 4: Usuário não autenticado tenta concluir a compra
    [Documentation]    Verifica se o usuário é redirecionado ao login ao tentar comprar sem estar autenticado
    Abrir Navegador Para Automation Exercise
    Adicionar Produto ao Carrinho 1    ${PRODUCT1}    1
    Ir Para o Carrinho
    Iniciar Checkout sem cadastro
    Verificar Redirecionamento Para Login