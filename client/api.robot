*** Settings ***
Library  RequestsLibrary

*** Test Cases ***
Get Entries
    Create Session    api   http://localhost:5000
    ${resp}  Get On Session   api    /entries
    log   ${resp.content}