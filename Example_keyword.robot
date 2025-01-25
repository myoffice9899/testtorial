*** Settings ***
Library    Collections
Library    OperatingSystem
Library    BuiltIn



*** Keywords ***
Greet User
    [Arguments]    ${name}
    Log    Hello, ${name}
Calculate Division
    [Arguments]    ${a}    ${b}
    ${result}    Evaluate    ${a} / ${b}
    Set Test Variable    ${result}





*** Test Cases ***
TC_01_Example Of Log
    [Tags]  Log
    Log    This is a log message
TC_02_Example Of Sleep
    [Tags]  Sleep
    Sleep    5s
    Log    Test resumed after 5 seconds
TC_03_Example Of Should Be Equal
    [Tags]  Create List
    @{fruits}    Create List    Apple    Banana    Cherry
    Log    ${fruits}

TC_04Example Of Should Be Equal
    [Tags]  Should Be Equal
    Should Be Equal    10    10

TC_05_Example Of Should Contain
    [Tags]    Should Contain
    @{colors}    Create List    Red    Green    Blue
    Should Contain    ${colors}    Green


TC_06_Example Of Get Length
    [Tags]   Get Length
    @{fruits}    Create List    Apple    Banana
    ${length}    Get Length    ${fruits}
    Log    Length is ${length}
TC_07_Example Of Append To List
    [Tags]  Append To List
    @{fruits}    Create List    Apple    Banana
    Append To List    ${fruits}    Mango
    Log    ${fruits}

TC_08_Example Of Run Keywords
    [Tags]  Run Keywords
    Run Keywords    Log    Step 1    AND    Log    Step 2

TC_09_Example Of Run Keyword If
    [Tags]  Run Keyword If
    ${value}    Evaluate    10 > 5
    Run Keyword If    ${value}    Log    Condition is True
TC_10_Example Of Evaluate
    [Tags]  Evaluate
    ${result}    Evaluate    5 + 3
    Log    Result is ${result}
TC_11_Example Of Read File
    [Tags]    Read File
    ${content}    Get File  example.txt
    Log    ${content}
TC_12_Example Of Write To File
    [Tags]    Write To File
    Create File    example.txt    Hello, Robot Framework!
    Log    Content written
TC_13_Example Of Get From Dictionary
    [Tags]    Get From Dictionary
    &{person}    Create Dictionary    name=John    age=30
    ${name}    Get From Dictionary    ${person}    name
    Log    Name: ${name}
TC_14_Example Of Dictionary Should Contain Key
    [Tags]   Example Of Dictionary Should Contain Key
    &{person}    Create Dictionary    name=John    age=30
    Dictionary Should Contain Key    ${person}    name
TC_15_Wait Example
    [Tags]    Wait Until Keyword Succeeds
    Wait Until Keyword Succeeds    5 times    1 second    Should Be Equal    ${1}    ${1}
TC_16_Run Multiple Keywords
    [Tags]  Run Keywords
    Run Keywords    Log    First Keyword    AND    Log    Second Keyword
TC_17_Custom Keyword Example
    [Tags]  Custom Keyword
    Greet User    Robot Framework





