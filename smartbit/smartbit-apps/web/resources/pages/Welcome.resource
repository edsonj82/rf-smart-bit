
*** Settings ***

Documentation           Welcome actions and Elements

Library         Browser

** Keywords ***

Verify welcome message
    Wait For Elements State            
    ...     text=Falta pouco para fazer parte da família Smartbit!    
    ...     visible    5