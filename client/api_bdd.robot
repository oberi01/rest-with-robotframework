*** Settings ***
Resource  ./api_kw.robot
Library  RequestsLibrary


*** Test Cases ***
# As an API script user I want to get all existing password entries
Get All Password Entries
    Given Session "api" to Site "http://localhost:5000"
    When URL Endpoint "/entries" in Session "api"
    Then Response should be ok
