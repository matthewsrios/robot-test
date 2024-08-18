*** Settings ***                                                                                                                                                                      
Library    RequestsLibrary
Library    Collections                                                                             
                                                                                                       
Suite Setup    Create Session  jsonplaceholder  https://jsonplaceholder.typicode.com
                                                                                                       
*** Test Cases ***                                                                                     
                                                                                                       
Should return 200 OK                                                                                                                                                                                                                                                                       
    ${resp}=     GET On Session  jsonplaceholder  /posts                                        
                                                                                                       
    Should Be Equal As Strings    ${resp.reason}    OK
    Should Be Equal As Strings    ${resp.status_code}    200


Should return valid response                                                                                                                                                                                                                                                                    
    ${resp}=     GET On Session  jsonplaceholder  /posts                                       
                                                                                                       
    Should be True    ${resp.content}
    ${first}=    Get From List    ${resp.json()}    0

    Dictionary Should Contain Key     ${first}    id
    Dictionary Should Contain Key     ${first}    userId
    Dictionary Should Contain Key     ${first}    title
    Dictionary Should Contain Key     ${first}    body

