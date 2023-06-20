Feature: products
  Background:
    Given url baseURL
    And path 'products'

  Scenario: Gets all products
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

  Scenario: Gets a single product by id
    Given path '1'
    When method get
    Then status 200
    And match response.id == 1
    And match response.title == "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"

  Scenario: Title and price of product used in website test is correct
    Given path testData.products.product_3.id
    When method get
    Then status 200
    And match response.title == testData.products.product_3.title
    And match response.price == testData.products.product_3.price


  Scenario: Add new product
    Given request
      """
      {
      title: 'test product',
      price: 13.5,
      description: 'lorem ipsum set',
      image: 'https://i.pravatar.cc',
      category: 'electronic'
      }
      """