Feature: Validate response schema
    Background:
        Given url baseURL

    Scenario: Gets all products
        Given path 'products'
        When method get
        Then status 200
        And match each response == read("ResponseSchema/schema.json").product

    Scenario: Gets a product by id
        Given path 'products', '3'
        When method get
        Then status 200
        And match response == read("ResponseSchema/schema.json").product

    Scenario: Title and price of test product are correct
        Given path 'products', testData.products.product_3.id
        When method get
        Then status 200
        And match response.title == testData.products.product_3.title
        And match response.price == testData.products.product_3.price

    Scenario: Gets all users
        Given path 'users'
        When method get
        Then status 200
        And match each response == read("ResponseSchema/schema.json").user

    Scenario: Gets a user by id
        Given path 'users', '1'
        When method get
        Then status 200
        And match response == read("ResponseSchema/schema.json").user

    Scenario: Email and phone of test user are correct
        Given path 'users', testData.users.user_1.id
        When method get
        Then status 200
        And match response.email == testData.users.user_1.email
        And match response.phone == testData.users.user_1.phone
