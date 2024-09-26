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