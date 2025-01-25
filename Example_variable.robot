
*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library   OperatingSystem 


*** Variables ***
${NAME}      Alice
@{FRUITS}    Apple    Banana    Orange
&{PERSON}    name=John    age=30
@{COLORS}    Red    Blue    Green
&{COUNTRY_CODES}    US=1    UK=44    IN=91
${FIRST_NAME}    Alice
${LAST_NAME}     Johnson
&{COUNTRY_CODES}    US=1    UK=44    IN=91
${FIRST_NAME}    Alice
${LAST_NAME}     Johnson
${AGE}    18
${VALUE}    10
@{NUMBERS}    1    2    3
&{STUDENT}    name=Tom    scores=&{SCORES}
&{SCORES}     math=90    science=85
${EMPTY}    None
${TEXT}    This is
...        multi-line
...        text.
@{EMPLOYEES}    &{EMP1}    &{EMP2}
&{EMP1}         name=John    age=30
&{EMP2}         name=Jane    age=28

*** Keywords ***
Greet
    [Arguments]    ${name}
    Log    Hello, ${name}
Calculate
    [Arguments]    ${a}    ${b}
    ${sum}    Evaluate    ${a} + ${b}
    Log    Sum: ${sum}


*** Test Cases ***
TC_01_Print Name
    [Documentation]   Simple Scalar Variable
    Log    ${NAME}
TC_02_Print Fruits
    [Documentation]  Simple List Variable
    Log    ${FRUITS[0]}
    Log    ${FRUITS[1]}
TC_03_Print Dictionary
    [Documentation]   Dictionary Variable
    Log    ${PERSON['name']}
    Log    ${PERSON['age']}

TC_04_Use Scalar
    [Documentation]   Scalar Variable in Keyword
    ${result}    Log To Console    Hello, Robot Framework!
    Log    ${result}
TC_05_Loop Through Colors
    [Documentation]    List Variable with Loop
    FOR    ${color}    IN    @{COLORS}
        Log    ${color}
    END
TC_06_Print Country Codes
    [Documentation]  Dictionary with Loop
    FOR    ${country}    ${code}    IN    &{COUNTRY_CODES}
        Log    ${country}: ${code}
    END
TC_07_Combine Names
    [Documentation]  Combining Scalars
    Log    ${FIRST_NAME} ${LAST_NAME}    
TC_08_Check Age
    [Documentation]  Using Variables in Conditions
    Run Keyword If    ${AGE} >= 18    Log    Adult
    ...    ELSE    Log    Minor
TC_09_Set Global Variable
    [Documentation]  Global Variable
    Set Global Variable    ${VALUE}    20
    Log    ${VALUE}

TC_10_Use Arguments
    [Documentation]  Argument Variables
    Greet    Alice

TC_11_Append to List
    [Documentation]  Modifying List Variable
    Append To List    ${NUMBERS}    4
    Log    ${NUMBERS}
TC_12_Create Variable Dynamically
    [Documentation]   Dynamic Variable Assignment
    ${var}    Evaluate    5 + 5
    Log    ${var}
TC_13_Get Environment Variable
    [Documentation]  Using Environment Variables
    ${path}    Get Environment Variable    PATH
    Log    ${path}
TC_14_Evaluate Python Code
    [Documentation]   Using Python Expressions
    ${result}    Evaluate    len("Robot Framework")
    Log    ${result}
TC_15_Access Nested Dictionary
    [Documentation]   Dictionary with Nested Keys
    Log    ${STUDENT['scores']['math']}
TC_16_Check Empty
    [Documentation]   Empty Variables
    Run Keyword If    ${EMPTY} == None    Log    Variable is empty
TC_17_Print Multi-Line
    [Documentation]    Multi-Line Scalar
    Log    ${TEXT}
TC_18_Access Employee Data
    [Documentation]  List of Dictionaries
    Log    ${EMPLOYEES[0]['name']}
    Log    ${EMPLOYEES[1]['age']}
TC_19_Use Variables in Keyword
    [Documentation]    Variables in Custom Keyword
    Calculate    10    20

