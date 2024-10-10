
*** Settings ***

Documentation           PopUp actions and Elements

Library         AppiumLibrary

** Keywords ***
Popup with message
    [Arguments]    ${target}

    ${element}        Set Variable        xpath=//android.widget.TextView[@resource-id="android:id/message"]

    Wait Until Element Is Visible    ${element}        5
    Element Text Should Be    ${element}    ${target}
