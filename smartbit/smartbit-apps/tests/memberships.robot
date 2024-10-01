*** Settings ***

Documentation        Tests suites of plans enrolls

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Should realize a new Memberships

    ${data}    Get Json fixture    memberships    create    

    # ${account}            Create Dictionary        
    # ...    name=Paulo Cintura
    # ...    email=paulo@cintura.com.br
    # ...    cpf=05138356011

    # ${plan}         Set Variable        Plano Black   

    
    # ${credit_card}        Create Dictionary        
    # ...    number=4242424242424242
    # ...    holder=Paulo Cintura
    # ...    month=11
    # ...    year=2030
    # ...    cvv=123

    Delete Account By Email         ${data}[account][email]
    Insert Account                  ${data}[account]

    SignIn admin    

    
    Go to Memberships
    Go to Memberships form

    # Fill Text    css=input[aria-label=select_account]    Edson Santos
    Select account      ${data}[account][name]    ${data}[account][cpf]
    Select plan         ${data}[plan]
    Fill payment card   ${data}[credit_card]
    
    Click    css=button[type=submit] >> text=Cadastrar

    Toast should be    Matrícula cadastrada com sucesso.

# Capturar nome e cpf do usuario durante para realiar a matricula
    # Sleep    2
    # ${html}    Get Page Source
    # Log    ${html}
    