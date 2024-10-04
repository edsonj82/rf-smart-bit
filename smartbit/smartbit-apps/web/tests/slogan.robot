*** Settings ***
Documentation       Test to verify the SmartBit Slogan

Library     Browser

*** Test Cases ***
Should be show the Slogan in the Landing Page
    New Browser     browser=firefox       headless=False
    New Page        http://localhost:3000/
    Get Text        css=.headline h2        equal       Sua Jornada Fitness Começa aqui!
    