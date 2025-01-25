*** Settings ***
Library    Collections
Library    OperatingSystem
*** Variables ***
${NAME}      Alice
@{FRUITS}    Apple    Banana    Orange
&{PERSON}    name=John    age=30
@{COLORS}    Red    Blue    Green
@{NESTED_LIST}    @{ROW1}    @{ROW2}
@{ROW1}           1    2    3
@{ROW2}           4    5    6
&{COUNTRY_CODES}    US=1    UK=44    IN=91
${FIRST_NAME}    Alice
${LAST_NAME}     Johnson
${AGE}    18
${VALUE}    10
@{NUMBERS}    1    2    3
&{STUDENT}    name=Tom    scores=&{SCORES}
&{SCORES}     math=90    science=85
${EMPTY}    None
@{EMPLOYEES}    &{EMP1}    &{EMP2}
&{EMP1}         name=John    age=30
&{EMP2}         name=Jane    age=28
@{COLORS}    Red    Blue    Green


*** Keywords ***
Greet
    [Arguments]    ${name}
    Log    Hello, ${name}
Calculate
    [Arguments]    ${a}    ${b}
    ${sum}    Evaluate    ${a} + ${b}
    Log    Sum: ${sum}





*** Test Cases ***
Print Name
   [tags]  pass
    Log    ${NAME}
Print Fruits
    [tags]  pass
    Log    ${FRUITS[0]}
    Log    ${FRUITS[1]}
Print Dictionary
    Log    ${PERSON['name']}
    Log    ${PERSON['age']}

Use Scalar
    [Tags]  pass
    ${result}    Log To Console    Hello, Robot Framework!
    Log    ${result}

Print Country Codes
    FOR    ${country}    ${code}    IN    &{COUNTRY_CODES}
        Log    ${country}: ${code}
    END
Loop Through Colors
    FOR    ${color}    IN    @{COLORS}
        Log    ${color}
    END
Combine Names
    Log    ${FIRST_NAME} ${LAST_NAME}

Check Age
    Run Keyword If    ${AGE} >= 18    Log    Adult
    ...    ELSE    Log    Minor
Set Global Variable
    Set Global Variable    ${VALUE}    20
    Log    ${VALUE}
Append to List
    Append To List    ${NUMBERS}    4
    Log    ${NUMBERS}
Create Variable Dynamically
    ${var}    Evaluate    5 + 5
    Log    ${var}
Get Environment Variable
    ${path}    Get Environment Variable    PATH
    Log    ${path}
Evaluate Python Code
    ${result}    Evaluate    len("Robot Framework")
    Log    ${result}
Access Nested Dictionary
    Log    ${STUDENT['scores']['math']}
Check Empty
    Run Keyword If    ${EMPTY} == None    Log    Variable is empty
Access Employee Data
    Log    ${EMPLOYEES[0]['name']}
    Log    ${EMPLOYEES[1]['age']}
Use Variables in Keyword
    Calculate    10    20




