*** Settings ***
Documentation        Main folder of the tests automationa project to Mobile App

Library        AppiumLibrary
Library        JSONLibrary

Library         ../../libs/Database.py

Resource        ../../services/service.resource

Resource        ./actions/login.resource
Resource        ./actions/account.resource
Resource        ./actions/mybody.resource
Resource        ./actions/components/menu.resource
Resource        ./actions/components/popup.resource

*** Keywords ***
Start Session
    Open Application    http://localhost:4723        
    ...    platformName=Android
    ...    automationName=UIAutomator2
    ...    deviceName=Emulator
    ...    udId=emulator-5554
    ...    app=${EXECDIR}/app/smartbit-beta.apk
    ...    autoGrantPermissions=true
    
    Wait Until Page Contains    IP da API    20

Finish Session
    Capture Page Screenshot
    Close All Applications

# HELPERS
Get Json fixture
    [Arguments]        ${scenario}

    ${data}        Load Json From File    
    ...            ${EXECDIR}/resources/fixtures/data.json
    ...            encoding=utf-8
    
    RETURN        ${data}[${scenario}]