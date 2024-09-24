*** Settings ***

Documentation        Tests scenarios of client pre-register

Library        Browser

Resource        ../resources/base.resource

*** Test Cases ***
Should be start the client register

    ${account}        Get Fake Account

    Start session

    Submit signup form      ${account}

    Wait For Elements State            
    ...     text=Falta pouco para fazer parte da família Smartbit!    
    ...     visible    5

Field name is required 

    ${account}        Create Dictionary
    ...     name=${EMPTY}
    ...     email=edson@xpto.com
    ...     cpf=61023331012

    Start session
    
    Submit signup form      ${account}

    Wait For Elements State            
    ...     css=.notice    
    ...     visible    5

    Notice should be       Por favor informe o seu nome completo    

Field email is required 

    ${account}        Create Dictionary
    ...     name= Edson
    ...     email=${EMPTY}
    ...     cpf=61023331012

    Start session
    
    Submit signup form      ${account}

    Wait For Elements State            
    ...     css=.notice    
    ...     visible    5

    Notice should be       Por favor, informe o seu melhor e-mail

Field cpf is required 

    ${account}        Create Dictionary
    ...     name=Edson
    ...     email=edson@xpto.com
    ...     cpf=${EMPTY}

    Start session

    Submit signup form      ${account}

    Wait For Elements State            
    ...     css=.notice    
    ...     visible    5

    Notice should be       Por favor, informe o seu CPF

Field email is invalid 

    ${account}        Get Fake Account

    Start session

    Get Text        
    ...     css=#signup h2        
    ...     equal       
    ...     Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name            Edson
    Fill Text        id=email           teste*gamil.com.br
    Fill Text        id=cpf             61023331012
    #Click            xpath=//button[text()="Cadastrar"]
    Click            
    ...     css=button >> text=Cadastrar

    Wait For Elements State            
    ...     css=.notice    
    ...     visible    5

    Notice should be       Oops! O email informado é inválido

Field cpf is invalid 

    ${account}        Get Fake Account

    Start session

    Get Text        
    ...     css=#signup h2        
    ...     equal       
    ...     Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name            Edson
    Fill Text        id=email           teste@gamil.com.br
    Fill Text        id=cpf        123456789
    #Click            xpath=//button[text()="Cadastrar"]
    Click            
    ...     css=button >> text=Cadastrar

    Wait For Elements State            
    ...     css=.notice    
    ...     visible    5

    Notice should be       Oops! O CPF informado é inválido   

*** Keywords ***

Start session
    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/

Submit signup form
    [Arguments]     ${account}
    Get Text        
    ...     css=#signup h2        
    ...     equal       
    ...     Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name            ${account}[name]
    Fill Text        id=email           ${account}[email]
    Fill Text        id=cpf             ${account}[cpf]

    Click            
    ...     css=button >> text=Cadastrar

Notice should be
    [Arguments]     ${target}

    Get Text        css=form .notice     equal       ${target}   

