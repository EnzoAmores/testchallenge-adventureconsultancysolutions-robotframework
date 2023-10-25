*** Settings ***
Library     Browser
Library     String
Resource    ../locators/locators_Page_CustomerLogin.robot
Resource    ../../resources/customerData.robot
Resource    actions_Page_CreateAccount.robot

*** Keywords ***
I provide valid login credentials
    Type Text   ${customerLogin_Input_Email}      ${randomEmail}
    Type Text   ${customerLogin_Input_Password}   ${password}
    Click       ${customerLogin_Button_SignIn}