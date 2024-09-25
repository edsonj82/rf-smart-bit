*** Settings ***

Documentation     Folder main of the Robot Project

Library         Browser
Library         libs/Account.py

Resource        pages/Landing.resource
Resource        pages/Welcome.resource

*** Keywords ***

Start session
    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/