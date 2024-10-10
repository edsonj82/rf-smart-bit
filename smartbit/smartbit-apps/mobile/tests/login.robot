*** Settings ***

Documentation        Login Tests Suite

Resource            ../resources/Base.resource

Test Setup            Start Session
Test Teardown        Finish Session

*** Test Cases ***
Should loggIn with CPF and Id
    SignIn with documents            00000014141
    User is logged In