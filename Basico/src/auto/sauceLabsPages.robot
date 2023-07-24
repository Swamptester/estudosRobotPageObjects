*** Settings ***
Documentation    Aqui constarão todas a interações/ações dentro das paginas do Sauce Labs
Resource    ../config/package.robot

*** Variables ***
${NOME_PRODUTO}    


*** Keywords ***



Verificar se estamos na tela de login
    Wait Until Element Contains    xpath=${LOGIN.Title}    ${LOGIN.TitleText}

Preencher o LOgin e Senha com os dados válidos
    Input Text     xpath=${LOGIN.User}    ${LOGIN.UserText}
    Input Text    xpath=${LOGIN.PWD}    ${LOGIN.PWDText}

Clicar no botão Login
     Click Element    id=${LOGIN.BTLogin} 
    
Verificar se estamos na tela principal
    Wait Until Element Contains    xpath=${MENUPRINCIPAL.Title}   ${MENUPRINCIPAL.ProdTitleText}

   
Clicar no detalhe do produto 
     #Armazenar o nome do produto em uma variável
    ${NOME_PRODUTO}    Get Text    ${MENUPRINCIPAL.ProdTitle}
    Click Element    xpath=${MENUPRINCIPAL.ProdTitle}
    Wait Until Element Is Visible    id=${DETALHEDOPRODUTO.BTVoltar}

Clicar no botão para adicionar no carrinho
    Click Element    id=${DETALHEDOPRODUTO.BTAdicionarProd}

Verificar se o botão muda para remove
    Wait Until Element Is Visible    id=${DETALHEDOPRODUTO.BTRemoverProd}

Clicar no ícone do carrinho
    Click Element    xpath=${DETALHEDOPRODUTO.ClicarBotaoCarrinho}

Verificar se o produto foi adicionado ao carrinho pelo nome
     Wait Until Page Contains Element    xpath=${CARRINHO.ProdCarrinho}
     
    ${TEXTO_ELEMENTO}    Get Text    ${CARRINHO.ProdCarrinho}
    Should Contain    ${TEXTO_ELEMENTO}    ${NOME_PRODUTO}

clicar no menu
    Click Element    id=${MENUPRINCIPAL.BTMenu}

Esperar o elemento About aparecer na tela
    Wait Until Element Is Visible     id=${MENUPRINCIPAL.OPAbout}

Clicar na opção About
    Click Element    id=${MENUPRINCIPAL.OPAbout}
    
verificar se abriu a página correta
    Wait Until Element Is Visible    xpath=${EXTERNALSITE.BTGetStartedFree}