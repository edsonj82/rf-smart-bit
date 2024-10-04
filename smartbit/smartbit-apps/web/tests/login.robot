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

Should not login as invalid password
    Go to Login pages
    Submit login form    sac@smartbit.com    abc123

    #Captura pagina html com o Toast visivel para fazer a validação (tudo visivel no log.thml)
    # Sleep       3
    # ${temp}    Get Page Source
    # Log        ${temp}

    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Should not login as invalid email
    Go to Login pages
    Submit login form    404@smartbit.com    abc123

    #Captura pagina html com o Toast visivel para fazer a validação (tudo visivel no log.thml)
    # Sleep       3
    # ${temp}    Get Page Source
    # Log        ${temp}

    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Try invalid login
    [Template]      Login verify notice
    ${EMPTY}                ${EMPTY}        Os campos email e senha são obrigatórios.
    ${EMPTY}                pwd123          Os campos email e senha são obrigatórios.
    sac@smartbit.com        ${EMPTY}        Os campos email e senha são obrigatórios.
    www.smartbit.com        pwd123          Oops! O email informado é inválido
    sac&smartbit.com        pwd123          Oops! O email informado é inválido
    asdfghjkgjhkghjk        pwd123          Oops! O email informado é inválido
    !@#$!@##@%$#$%$¨        pwd123          Oops! O email informado é inválido
    sac*smartbit.com        pwd123          Oops! O email informado é inválido
    www.smartbit.com        pwd123          Oops! O email informado é inválido
    smartbit.com@***        pwd123          Oops! O email informado é inválido



*** Keywords ***
Login verify notice
    [Arguments]        ${email}        ${password}        ${output_message}

    Go to Login pages
    Submit login form    ${email}        ${password}
    Notice should be    ${output_message}