Feature: User API Tests

  Background:
    Given url "https://petstore.swagger.io/v2/user"
    And print "--opening user API--"


  Scenario: Add new user
    * def reqBody = {"id":12,"username":"string","firstName":"string","lastName":"string","email":"string","password":"string","phone":"string","userStatus":12}
    When url "https://petstore.swagger.io/v2/user"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Get user
    When url "https://petstore.swagger.io/v2/user/string"
    And method get
    Then print response
    And status 200

  Scenario: Login user
    When url "https://petstore.swagger.io/v2/user/login?username=string&password=string"
    And method get
    Then print response
    And status 200

  Scenario: Update user
    * def reqBody = {"id":0,"username":"string","firstName":"string","lastName":"string","email":"string","password":"string","phone":"string","userStatus":0}
    When url "https://petstore.swagger.io/v2/user/string"
    And request reqBody
    And method put
    Then print response
    And status 200

  Scenario: Log out user
    When url "https://petstore.swagger.io/v2/user/logout"
    And method get
    Then print response
    And status 200

  Scenario: Delete user
    When url "https://petstore.swagger.io/v2/user/string"
    And method delete
    Then print response
    And status 200
