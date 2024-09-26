
*** Settings ***

Documentation           Login Page actions and Elements

Library         Browser

** Keywords ***
Go to Login pages
    Go To    http://localhost:3000/login


Submit login form
    [Arguments]    ${email}        ${password}

    Fill Text    css=input[name=email]                  ${email}
    Fill Text    css=input[placeholder='Sua Senha']     ${password}

    Click            
    ...     css=button >> text=Entrar

Toast should be 
    [Arguments]        ${expected_text}
    Wait For Elements State    css=.Toastify__toast-body    
    ...    visible    3
    ...    
    Get Text    css=.Toastify__toast-body    
    ...    equal    
    ...    ${expected_text}