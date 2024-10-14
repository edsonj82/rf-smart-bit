
*** Settings ***

Documentation           Login Page actions and Elements

Variables       ../env.py

Library         Browser

** Keywords ***
Go to Login pages
    Go To    ${BASE_URL}/login

Submit login form
    [Arguments]    ${email}        ${password}

    Fill Text    css=input[name=email]                  ${email}
    Fill Text    css=input[placeholder='Sua Senha']     ${password}

    Click            
    ...     css=button >> text=Entrar