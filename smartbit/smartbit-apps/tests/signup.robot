*** Settings ***

Documentation        Tests scenarios of client pre-register

#Library        Browser

Resource        ../resources/Base.resource


*** Test Cases ***
Should be start the client register

    ${account}        Get Fake Account

    Start session
    Submit signup form      ${account}
    Verify welcome message
    Take Screenshot

Field name is required 

    ${account}        Create Dictionary
    ...     name=${EMPTY}
    ...     email=edson@xpto.com
    ...     cpf=61023331012

    Start session
    Submit signup form      ${account}
    Notice should be       Por favor informe o seu nome completo
    Take Screenshot    

Field email is required 

    ${account}        Create Dictionary
    ...     name= Edson
    ...     email=${EMPTY}
    ...     cpf=61023331012

    Start session
    Submit signup form      ${account}
    Notice should be       Por favor, informe o seu melhor e-mail
    Take Screenshot

Field cpf is required 

    ${account}        Create Dictionary
    ...     name=Edson
    ...     email=edson@xpto.com
    ...     cpf=${EMPTY}

    Start session
    Submit signup form      ${account}
    Notice should be       Por favor, informe o seu CPF
    Take Screenshot

Field email is invalid 

  
    ${account}        Create Dictionary
    ...     name=Edson
    ...     email=teste*gamil.com.br
    ...     cpf=123456789

    Start session
    Submit signup form      ${account}
    Notice should be       Oops! O email informado é inválido
    Take Screenshot

Field cpf is invalid 

    ${account}        Create Dictionary
    ...     name=Edson
    ...     email=teste@gamil.com.br
    ...     cpf=123456789

    Start session
    Submit signup form      ${account}
    Notice should be       Oops! O CPF informado é inválido
    Take Screenshot
