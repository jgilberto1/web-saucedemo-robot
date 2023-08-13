*** Settings ***
Library      SeleniumLibrary
*** Variables ***
${Div_Products}               class:title
${txt_Products}               Products

*** Keywords ***
Então serei redirecionado para a tela Products
    Element Should Contain             ${Div_Products}    ${txt_Products}
