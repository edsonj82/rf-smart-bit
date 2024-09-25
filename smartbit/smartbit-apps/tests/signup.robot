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

Field name is required 

    ${account}        Create Dictionary
    ...     name=${EMPTY}
    ...     email=edson@xpto.com
    ...     cpf=61023331012

    Submit signup form      ${account}
    Notice should be       Por favor informe o seu nome completo

Field email is required 

    ${account}        Create Dictionary
    ...     name= Edson
    ...     email=${EMPTY}
    ...     cpf=61023331012

    Submit signup form      ${account}
    Notice should be       Por favor, informe o seu melhor e-mail

Field cpf is required 

    ${account}        Create Dictionary
    ...     name=Edson
    ...     email=edson@xpto.com
    ...     cpf=${EMPTY}

    Submit signup form      ${account}
    Notice should be       Por favor, informe o seu CPF

Field email is invalid 
  
    ${account}        Create Dictionary
    ...     name=Edson
    ...     email=teste*gamil.com.br
    ...     cpf=123456789

    Submit signup form      ${account}
    Notice should be       Oops! O email informado é inválido

Field cpf is invalid 

    ${account}        Create Dictionary
    ...     name=Edson
    ...     email=teste@gamil.com.br
    ...     cpf=123456789

    Submit signup form      ${account}
    Notice should be       Oops! O CPF informado é inválido