*** Settings ***
Library     Browser
Resource    ../../resources/browserSettings.robot
Resource    ../locators/locators_Section_Header.robot

*** Keywords ***
I go to Luma Marketplace
    New Browser                 ${browser}      headless=${isHeadless}
    New Context                 viewport={'width': ${browserWidth}, 'height': ${browserHeight}}
    New Page                    https://magento.softwaretestingboard.com/

I go to Create New Customer Account page
    Click                       ${header_Link_CreateAnAccount}

I logoff
    Wait For Elements State     ${header_Accordion_ProfileName}     stable
    Click                       ${header_Accordion_ProfileName}
    Click                       ${header_Link_SignOut}

I go to Customer Login page
    Click                       ${header_Link_SignIn}

I click the header tab
    [Arguments]                 ${headerTabName}
    Click                       xpath=//span[text() = "${headerTabName}"]/ancestor::a

I go to Shopping Cart page
    Click                       ${header_Link_Cart}
    Click                       ${header_Link_ViewCart}
