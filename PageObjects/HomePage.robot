*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${Div_Products}                     class:title
${Txt_Products}                     Products
${Btn_Add_To_Cart_Backpack}         id:add-to-cart-sauce-labs-backpack
${Btn_Add_To_Cart_Bike_Light}       id:add-to-cart-sauce-labs-bike-light
${Btn_Shopping_Cart}                class:shopping_cart_container
${Item_Price}                       class:inventory_item_price


*** Keywords ***
Então serei redirecionado para a tela Products
    Element Should Contain    ${Div_Products}    ${Txt_Products}

Dado que inclua o produto Sauce Labs Backpack no carrinho de compras
    Click Button    ${Btn_Add_To_Cart_Backpack}
    Click Element    ${Btn_Shopping_Cart}