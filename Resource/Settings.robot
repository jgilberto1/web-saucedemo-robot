*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}         https://www.saucedemo.com/
${Browser}     chrome

*** Keywords ***
Start Automacao
    Open Browser  ${URL}     ${Browser}
    Maximize Browser Window
    Set Selenium Speed    0.5
Stop Automacao
    Capture Page Screenshot
    Close Browser