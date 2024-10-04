*** Settings ***

Documentation           BoxNotice actions and Elements

Library         Browser

** Keywords ***

Notice should be
    [Arguments]     ${target}
    
    ${element}      Set Variable        css=form .notice
    
    Wait For Elements State            
    ...     ${element}    
    ...     visible    5

    Get Text        
    ...     css=form .notice     equal       ${target}   