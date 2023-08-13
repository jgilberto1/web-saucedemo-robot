*** Settings ***
Library             SeleniumLibrary
Resource            ../PageObjects/LoginPage.robot
Resource            ../PageObjects/HomePage.robot
Resource            ../Resource/Settings.robot
Test Setup          Start Automacao
Test Teardown       Stop Automacao
        

*** Test Cases ***
Login com sucesso no saucedemo
    Dado que informe os dados de um usuário e senha
    Quando realizar o login
    Então serei redirecionado para a tela Products

Login sem sucesso no saucedemo usuário bloqueado
    Dado que informe os dados de um usuário bloqueado
    Quando realizar o login
    Então serei informado com a mensagem que o login falhou por bloqueio

Login sem sucesso no saucedemo senha invalida
    Dado que informe os dados de um usuário valido com senha invalida
    Quando realizar o login
    Então serei informado com a mensagem que falhou por login ou senha incorretos
