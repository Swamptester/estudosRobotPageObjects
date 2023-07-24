*** Settings ***
Documentation     Aqui estarão todos os testes automatizados do módulo de automação web
Resource    ../../src/config/package.robot

Test Setup    Inicializar o Navegador
Test Teardown    Fechar o Navegador


*** Test Cases ***

Cenário 1: Logar Com Sucesso
    [Tags]     Login
    Verificar se estamos na tela de login
    Preencher o LOgin e Senha com os dados válidos
    clicar no botão Login
    Verificar se estamos na tela principal

    #robot -i Login -d tests/logs/  tests/features/segundoScriptTest.robot
  

Cenário 2: Adicionar um produto pela tela de Detalhes
    [Tags]    Detalhes
    Verificar se estamos na tela de login
    Preencher o LOgin e Senha com os dados válidos
    Clicar no botão Login
    Verificar se estamos na tela principal
    Clicar no detalhe do produto
    Clicar no botão para adicionar no carrinho
    Verificar se o botão muda para remove
    Clicar no ícone do carrinho
    Verificar se o produto foi adicionado ao carrinho pelo nome

#robot -i Detalhes -d tests/logs/  tests/features/segundoScriptTest.robot

    

    
Cenário 3: Acessar o menu about com sucesso
    [Tags]    About
    Verificar se estamos na tela de login
    Preencher o LOgin e Senha com os dados válidos
    clicar no botão Login
    Verificar se estamos na tela principal
    clicar no menu
    Esperar o elemento About aparecer na tela
    Clicar na opção About
    verificar se abriu a página correta

#robot -i About -d tests/logs/  tests/features/segundoScriptTest.robot

