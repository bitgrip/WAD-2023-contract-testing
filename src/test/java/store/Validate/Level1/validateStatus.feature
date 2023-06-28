Feature: Validate response status
    Background:
        Given url baseURL

    Scenario: Gets all products
        Given path 'products'
        When method get
        Then status 200


    Scenario: Gets a product by id
        Given path 'products', '1'
        When method get
        Then status 200


    Scenario: Gets all users
        Given path 'users'
        When method get
        Then status 200


    Scenario: Gets a user by id
        Given path 'users', '1'
        When method get
        Then status 200