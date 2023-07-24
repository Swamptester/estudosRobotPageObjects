*** Settings ***
Documentation    Aqui estarão os cenários dos testes de API
Resource    ../../src/config/package.robot

*** Test Cases ***
Consultar lista de Atividades
    [Tags]    LISTAAPI
    Requisitar todos os atividades
    Conferir o status code    200    ${RESPONSE}
    Conferir o reason    OK    ${RESPONSE}
    Conferir se retorna uma lista com "30"atividades

#robot -d tests/logs/ -i LISTAAPI tests/features/terceiroScriptTest.robot

Buscar um atividade especifica
    [Tags]    Atividade
    Requisitar a atividade "15"
    Conferir o status code    200    ${RESPONSEID}
    Conferir o reason    OK    ${RESPONSEID}
    Conferir se retorna todos os dados corretos da atividade "15"

    #robot -d tests/logs/ -i Atividade tests/features/terceiroScriptTest.robot

Alterar dados de uma atividade especifica
    [Tags]    Alteracao
    Alterar o dado da atividade "15"
    Conferir se retorna todos os dados da atividade "15"

    #robot -d tests/logs/ -i Atividade tests/features/terceiroScriptTest.robot

