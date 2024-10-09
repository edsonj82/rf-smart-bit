*** Settings ***

Documentation        Login Tests Suite

Resource            ../resources/Base.resource

Test Setup            Start Session
Test Teardown        Finish Session

*** Test Cases ***
Should loggIn with CPF and Id
    Input Text    xpath=//android.widget.EditText[@resource-id="ipAddress"]    192.168.1.10
    Input Text    xpath=//android.widget.EditText[@resource-id="cpf"]            00000014141
    
    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="myAccountTitle"]     5
    Element Text Should Be    xpath=//android.widget.TextView[@resource-id="myAccountTitle"]    Sua transformação começa aqui!