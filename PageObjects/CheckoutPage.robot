*** Settings ***
Library     SeleniumLibrary
Library     XML
Library     String


*** Variables ***
${Div_Checkout}             class:title
${Txt_Checkout}             Checkout
${Ipt_First_Name}           id:first-name
${Ipt_Last_Name}            id:last-name
${Ipt_Zip_Postal}           id:postal-code
${Btn_Continue}             id:continue
${Btn_Finish}               id:finish
${Div_Checkout_Complete}    id:checkout_complete_container
${Div_Complete_Header}      class:complete-header
${Txt_Complete_checkout}    Thank you for your order!
${Div_Item_Price}           class:item_pricebar
${Preco_Produto}            ${EMPTY}
${Div_Tax_Label}            class:summary_tax_label
${Preco_Taxa}               ${EMPTY}
${Div_Summary_Total}        class:summary_total_label
${Preco_Total}              ${EMPTY}


*** Keywords ***
Quando realizar o checkout completo incluindo as informações pessoais
    Element Should Contain    ${Div_Checkout}    ${Txt_Checkout}
    Input Text    ${Ipt_First_Name}    João
    Input Text    ${Ipt_Last_Name}    Silva
    Input Text    ${Ipt_Zip_Postal}    50680-000
    Click Button    ${Btn_Continue}

E confirmando as informações no checkout overview
    Wait Until Element Is Enabled    ${Div_Item_Price}
    Click Button    ${Btn_Finish}

Então serei redirecionado para a tela de checkout complete
    Element Should Contain    ${Div_Complete_Header}    ${Txt_Complete_checkout}

E confirmando as informações no checkout overview verificando se o valor total está correto
    ${Preco_Produto}=    Get Text    ${Div_Item_Price}
    ${Preco_Produto}=    Replace String    ${Preco_Produto}    $    ${EMPTY}
    ${Preco_Taxa}=    Get Text    ${Div_Tax_Label}
    ${Preco_Taxa}=    Replace String    ${Preco_Taxa}    Tax: $    ${EMPTY}
    ${Preco_Total}=    Get Text    ${Div_Summary_Total}
    ${Preco_Total}=    Replace String    ${Preco_Total}    Total: $    ${EMPTY}
    ${FSUM}=    Evaluate    float(${Preco_Produto}) + float(${Preco_Taxa})
    Should Be Equal As Numbers    ${FSUM}    ${Preco_Total}
    Click Button    ${Btn_Finish}
