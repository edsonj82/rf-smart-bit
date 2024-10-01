*** Settings ***

Documentation     Folder main of the Robot Project

Library        JSONLibrary

Library         Browser
Library         libs/Account.py
Library         libs/Database.py

Resource        pages/Landing.resource
Resource        pages/Welcome.resource
Resource        pages/Login.resource
Resource        pages/Accounts.resource
Resource        pages/Memberships.resource

Resource        pages/components/Navbar.resource
Resource        pages/components/Toast.resource
Resource        pages/components/BoxNotice.resource

*** Keywords ***

Start session
    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/

# HELPERS
Get Json fixture
    [Arguments]        ${file_name}        ${scenario}

    ${data}        Load Json From File    
    ...            ${EXECDIR}/smartbit-apps/resources/fixtures/${file_name}.json
    ...            encoding=utf-8
    
    [return]        ${data}[${scenario}]

SignIn admin
    [Arguments]    ${email}        ${password}
    Go to Login pages
    Submit login form    ${email}    ${password}
    User is logged in    ${email}