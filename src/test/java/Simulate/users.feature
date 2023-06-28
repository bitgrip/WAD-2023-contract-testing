Feature: Mock the users endpoint

    Background:
        * def users = read('responseData/users.json')

    Scenario: pathMatches('/users') && methodIs('get')
        * def response = users
        * def responseStatus = 200

    Scenario: pathMatches('/users/{userId}') && methodIs('get')
        * def user = karate.jsonPath(users, "$.[?(@.id=='" + pathParams.userId + "')]")
        * def response = user[0]
        * def responseStatus = 200