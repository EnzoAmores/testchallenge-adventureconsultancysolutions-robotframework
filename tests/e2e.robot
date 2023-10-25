*** Settings ***
Library         Browser
Resource        ../page/actions/actions_Section_Header.robot
Resource        ../page/actions/actions_MergedPages.robot
Suite Teardown  Close Browser

*** Test Cases ***
EndToEnd
    I go to Luma Marketplace
    I register a new account
    I logoff
    I login using the new registered account
    I add several items in the cart
    I validate the items added in the cart
#    I validate the total amount