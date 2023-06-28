*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    https://katalon-demo-cura.herokuapp.com
${user_name}    John Doe
${password}    ThisIsNotAPassword
*** Test Cases ***
Marcar Consulta
    [Documentation]    Teste para marcar uma consulta
    Open Browser    ${URL}    ${BROWSER}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep    5s    # Aguarda a página carregar
    
    Click Element    id:btn-make-appointment

    # Login
    Input Text    id=txt-username    ${user_name}
    Input Text    id=txt-password    ${password}
    Click Element    id=btn-login
    
    # Selecionar Facility
    Select From List By Value    id:combo_facility    Tokyo CURA Healthcare Center
    # Checkbox
    Select Checkbox    id:chk_hospotal_readmission
    # date
    Click Element    id=txt_visit_date
    Input Text       id=txt_visit_date    15/07/2022
    # Comment
    Click Element    id=txt_comment
    Input Text       id=txt_comment    Estou marcando essa consulta


    Click Element    id=btn-make-appointment
    Sleep    2s    # Aguarda a página carregar

    Click Element    id=btn-book-appointment
    Sleep    2s    # Aguarda a confirmação
    
    # Validações
    Page Should Contain    Appointment Confirmation
    Page Should Contain    Tokyo CURA Healthcare Center
    Page Should Contain    15/07/2022
    Page Should Contain    Estou marcando essa consulta

    
    # Sleep    2s    # Aguarda o login

    # Click Element    id=combo_facility
    # Select From List by Value    id=combo_facility    ${facility_value}

    # Click Element    id=chk_hospotal_readmission
    # Click Element    id=radio_program_medicare
    #    ${visit_date}

    

    # Click Element    id=btn-book-appointment
    # Sleep    2s    # Aguarda a confirmação

    # Capture Page Screenshot    screenshot.png

    Close Browser


