*** Settings ***
Library     Browser

*** Keywords ***
I click the sidebar link
    [Arguments]     ${sidebarLinkText}
    Click           xpath=//div[@class = "sidebar sidebar-main"]//a[text() = "${sidebarLinkText}"]