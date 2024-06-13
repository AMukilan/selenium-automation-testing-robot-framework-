*** Settings ***
Library           SeleniumLibrary
Library           NopCommerceLibrary.py

*** Variables ***
${URL}            https://admin-demo.nopcommerce.com/
${USERNAME}     admin@yourstore.com
${PASSWORD}       admin

*** Test Cases ***
Login Test
    [Documentation]    Test logging into nopCommerce admin portal
    Open Browser To Login Page
    Input Username And Password
    Click Login
    Verify Login Success

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Input Username And Password
    Input Text    id=Email    ${USERNAME}
    Input Text    id=Password    ${PASSWORD}

Click Login
    Click Button    xpath=//button[contains(text(), 'Log in')]

Verify Login Success
    Title Should Be    Dashboard / nopCommerce administration
    Close Browser