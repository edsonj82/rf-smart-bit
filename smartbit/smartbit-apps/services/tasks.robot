*** Settings ***

Documentation        Arquivo para testar o consumo da API com tasks

Library             RequestsLibrary
Resource    service.resource

*** Tasks ***
Testando a API
    Set user token
    Get account by name    Domique Toretto