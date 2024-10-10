
*** Settings ***

Documentation           Accounts actions and Elements

Library         AppiumLibrary

** Keywords ***
User is logged In
    ${element}      Set Variable        xpath=//android.widget.TextView[@resource-id="myAccountTitle"]

    Wait Until Element Is Visible       ${element}          5
    Element Text Should Be              ${element}          Sua transformação começa aqui!
