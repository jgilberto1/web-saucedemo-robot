*** Settings ***
Library             SeleniumLibrary
Resource            ../PageObjects/LoginPage.robot
Resource            ../PageObjects/HomePage.robot
Resource            ../Resource/Settings.robot
Resource            ../PageObjects/CheckoutPage.robot
Resource            ../PageObjects/CartPage.robot
Test Setup          Start Automacao Login
Test Teardown       Stop Automacao


*** Test Cases ***
Fluxo simples de compra de um produto
    Dado que inclua o produto Sauce Labs Backpack no carrinho de compras
    E o consulte na página de carrinho para a realização do checkout
    Quando realizar o checkout completo incluindo as informações pessoais
    E confirmando as informações no checkout overview
    Então serei redirecionado para a tela de checkout complete

Fluxo simples de compra de um produto verificando se valor total corresponde ao valor do produto + Frete
    Dado que inclua o produto Sauce Labs Backpack no carrinho de compras
    E o consulte na página de carrinho para a realização do checkout
    Quando realizar o checkout completo incluindo as informações pessoais 
    E confirmando as informações no checkout overview verificando se o valor total está correto
    Então serei redirecionado para a tela de checkout complete
