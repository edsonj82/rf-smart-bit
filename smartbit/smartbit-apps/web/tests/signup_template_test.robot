*** Settings ***

Documentation        Tests scenarios of client pre-register

#Library        Browser

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown    Take Screenshot


*** Test Cases ***
Should be start the client register

    ${account}        Get Fake Account

    Submit signup form      ${account}
    Verify welcome message

Tentativa de pré-cadastro
    [Template]        Attempt signup
    ${EMPTY}        edson@xpto.com          61023331012             Por favor informe o seu nome completo
    Edson           ${EMPTY}                61023331012             Por favor, informe o seu melhor e-mail
    Edson           edson@xpto.com          ${EMPTY}                Por favor, informe o seu CPF
    Edson           edson*xpto.com          61023331012             Oops! O email informado é inválido
    Edson           edson&xpto.com          61023331012             Oops! O email informado é inválido
    Edson           www.xpto.com            61023331012             Oops! O email informado é inválido
    Edson           123321                  61023331012             Oops! O email informado é inválido
    Edson           ASDFÇL                  61023331012             Oops! O email informado é inválido
    Edson           asd@#$                  61023331012             Oops! O email informado é inválido
    Edson           edson@xpto.com          ${EMPTY}                Por favor, informe o seu CPF
    Edson           edson@xpto.com          123456789               Oops! O CPF informado é inválido
    Edson           edson@xpto.com          z2345678a               Oops! O CPF informado é inválido
    Edson           edson@xpto.com          12345678                Oops! O CPF informado é inválido
    Edson           edson@xpto.com          1                       Oops! O CPF informado é inválido
    Edson           edson@xpto.com          sasdfasdf               Oops! O CPF informado é inválido
    Edson           edson@xpto.com          $#%@#$%***              Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]        ${name}        ${email}        ${cpf}        ${output_message}
    
    ${account}        Create Dictionary
    ...     name=${name}
    ...     email=${email}
    ...     cpf=${cpf}

    Submit signup form      ${account}
    Notice should be       ${output_message}
