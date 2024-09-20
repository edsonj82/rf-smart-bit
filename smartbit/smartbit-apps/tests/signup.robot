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