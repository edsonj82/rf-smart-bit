*** Settings ***

Documentation        Mybody Tests Suite

Resource            ../resources/Base.resource

Test Setup            Start Session
Test Teardown        Finish Session

*** Test Cases ***
Should register my physical measurements
    [Tags]    temp
    ${data}        Get Json fixture    update
    Insert Membership                ${data}

    SignIn with documents            ${data}[account][cpf]
    User is logged In
    
    Touch my body

    Send weight and height    Registre ou atualize suas medidas    ${data}[account]
    Popup with message        Seu cadastro foi atualizado com sucesso

    Set user token
    ${account}    Get account by name    ${data}[account][name]

    Should Be Equal    ${account}[weight]    ${data}[account][weight]
    Should Be Equal    ${account}[height]    ${data}[account][height]
