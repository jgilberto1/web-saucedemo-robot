*** Settings ***
Library      SeleniumLibrary
*** Variables ***
${Div_Item_Name}               class:inventory_item_name
${Txt_Item_Name}               Sauce Labs Backpack
${Btn_Checkout}                id:checkout

*** Keywords ***
E o consulte na página de carrinho para a realização do checkout
    Element Should Contain             ${Div_Item_Name}    ${Txt_Item_Name}
    Click Button    ${Btn_Checkout}
    

