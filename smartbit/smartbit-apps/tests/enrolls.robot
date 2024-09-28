*** Settings ***

Documentation        Tests suites of plans enrolls

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Should realize a new Enrolls
    Go to Login pages
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
    
    Go to Enrolls
    Go to Enrolls form

    # Fill Text    css=input[aria-label=select_account]    Edson Santos
    Select account     Edson Santos    69260657059

    Select plan        Plano Black

    Fill payment card    
    ...    4242424242424242
    ...    Edson José
    ...    11
    ...    2030
    ...    123
    
    Click    css=button[type=submit] >> text=Cadastrar

    Toast should be    Matrícula cadastrada com sucesso.

# Capturar nome e cpf do usuario durante para realiar a matricula
    # Sleep    2
    # ${html}    Get Page Source
    # Log    ${html}

*** Keywords ***
Go to Enrolls 
    Click    css=a[href="/memberships"]

    Wait For Elements State    css=h1 >> text=Matrículas    
    ...    visible    5

Go to Enrolls form
    Click    css=a[href="/memberships/new"]

    Wait For Elements State    css=h1 >> text=Nova Matrícula    
    ...    visible    5

Select account
    [Arguments]    ${name}    ${cpf}

    Fill Text       css=input[aria-label=select_account]    ${name}
    Click           css=[data-testid="${cpf}"]

Select plan
    [Arguments]    ${plan}
    Fill Text    css=input[aria-label=select_plan]      ${plan}
    Click        css=div[class$=option] >> text=${plan}

Fill payment card
    [Arguments]    ${number}    ${holder}    ${month}    ${year}    ${cvv}
    Fill Text    css=input[name=card_number]        ${number}
    Fill Text    css=input[name=card_holder]        ${holder}
    Fill Text    css=input[name=card_month]         ${month}
    Fill Text    css=input[name=card_year]          ${year}
    Fill Text    css=input[name=card_cvv]           ${cvv}