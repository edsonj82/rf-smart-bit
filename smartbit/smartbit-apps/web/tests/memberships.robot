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
    Create new membership    ${data}
    Toast should be    Matrícula cadastrada com sucesso.

# Capturar nome e cpf do usuario durante para realiar a matricula
    # Sleep    2
    # ${html}    Get Page Source
    # Log    ${html}

Should not realize a Membership duplicate
    ${data}    Get Json fixture    memberships    duplicate

    # Delete Account By Email         ${data}[account][email]
    # Insert Account                  ${data}[account]
    Insert Membership                   ${data}

    SignIn admin    
    Go to Memberships
    # Create new membership    ${data}
    # Sleep    8
    Create new membership    ${data}
    Toast should be    O usuário já possui matrícula.


Should search by name
    # ${name}        Set Variable        Emily Stone
    ${data}        Get Json fixture    memberships    search

    Insert Membership    ${data}

    SignIn admin
    Go to Memberships
    Search by name        ${data}[account][name]
    Filter by name        ${data}[account][name]

Should delete a membership
    [Tags]    remove
    ${data}        Get Json fixture    memberships    remove

    Insert Membership    ${data}

    SignIn admin
    Go to Memberships

    Request removal by name    ${data}[account][name]
    Confirm removal
    Membership should not be visible    ${data}[account][name]




    # Search by name        ${data}[account][name]
    # Filter by name        ${data}[account][name]