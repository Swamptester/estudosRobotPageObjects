*** Settings ***
Documentation     Aqui estarão todas as Keywords para manipular e validar API
Resource       ../config/package.robot


*** Keywords ***

Requisitar todos os atividades
    ${resp}=         GET      ${API.URL_BASE}${API.ACTIVITIES} 
    Set Global Variable    ${RESPONSE}    ${resp}

Conferir o status code    
   [Arguments]     ${status}     ${respglobal} 
   Status Should Be    ${status}    ${respglobal}

Conferir o reason    
    [Arguments]     ${status}     ${respglobal} 
    Should Be Equal As Strings    ${status}    ${respglobal.reason}


Conferir se retorna uma lista com "${cont}"atividades
    ${size}=    Get Length    ${RESPONSE.json()}
    Log Many    ${size}
    ${size}    Convert To String    ${size}
    Should Be Equal    ${size}    ${cont}


Requisitar a atividade "${id}"
    ${resp}=         GET      ${API.URL_BASE}${API.ACTIVITIES}/${id} 
    Set Global Variable    ${RESPONSEID}    ${resp}
Conferir se retorna todos os dados corretos da atividade "${id}"
    ${id}=    Convert To Integer    ${id}
    Should Be Equal    ${id}    ${RESPONSEID.json()}[id]
    Should Be Equal    Activity ${id}     ${RESPONSEID.json()}[title] 
    
Alterar o dado da atividade "${id}"
    ${status}=    Convert To Boolean    False
    ${body}       Create Dictionary    
    ...    id=${id}    
    ...    title=Atividade ${id}    
    ...    dueDate=2023-07-19T00:18:07.564Z    
    ...    completed=${status}
    Log Many    ${body}

    ${resp}    PUT    url=${API.URL_BASE}${API.ACTIVITIES}/${id}    json=${body}

    Conferir o status code    200       ${resp}
    Set Global Variable    ${RESPONSEID}    ${resp}

Conferir se retorna todos os dados da atividade "${id}"
    ${id}=    Convert To Integer    $[id]
    Should Be Equal    ${id}    ${RESPONSEID.json()}[id]
    Should Be Equal    Atividade ${id}     ${RESPONSEID.json()}[title] 
    

    