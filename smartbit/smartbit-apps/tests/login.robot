*** Settings ***

Documentation        Tests scenarios of SAC Login

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Should be log in as a Gym Manager
    Go to Login pages
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
