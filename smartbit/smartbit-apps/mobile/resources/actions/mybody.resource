
*** Settings ***

Documentation           Accounts actions and Elements

Library         AppiumLibrary

** Keywords ***
Send weight and height
    [Arguments]    ${message}    ${account}

    Wait Until Page Contains    ${message}    5

    Input Text          xpath=//android.widget.EditText[@resource-id="weight"]    ${account}[weight]
    Input Text          xpath=//android.widget.EditText[@resource-id="height"]    ${account}[height]
    Click Element       xpath=//android.widget.TextView[@text="Enviar minhas medidas"]