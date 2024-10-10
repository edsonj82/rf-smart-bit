
*** Settings ***

Documentation           Accounts actions and Elements

Library         AppiumLibrary

** Keywords ***
SignIn with documents
    [Arguments]        ${cpf}
    Input Text    xpath=//android.widget.EditText[@resource-id="ipAddress"]    
    ...    192.168.1.10
    Input Text    xpath=//android.widget.EditText[@resource-id="cpf"]            
    ...    ${cpf}
    
    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]