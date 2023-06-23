Feature: Validate response schema
    Background:
        Given url baseURL

    Scenario: Gets all products
        Given path 'products'
        When method get
        Then status 200
        And match each response ==
            """
            {
                "id": "#number",
                "title": "#string",
                "price": "#number",
                "description": "#string",
                "category": "#string",
                "image": "#string",
                "rating": {
                    "rate": "#number",
                    "count": "#number"
                }
            }
            """

    Scenario: Gets a product by id
        Given path 'products/1'
        When method get
        Then status 200
        And match response ==
            """
            {
                "id": "#number",
                "title": "#string",
                "price": "#number",
                "description": "#string",
                "category": "#string",
                "image": "#string",
                "rating": {
                    "rate": "#number",
                    "count": "#number"
                }
            }
            """