
*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library   OperatingSystem 


*** Variables ***


*** Keywords ***
Get Number
    [Return]    2
Log Number As Integer
    ${number}    Convert To Integer    ${num}
    Log    ${number}


*** Test Cases ***
TC_01_Simple If Else
    [Documentation]   If-Else
    ${x}    Set Variable    10
    Run Keyword If    ${x} > 5    Log    Value is greater than 5
    ...    ELSE    Log    Value is 5 or less
TC_02_Nested If Else
    [Documentation]  Nested If-Else
    ${x}    Set Variable    10
    Run Keyword If    ${x} > 15    Log    Greater than 15
    ...    ELSE IF    ${x} > 5    Log    Between 6 and 15
    ...    ELSE    Log    5 or less
TC_03_Simple For Loop
    [Documentation]   Simple For Loop
    @{numbers}    Create List    1    2    3    4
    FOR    ${num}    IN    @{numbers}
        Log    Number: ${num}
    END
TC_04_For Loop With Range
    [Documentation]   For Loop with Range
    FOR    ${i}    IN RANGE    1    5
        Log    Value: ${i}
    END
TC_05_For Loop with Condition
    [Documentation]    For Loop with Condition
    @{numbers}    Create List    1    2    3    4    5
    FOR    ${num}    IN    @{numbers}
        Run Keyword If    ${num} > 3    Log    ${num} is greater than 3
    END
TC_06_For Loop With Break
    [Documentation]  Break in For Loop
    @{numbers}    Create List    1    2    3    4
    FOR    ${num}    IN    @{numbers}
        Run Keyword If    ${num} == 3    Exit For Loop
        Log    ${num}
    END
TC_07_For Loop With Continue
    [Documentation]  Continue in For Loop
        @{numbers}    Create List    1    2    3    4
    FOR    ${num}    IN    @{numbers}
        Run Keyword If    ${num} == 2    Continue For Loop
        Log    ${num}
    END 
TC_08_If-Else with Variables
    [Documentation]  If Else With Variables
    ${x}    Set Variable    7
    ${result}    Run Keyword If    ${x} > 5    Set Variable    Greater
    ...    ELSE    Set Variable    Lesser
    Log    ${result}
TC_09_For Loop With Dictionary
    [Documentation]  For Loop with Dictionaries
    @{outer}    Create List    A    B
    @{inner}    Create List    1    2
    FOR    ${o}    IN    @{outer}
        FOR    ${i}    IN    @{inner}
            Log    ${o}${i}
        END
    END
TC_10_Nested For Loop
    [Documentation]  Nested For Loop
    @{outer}    Create List    A    B
    @{inner}    Create List    1    2
    FOR    ${o}    IN    @{outer}
        FOR    ${i}    IN    @{inner}
            Log    ${o}${i}
        END
    END

TC_11_While Loop Using Keywords
    [Documentation]  While Loop Using Keywords
        ${counter}    Set Variable    1
    WHILE    ${counter} < 5
        Log    Count: ${counter}
        ${counter}    Evaluate    ${counter} + 1
    END
TC_12_Try-Except in Loops
    [Documentation]  Try-Except in Loops
        @{numbers}    Create List    1    two    3
    FOR    ${num}    IN    @{numbers}
        Run Keyword And Ignore Error    Log Number As Integer    ${num}
    END
TC_13_Asynchronous Loop Simulation
    [Documentation]  Asynchronous For Loop (Simulated with Delays)
    @{tasks}    Create List    Task1    Task2    Task3
    FOR    ${task}    IN    @{tasks}
        Log    Starting: ${task}
        Sleep    1s
        Log    Finished: ${task}
    END
TC_14_Complex Nested Conditions
    [Documentation]  
    ${x}    Set Variable    10
    ${y}    Set Variable    20
    Run Keyword If    ${x} < ${y} and ${y} > 15    Log    Both conditions are true
TC_15_Dynamic For Loop
    [Documentation]  Dynamic For Loop (Variable Iteration)
        ${limit}    Set Variable    3
    FOR    ${i}    IN RANGE    ${limit}
        Log    Iteration: ${i}
    END

