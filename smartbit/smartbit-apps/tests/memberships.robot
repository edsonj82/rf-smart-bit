*** Settings ***

Documentation        Tests suites of plans enrolls

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Should realize a new Memberships
    ${account}            Create Dictionary        
    ...    name=Paulo Cintura
    ...    email=paulo@cintura.com.br
    ...    cpf=05138356011

    ${plan}         Set Variable        Plano Black   

    
    ${credit_card}        Create Dictionary        
    ...    number=4242424242424242
    ...    holder=Paulo Cintura
    ...    month=11
    ...    year=2030
    ...    cvv=123

    Delete Account By Email         ${account}[email]
    Insert Account                  ${account}

    Go to Login pages
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
    
    Go to Memberships
    Go to Memberships form

    # Fill Text    css=input[aria-label=select_account]    Edson Santos
    Select account      ${account}[name]    ${account}[cpf]
    Select plan         ${plan}
    Fill payment card   ${credit_card}
    
    Click    css=button[type=submit] >> text=Cadastrar

    Toast should be    Matrícula cadastrada com sucesso.

# Capturar nome e cpf do usuario durante para realiar a matricula
    # Sleep    2
    # ${html}    Get Page Source
    # Log    ${html}

*** Keywords ***
Go to Memberships 
    Click    css=a[href="/memberships"]

    Wait For Elements State    css=h1 >> text=Matrículas    
    ...    visible    5

Go to Memberships form
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
    [Arguments]    ${card}
    Fill Text    css=input[name=card_number]        ${card}[number]
    Fill Text    css=input[name=card_holder]        ${card}[holder]
    Fill Text    css=input[name=card_month]         ${card}[month]
    Fill Text    css=input[name=card_year]          ${card}[year]
    Fill Text    css=input[name=card_cvv]           ${card}[cvv]