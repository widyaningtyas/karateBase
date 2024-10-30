Feature: Test got meal plan

  Background:
  Background:
    * url 'https://api.spoonacular.com/
    * def apiKey = ''
    * def hash = ''
    * def username = ''
    * def startDate = '2024-09-21'

  Scenario: Test Generate MealPlan
    Given path 'mealplanner/generate'
    And param apiKey = apiKey
    And param timeFrame ='day'
    And param targetCalories = '1000'
    When method get
    Then status 200
    And print result

  Scenario: Adding items to meal plan
    Given path 'mealplanner', username, 'items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request {}
    When method post
    Then status 200
    And match response.status == 'success'
    And print response

  Scenario: get shopping list
    Given path 'mealplanner', username, 'shopping-list'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request {}
    When method post
    Then status 200
    And match response.status == 'success'
    And print response

  Scenario: Adding Items to Shopping List
    * def reqBody = {"item":"1 package baking powder","aisle":"Baking","parse":true}
    Given path 'mealplanner', username, 'shopping-list/items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request reqBody
    When method post
    Then status 200
    And print response

  Scenario: Get shopping list
    Given path 'mealplanner', username, 'shopping-list'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print response

  @test
  Scenario: ML model Image Classification
    Given path 'food/images/classify'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param imageUrl = 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/6F320FC7-CBD7-419D-B790-24DA25E975F9/Derivates/9774C36E-8478-4BE3-A8CD-FF02AC5B9BCB.jpg'
    When method get
    Then status 200
    And print response
