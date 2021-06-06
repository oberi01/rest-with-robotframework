*** Settings ***
Library  RequestsLibrary

*** Keywords ***
Session "${session}" to Site "${site}"
    Create Session    ${session}    ${site}   verify=true

URL Endpoint "${endpoint}" in Session "${session}"
    # fetch the URL of the latest comic png
    ${RESP}  GET On Session   ${session}    ${endpoint}
    Set Test Variable    ${RESP}

Response should be ok
    Should Be True    ${RESP.ok}
    log   ${RESP.content}