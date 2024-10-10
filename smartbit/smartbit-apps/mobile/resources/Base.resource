*** Settings ***
Documentation        Main folder of the tests automationa project to Mobile App

Library        AppiumLibrary

Resource        ./actions/login.resource
Resource        ./actions/account.resource
Resource        ./actions/mybody.resource
Resource        ./actions/menu.resource


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