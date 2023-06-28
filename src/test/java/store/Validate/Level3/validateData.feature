Feature: Validate response data
    Background:
        Given url baseURL

    Scenario: Title and price of test product are correct
        Given path 'products', testData.products.product_3.id
        When method get
        Then status 200
        And match response.title == "Mens Cotton Jacket"
        And match response.price == 55.99

    Scenario: Email address and phone number of test user are correct
        Given path 'users', testData.users.user_1.id
        When method get
        Then status 200
        And match response.email == "john@gmail.com"
        And match response.phone == "1-570-236-7033"

