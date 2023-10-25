*** Settings ***
Library     Browser
Resource    ../locators/locators_Page_ProductsView.robot

*** Keywords ***
I order the item
    [Arguments]                 ${itemName}     ${itemSize}     ${itemColor}    ${itemCount}
    Click                       xpath=//ol[@class = "products list items product-items"]//li//strong[@class = "product name product-item-name"]//a[contains(text(), "${itemName}")]
    Click                       xpath=//form[@id = "product_addtocart_form"]//div[contains(@aria-labelledby, "option-label-size")]/div[@option-label="${itemSize}"]
    Click                       xpath=//form[@id = "product_addtocart_form"]//div[contains(@aria-labelledby, "option-label-color")]/div[@option-label="${itemColor}"]
    Clear Text                  xpath=//form[@id = "product_addtocart_form"]//input[@name = "qty"]
    Type Text                   xpath=//form[@id = "product_addtocart_form"]//input[@name = "qty"]      ${itemCount}
    Click                       ${productsView_Button_AddToCart}
    Wait For Elements State     ${productsView_Button_Added}                                            stable