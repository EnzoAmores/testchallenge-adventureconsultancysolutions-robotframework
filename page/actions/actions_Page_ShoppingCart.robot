*** Settings ***
Library     Browser
Library    XML
Resource    ../locators/locators_Page_ShoppingCart.robot

*** Keywords ***
I validate the item added
    [Arguments]             ${itemName}     ${itemPrice}    ${itemSize}     ${itemColor}    ${itemCount}
    Get Element Count       xpath=//table[@id = "shopping-cart-table"]//tr[@class = "item-info"]//a[contains(text(), "${itemName}")]                                                                >   0                   "The item \"${itemName}\" was not found!"
    Get Text                xpath=//table[@id = "shopping-cart-table"]//a[contains(text(), "${itemName}")]//ancestor::tr[@class = "item-info"]//td[@data-th= "Price"]//span[@class = "price"]       *=  ${itemPrice}        "The item \"${itemName}\" price is incorrect!"
    Get Attribute           xpath=//table[@id = "shopping-cart-table"]//a[contains(text(), "${itemName}")]//ancestor::tr[@class = "item-info"]//td[@data-th= "Qty"]//input          value           ==  ${itemCount}        "The item \"${itemName}\" quantity is incorrect!"
    ${itemSubTotal}=        Evaluate    ${itemPrice} * ${itemCount}
    ${itemSubTotal}=        Convert To String    ${itemSubTotal}
    Get Text                xpath=//table[@id = "shopping-cart-table"]//a[contains(text(), "${itemName}")]//ancestor::tr[@class = "item-info"]//td[@data-th= "Subtotal"]//span[@class = "price"]    *=  ${itemSubTotal}     "The item \"${itemName}\" subtotal is incorrect!"