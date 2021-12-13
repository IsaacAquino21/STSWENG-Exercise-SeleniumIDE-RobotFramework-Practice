*** Settings ***
Documentation   Exercise: SeleniumIDE & RobotFramework Practice
...
...             8 test cases using
...             the SeleniumLibrary

Library         SeleniumLibrary

*** Test Cases ***

Successful user log in
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Text    password    secret_sauce
    # click login
    Click Button    login-button
    # should be in products page
    Element Text Should Be    class:title    PRODUCTS
    # close browser
    [Teardown]    Close Browser

Unsuccessful user log in by a locked out user
# open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    locked_out_user
    # input password
    Input Text    password    secret_sauce
    # click login
    Click Button    login-button
    # Error message must be correct
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Sorry, this user has been locked out. 
    # close browser
    [Teardown]    Close Browser

Typed wrong password
# open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    locked_out_user
    # input password
    Input Text    password    password
    # click login
    Click Button    login-button
    # Error message must be correct
     Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Username and password do not match any user in this service 
    # close browser
    [Teardown]    Close Browser

Logged in as problem user and sees a broken inventory page
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    problem_user
    # input password
    Input Text    password    secret_sauce
    # click login
    Click Button    login-button
    # click on first link
    Click Link    id:item_4_title_link
    # name of product must not match
    Element Text Should Be    class:inventory_details_name    Sauce Labs Fleece Jacket
    # close browser
    [Teardown]    Close Browser   
