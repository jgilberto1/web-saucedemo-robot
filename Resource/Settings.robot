*** Settings ***
Library     SeleniumLibrary
Resource    ../PageObjects/LoginPage.robot
Resource    ../PageObjects/HomePage.robot

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
Start Automacao Login
    Start Automacao
    Dado que informe os dados de um usuário e senha
    Quando realizar o login
    Então serei redirecionado para a tela Products    