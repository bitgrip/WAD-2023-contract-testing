Feature: Mock the products endpoint

    Background:
        * def products = read('responseData/products.json')

    Scenario: pathMatches('/products') && methodIs('get')
        * def response = products
        * def responseStatus = 200

    Scenario: pathMatches('/products/{productId}') && methodIs('get')
        * def product = karate.jsonPath(products, "$.[?(@.id=='" + pathParams.productId + "')]")
        * def response = product[0]
        * def responseStatus = 200