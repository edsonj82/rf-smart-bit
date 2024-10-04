
*** Settings ***

Documentation           Navbar actions and Elements

Library         Browser

*** Keywords ***

User is logged in
    [Arguments]        ${email}

    ${element}                  Set Variable            css=.logged-user
    Wait For Elements State     ${element}      visible     5
    Get Text                    ${element}      equal       ${email}
    
Go to Memberships 
    Click    css=a[href="/memberships"]

    Wait For Elements State    css=h1 >> text=Matrículas    
    ...    visible    5