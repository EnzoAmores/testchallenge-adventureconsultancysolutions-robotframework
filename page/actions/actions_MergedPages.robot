*** Settings ***
Library     Browser
Resource    actions_Section_Header.robot
Resource    actions_Section_SideBar.robot
Resource    actions_Page_CreateAccount.robot
Resource    actions_Page_CustomerLogin.robot
Resource    actions_Page_ProductsView.robot
Resource    actions_Page_ShoppingCart.robot
Resource    ../../resources/itemsToOrder.robot

*** Keywords ***
I register a new account
    I go to Create New Customer Account page
    I fill up the required information

I login using the new registered account
    I go to Customer Login page
    I provide valid login credentials

I add several items in the cart
    I click the header tab                      Men
    I click the sidebar link                    Jackets
    I order the item                            ${itemOne_Name}     ${itemOne_Size}     ${itemOne_Color}    ${itemOne_Count}
    I click the header tab                      Women
    I click the sidebar link                    Shorts
    I order the item                            ${itemTwo_Name}     ${itemTwo_Size}     ${itemTwo_Color}    ${itemTwo_Count}

I validate the items added in the cart
    I go to Shopping Cart page
    I validate the item added                   ${itemOne_Name}     ${itemOne_Price}    ${itemOne_Size}     ${itemOne_Color}    ${itemOne_Count}
    I validate the item added                   ${itemTwo_Name}     ${itemTwo_Price}    ${itemTwo_Size}     ${itemTwo_Color}    ${itemTwo_Count}