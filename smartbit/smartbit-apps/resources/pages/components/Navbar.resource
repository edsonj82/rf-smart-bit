
*** Settings ***

Documentation           Navbar actions and Elements

Library         Browser

*** Keywords ***
Go to Memberships 
    Click    css=a[href="/memberships"]

    Wait For Elements State    css=h1 >> text=Matrículas    
    ...    visible    5