*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${Ipt_UserName}             id:user-name
${Ipt_Password}             id:password
${Btn_Login}                id:login-button
${Btn_Login_Container}      login_button_container
${Txt_Error_Locked}         Sorry, this user has been locked out.
${Txt_Error_Not_Match}      Username and password do not match any user   in this service


*** Keywords ***
Dado que informe os dados de um usuário e senha
    Wait Until Element Is Enabled    ${Ipt_UserName}    10
    Input Text    ${Ipt_UserName}    standard_user
    Input Text    ${Ipt_Password}    secret_sauce

Quando realizar o login
    Click Button    ${Btn_Login}

Dado que informe os dados de um usuário bloqueado
    Wait Until Element Is Enabled    ${Ipt_UserName}    10
    Input Text    ${Ipt_UserName}    locked_out_user
    Input Text    ${Ipt_Password}    secret_sauce

Então serei informado com a mensagem que o login falhou por bloqueio
    Element Should Contain    ${Btn_Login_Container}    ${Txt_Error_Locked}

Dado que informe os dados de um usuário valido com senha invalida
    Wait Until Element Is Enabled    ${Ipt_UserName}    10
    Input Text    ${Ipt_UserName}    standard_user
    Input Text    ${Ipt_Password}    secret

Então serei informado com a mensagem que falhou por login ou senha incorretos
    Element Should Contain    ${Btn_Login_Container}    ${Txt_Error_Not_Match}


