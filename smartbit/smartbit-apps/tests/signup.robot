*** Settings ***

Documentation        Tests scenarios of client pre-register

Library        Browser

*** Test Cases ***
Should be start the client register
    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/
    Get Text        css=#signup h2        equal       Faça seu cadastro e venha para a Smartbit!

    Fill Text        id=name            Edson José Santos
    Fill Text        id=email           edson@xpto.com
    Fill Text        id=document        38297527093
    #Click            xpath=//button[text()="Cadastrar"]
    Click            css=button >> text=Cadastrar

    Sleep    5  