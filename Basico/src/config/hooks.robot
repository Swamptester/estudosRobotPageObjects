*** Settings ***
Resource     package.robot
Variables    hooks.yml

*** Keywords ***
Inicializar o Navegador
    Open Browser    about:blank    chrome
    Maximize Browser Window
    Go to    ${URL}

Fechar o navegador
    Close Browser
