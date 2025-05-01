*** Settings ***
Library           SeleniumLibrary
Library           XML

*** Variables ***
${URL}               https://www.automationexercise.com/
${NAME}              João da Silva
${PASSWORD}          senha123
${PRODUCT1}          Blue Top
${PRODUCT2}          Men Tshirt
${PRODUCT1_PRICE}    500
${PRODUCT2_PRICE}    400

*** Keywords ***
Abrir Navegador Para Automation Exercise
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Fechar Navegador
    Close Browser

Acessar Página de Cadastro
    Go To    ${URL}/login

Preencher Formulário de Cadastro
    [Arguments]        ${name}    ${email}
    Input Text         xpath=//input[@placeholder='Name']    ${name}
    Input Text         xpath=//input[@data-qa="signup-email"]    ${email}
    Click Button       xpath=//button[contains(text(), 'Signup')]

Preencher Detalhes da Conta
    Click Element                 id=id_gender1
    Input Text                    id=password    ${PASSWORD}
    Input Text                    id=first_name    João
    Input Text                    id=last_name    Silva
    Input Text                    id=address1    Rua Exemplo, 123
    Select From List By Label     id=country    New Zealand
    Input Text                    id=city    Recife
    Input Text                    id=state    PE
    Input Text                    id=zipcode    12345
    Input Text                    id=mobile_number    81999999999
    Click Button                  xpath=//button[contains(text(), 'Create Account')]

Verificar Mensagem de Sucesso Cadastro
    [Arguments]                ${expected_message}
    Element Should Contain     xpath=//h2    ACCOUNT CREATED!

Acessar Página de Login
    Go To    ${URL}/login

Efetuar Login
    [Arguments]                        ${email}    ${password}
    Input Text                         xpath=//input[@data-qa='login-email']    ${email}
    Wait Until Element Is Visible      xpath=//input[@placeholder='Password']    timeout=10s
    Input Text                         name=password    ${password}
    Click Button                       xpath=//button[contains(text(), 'Login')]

Verificar Mensagem de Sucesso Login
     [Arguments]    ${expected_message}
    Wait Until Element Is Visible    xpath=//a[@href="/logout"]    timeout=10s
    Element Should Be Visible        xpath=//a[@href="/logout"]

Logout do Usuário
    Click Element                    xpath=//a[contains(text(), 'Logout')]
    Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Login')]    timeout=10s

Verificar Mensagem de Sucesso Compra
    [Arguments]                ${expected_message}
    Element Should Contain     xpath=//h2    ORDER PLACED!

Adicionar Produto ao Carrinho 1
    [Arguments]    ${produto}    ${quantidade}
    Wait Until Element Is Visible    xpath=//p[contains(text(), '${produto}')]/ancestor::div[contains(@class, 'productinfo')]    timeout=10s
    Scroll Element Into View         xpath=//p[contains(text(), '${produto}')]/ancestor::div[contains(@class, 'productinfo')]
    Click Element                    xpath=//p[contains(text(), '${produto}')]/ancestor::div[contains(@class, 'productinfo')]/following-sibling::div//a[contains(text(), 'Add to cart')]

    Wait Until Element Is Visible    xpath=//div[@class='modal-content']    timeout=10s
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'close-modal')]    timeout=5s
    Click Button                     xpath=//button[contains(@class, 'close-modal')]

Adicionar Produto ao Carrinho 2
    [Arguments]    ${produto}    ${quantidade}
    Wait Until Element Is Visible    xpath=//p[contains(text(), '${produto}')]/ancestor::div[contains(@class, 'productinfo')]    timeout=10s
    Scroll Element Into View         xpath=//p[contains(text(), '${produto}')]/ancestor::div[contains(@class, 'productinfo')]
    Click Element                    xpath=//p[contains(text(), '${produto}')]/ancestor::div[contains(@class, 'productinfo')]/following-sibling::div//a[contains(text(), 'Add to cart')]
    Wait Until Element Is Visible    xpath=//div[@class='modal-content']    timeout=10s
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'close-modal')]    timeout=5s
    Click Button                     xpath=//button[contains(@class, 'close-modal')]

Ir Para o Carrinho
    Wait Until Element Is Visible    xpath=//a[@href='/view_cart' and contains(., 'Cart')]    timeout=10s
    Click Element                    xpath=//a[@href='/view_cart' and contains(., 'Cart')]

Iniciar Checkout
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Proceed To Checkout')]    timeout=10s
    Click Element                    xpath=//a[contains(text(), 'Proceed To Checkout')]
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Place Order')]    timeout=10s
    Click Element                    xpath=//a[contains(text(), 'Place Order')]

Iniciar Checkout sem cadastro
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Proceed To Checkout')]    timeout=10s
    Click Element                    xpath=//a[contains(text(), 'Proceed To Checkout')]

Inserir Informações de Pagamento
    [Arguments]           ${name}
    Input Text            xpath=//input[@name='name_on_card']       ${name}
    Input Text            xpath=//input[@name='card_number']        4111111111111111
    Input Text            xpath=//input[@name='cvc']                123
    Input Text            xpath=//input[@name='expiry_month']       12
    Input Text            xpath=//input[@name='expiry_year']        2023
    Click Button          xpath=//button[@id='submit']

Verificar Redirecionamento Para Login
    Element Should Be Visible    xpath=//div[@class='modal-body']//a[@href='/login']

