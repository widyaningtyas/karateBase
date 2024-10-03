Feature: Pet API Tests

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--opening petstore API--"


  Scenario: Add New Pet to Store
    * def reqBody = {"id": 23, "category": {"id": 23, "name": "string"}, "name": "doggie", "photoUrls": ["string"],"tags": [{"id": 23,"name": "string"}],"status": "available"}
    When url "https://petstore.swagger.io/v2/pet"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Find pet by Status
    When url "https://petstore.swagger.io/v2/pet/findByStatus?status=available"
    And method get
    Then print response
    And status 200

  Scenario: Find pet by ID
    When url "https://petstore.swagger.io/v2/pet/23"
    And method get
    Then print response
    And status 200

  Scenario: Update status existing ID
    * def reqBody = {"id" : 23, "category" : {"id" : 23, "name" : "string"}, "name" : "doggie", "photoUrls" : ["string"],"tags":[{"id":23,"name":"string"}],"status":"sold"}
    When url "https://petstore.swagger.io/v2/pet"
    And request reqBody
    And method put
    Then print response
    And status 200

  Scenario: Delete existing pet
    When url "https://petstore.swagger.io/v2/pet/23"
    And method delete
    Then print response
    And status 200
