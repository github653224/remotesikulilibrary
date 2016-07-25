*** Settings ***
Resource    common.robot
Suite Setup    Setup OCR suite
Test Setup    Start test application
Test Teardown    Log results and kill process
Force Tags    Local    OCR

*** Test Cases ***
Test image clicks locally
    [Template]   Click images
    Click Item    OK   ok_clicked.png
    Double Click Item    Cancel    cancel_double_clicked.png
    Right Click Item    Submit    submit_right_clicked.png
    
Local input of text 
	Wait Until Screen Contains    buttons.png
	Input Text    Test text    Test field    0.7    50    0
	Wait Until Screen Contains    filled_text_field.png

****Keyword****  
Setup OCR suite
    Set Test Image Directory    .${/}src${/}test${/}resources${/}testImages
    Enable OCR
       
Local typing of special keys    
    [Arguments]    ${keys}    @{modifiers}
    [Teardown]    Log results and kill process
    Start test application
	Wait Until Screen Contains    buttons.png
	Input Text    Test text    empty_text_field.png
	Wait Until Screen Contains    filled_text_field.png
	Type Keys    ${keys}    @{modifiers}
	Wait Until Screen Contains    filled_and_selected_text_field.png    0.9
