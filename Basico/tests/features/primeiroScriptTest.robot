*** Settings ***
Documentation    Aqui estarão presentes todos os testes iniciais do curso de Robot Framework

*** Variables ***
&{PESSOA}    nome=Wesley    sobrenome=Prado    idade=41    nacionalidade=BR    cpf=123456789    rg=111111111111
@{FRUTAS}    Banana    Maçã    Jambo    Morango    Pinha    Abacaxi

*** Test Cases ***
Cenário 1: Imprimir dicionário no console
    Log To Console    ${PESSOA['nome']}
    Log To Console    ${PESSOA['sobrenome']}
    Log To Console    ${PESSOA['idade']}
    Log To Console    ${PESSOA['nacionalidade']}
    Log To Console    ${PESSOA['cpf']}
    Log To Console    ${PESSOA['rg']}

Cenário 2: Imprimir Lista de frutas no console
    [Tags]    LISTA
    Log To Console    ${FRUTAS[0]}
    Log To Console    ${FRUTAS[1]}
    Log To Console    ${FRUTAS[2]}
    Log To Console    ${FRUTAS[3]}
    Log To Console    ${FRUTAS[4]}
    Log To Console    ${FRUTAS[5]}

Cenário 3: Somar dois valores
    [Tags]    SOMA
    somar dois números    10    30
    Somar de dois números entre 30 e 50

Cenário 4: Criar e-mail
    [Tags]    EMAIL
    ${EMAIL}    criar e-mail    Zé    DasCouve    21
    Log     ${EMAIL}

Cenário 5: Contar de 0 a 9
    [Tags]    Contar
    Contar de "0" a "9"

Cenário 6: Percorrer lista de frutas
    [Tags]    LISTAFRUTAS
    Percorrer lista de frutas

Cenário 7: Verificvar nomes
    [Tags]     NOME
    Verificar se o Nome "Fabiano" é igual a Maria ou João

Cenário 8: Imprimir Numeros
    [Tags]    NUMEROS
    Verificar se o Número "11" é igual a 5 ou 8

    
    



*** Keywords ***
somar dois números 
    [Arguments]    ${NUM_A}    ${NUM_B}
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    ${SOMA}
    [Return]    ${SOMA}

Somar de dois números entre ${NUM_A} e ${NUM_B}    
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    ${SOMA}
    [Return]    ${SOMA}

criar e-mail
    [Arguments]    ${nome}    ${sobrenome}    ${idade}   
     ${EMAIL}    Catenate    SEPARATOR=_    ${nome}${sobrenome}${idade}@robot.com
    Log To Console    ${EMAIL}
    [Return]    ${EMAIL} 

Contar de "${NUM_A}" a "${NUM_B}"
    ${NUM_B_PLUS_ONE}    Evaluate    ${NUM_B}+1
    FOR    ${contador}    IN RANGE    ${NUM_A}    ${NUM_B_PLUS_ONE}
        Log To Console    ${contador}
    END

Percorrer lista de frutas
    @{FRUTAS}    Create List    Banana    Abacaxi    Morango    Uva
    FOR    ${fruta}    IN    @{FRUTAS}
        Log To Console    ${fruta}
    END
Verificar se o Nome "${NOME}" é igual a Maria ou João
    IF  "${NOME}" == "Maria"
        Log To Console    Vou fazer isso aqui só quando for Maria
    ELSE IF    "${NOME}" == "João"    
        Log To Console    Vou fazer isso aqui só quando for João
    ELSE
        Log To Console    Vou fazer isso aqui só quando for qualquer outro nome.
    END

Verificar se o Número "${NUMERO}" é igual a 5 ou 8
    [Documentation]    Imprime a frase "Estou no número:${NUMERO}" se for 5 ou 8, caso contrário, imprime "Número inválido".
    ${VALIDO}    Run Keyword And Return Status    Should Be Equal As Strings    ${NUMERO}    5
    ${VALIDO2}    Run Keyword And Return Status    Should Be Equal As Strings    ${NUMERO}    8
    IF    ${VALIDO} or ${VALIDO2}
        Log To Console    Estou no número: ${NUMERO}
    ELSE
        Log To Console    Número inválido
    END
     
