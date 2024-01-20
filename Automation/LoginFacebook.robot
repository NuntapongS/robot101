*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn
Library             String

Suite Teardown      Close Browser


*** Variables ***
${url_facebook}         https://www.facebook.com
${browser}              chrome
${title_facebook}       Facebook – log in or sign up
${input_user}           //*[@id="email"]
${input_pass}           //*[@id="pass"]
${btn_login}            //*[@class="_42ft _4jy0 _6lth _4jy6 _4jy1 selected _51sy"]
${username_fail}        xxxxxxxxxxx
${password_fail}        1234567895959
${txt_message}          Log in to Facebook
${username_success}     // real username
${password_success}     // real password


*** Test Cases ***
Login facebook - Fail
    [Tags]    fail
    Open Browser    ${url_facebook}    ${browser}
    Verify facebook page    ${title_facebook}
    Input Username and Password    ${input_user}    ${input_pass}    ${username_fail}    ${password_fail}
    Click Button Login    ${btn_login}
    Verify Login Fail    ${txt_message}

Login facebook - success
    [Tags]    success
    Open Browser    ${url_facebook}    ${browser}
    Verify facebook page    ${title_facebook}
    Input Username and Password    ${input_user}    ${input_pass}    ${username_success}    ${password_success}
    Click Button Login    ${btn_login}

*** Keywords ***
Verify facebook page
    [Arguments]    ${title}
    Title Should Be    ${title}

Input Username and Password
    [Arguments]    ${xpath_user}    ${xpath_pass}    ${username}    ${password}
    Element Should Be Visible    ${xpath_user}
    Element Should Be Visible    ${xpath_pass}
    Input Text    ${xpath_user}    ${username}
    Input Text    ${xpath_pass}    ${password}

Click Button Login
    [Arguments]    ${btn}
    Element Should Be Visible    ${btn}
    Click Element    ${btn}

Verify Login Fail
    [Arguments]    ${txt_message}
    Title Should Be    ${txt_message}
