*** Settings ***

Documentation     Folder main of the Robot Project

Library         Browser
Library         libs/Account.py
Library         libs/Database.py

Resource        pages/Landing.resource
Resource        pages/Welcome.resource
Resource        pages/Login.resource
Resource        pages/Accounts.resource
Resource        pages/components/Toast.resource
Resource        pages/components/BoxNotice.resource

*** Keywords ***

Start session
    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/