*** Settings ***
Library     Browser
Library     String
Resource    ../locators/locators_Page_CreateAccount.robot
Resource    ../../resources/customerData.robot

*** Keywords ***
Generate Random Email
    ${random}               String.Generate Random String               8   [NUMBERS]
    ${randomEmail}          Catenate                                    user${random}@email.com
    Set Global Variable     ${randomEmail}
    [Return]                ${randomEmail}

I fill up the required information
    Type Text               ${createAccount_Input_FirstName}            ${firstName}
    Type Text               ${createAccount_Input_LastName}             ${lastName}
    Generate Random Email
    Type Text               ${createAccount_Input_Email}                ${randomEmail}
    Type Text               ${createAccount_Input_Password}             ${password}
    Type Text               ${createAccount_Input_ConfirmPassword}      ${password}
    Click                   ${createAccount_Button_CreateAnAccount}