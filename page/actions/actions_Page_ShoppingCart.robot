*** Settings ***
Library     Browser
Resource    ../locators/locators_Page_ShoppingCart.robot

*** Variables ***

*** Keywords ***
Initialize order total
    Set Global Variable     ${orderTotal}   0

I validate the item added
    [Arguments]             ${itemName}     ${itemPrice}    ${itemSize}     ${itemColor}    ${itemCount}
    Get Element Count       xpath=//table[@id = "shopping-cart-table"]//tr[@class = "item-info"]//a[contains(text(), "${itemName}")]                                                                >   0                   "The item \"${itemName}\" was not found!"
    Get Text                xpath=//table[@id = "shopping-cart-table"]//a[contains(text(), "${itemName}")]//ancestor::tr[@class = "item-info"]//td[@data-th= "Price"]//span[@class = "price"]       *=  ${itemPrice}        "The item \"${itemName}\" price is incorrect!"
    Get Attribute           xpath=//table[@id = "shopping-cart-table"]//a[contains(text(), "${itemName}")]//ancestor::tr[@class = "item-info"]//td[@data-th= "Qty"]//input          value           ==  ${itemCount}        "The item \"${itemName}\" quantity is incorrect!"
    ${itemSubTotal}=        Evaluate            ${itemPrice} * ${itemCount}
    ${itemSubTotal}=        Convert To Number   ${itemSubTotal}     2
    ${orderTotal}=          Evaluate            ${orderTotal} + ${itemSubTotal}
    ${orderTotal}=          Convert To Number   ${orderTotal}       2
    Set Global Variable     ${orderTotal}       ${orderTotal}
    ${itemSubTotal}=        Convert To String   ${itemSubTotal}
    ${itemSubTotal}=        Catenate            $${itemSubTotal}
    Get Text                xpath=//table[@id = "shopping-cart-table"]//a[contains(text(), "${itemName}")]//ancestor::tr[@class = "item-info"]//td[@data-th= "Subtotal"]//span[@class = "price"]    *=  ${itemSubTotal}     "The item \"${itemName}\" subtotal is incorrect!"
    [Return]                ${orderTotal}

I validate the total amount
    ${orderTotal}=          Convert To String   ${orderTotal}
    ${orderTotal}=          Catenate            $${orderTotal}
    Get Text                xpath=//tr[@class = "grand totals"]//span   *=  ${orderTotal}   "Order total is incorrect!"