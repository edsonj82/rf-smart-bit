*** Settings ***

Documentation        Login Tests Suite

Resource            ../resources/Base.resource

Test Setup            Start Session
Test Teardown        Finish Session

*** Test Cases ***
Should loggIn with CPF and Id
    ${data}        Get Json fixture    login
    Insert Membership                ${data}

    SignIn with documents            ${data}[account][cpf]
    User is logged In

CPF not register
    SignIn with documents       48487877001
    Popup with message          Acesso não autorizado! Entre em contato com a central de atendimento

CPF invalid
    SignIn with documents       00000000000
    Popup with message          CPF inválido, tente novamente