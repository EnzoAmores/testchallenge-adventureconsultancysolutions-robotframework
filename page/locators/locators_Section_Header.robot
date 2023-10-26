*** Variables ***
${header_Link_CreateAnAccount}      xpath=//div[@class = "panel header"]//a[text() = "Create an Account"]
${header_Accordion_ProfileName}     xpath=//header[@class = "page-header"]//button[@data-action="customer-menu-toggle"]
${header_Link_SignOut}              xpath=//header[@class = "page-header"]//div[@class = "customer-menu"]//a[contains(text(), "Sign Out")]
${header_Link_SignIn}               xpath=//div[@class = "panel header"]//a[contains(text(), "Sign In")]
${header_Link_Men}                  xpath=//span[text() = "Men"]/ancestor::a
${header_Link_Women}                xpath=//span[text() = "Women"]/ancestor::a
${header_Link_Cart}                 xpath=//div[@class = "header content"]//a[@class = "action showcart"]
${header_Link_ViewCart}             xpath=//div[@class = "header content"]//a[@class = "action viewcart"]