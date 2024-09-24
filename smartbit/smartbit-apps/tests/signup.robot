*** Settings ***

Documentation        Tests scenarios of client pre-register

Library        Browser

Resource        ../resources/base.resource

*** Test Cases ***
Should be start the client register

    ${account}        Get Fake Account

    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/
    Get Text        
    ...     css=#signup h2        
    ...     equal       
    ...     Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name            ${account}[name]
    Fill Text        id=email           ${account}[email]
    Fill Text        id=document        ${account}[document]
    #Click            xpath=//button[text()="Cadastrar"]
    Click            
    ...     css=button >> text=Cadastrar

    Wait For Elements State            
    ...     text=Falta pouco para fazer parte da família Smartbit!    
    ...     visible    5

Field name is required 

    ${account}        Get Fake Account

    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/
    Get Text        
    ...     css=#signup h2        
    ...     equal       
    ...     Faça seu cadastro e venha para a Smartbit!

    #Fill Text        id=name            ${account}[name]
    Fill Text        id=email           edson@xpto.com
    Fill Text        id=document        61023331012
    #Click            xpath=//button[text()="Cadastrar"]
    Click            
    ...     css=button >> text=Cadastrar

    Wait For Elements State            
    ...     css=.notice    
    ...     visible    5

    Get Text        css=form .notice     equal       Por favor informe o seu nome completo    

Field email is required 

    ${account}        Get Fake Account

    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/
    Get Text        
    ...     css=#signup h2        
    ...     equal       
    ...     Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name            Edson
    #Fill Text        id=email           edson@xpto.com
    Fill Text        id=document        61023331012
    #Click            xpath=//button[text()="Cadastrar"]
    Click            
    ...     css=button >> text=Cadastrar

    Wait For Elements State            
    ...     css=.notice    
    ...     visible    5

    Get Text        css=form .notice     equal       Por favor, informe o seu melhor e-mail

Field cpf is required 

    ${account}        Get Fake Account

    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/
    Get Text        
    ...     css=#signup h2        
    ...     equal       
    ...     Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name            Edson
    Fill Text        id=email           edson@xpto.com
    #Fill Text        id=document        61023331012
    #Click            xpath=//button[text()="Cadastrar"]
    Click            
    ...     css=button >> text=Cadastrar

    Wait For Elements State            
    ...     css=.notice    
    ...     visible    5

    Get Text        css=form .notice     equal       Por favor, informe o seu CPF

Field email is invalid 

    ${account}        Get Fake Account

    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/
    Get Text        
    ...     css=#signup h2        
    ...     equal       
    ...     Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name            Edson
    Fill Text        id=email           teste*gamil.com.br
    Fill Text        id=document        61023331012
    #Click            xpath=//button[text()="Cadastrar"]
    Click            
    ...     css=button >> text=Cadastrar

    Wait For Elements State            
    ...     css=.notice    
    ...     visible    5

    Get Text        css=form .notice     equal       Oops! O email informado é inválido    