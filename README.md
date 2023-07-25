## Purpose

This Repository was created to share the code snippets shown during the Talk **Contract Testing - How do you tame an external API that constantly breaks your tests?** at WeAreDevelopers 2023. It contains automatic API tests using the karate framework. They are meant to be run against the sample api at [https://fakestoreapi.com/](https://fakestoreapi.com/).

## Testing

To run the tests use mvn:<br>
`mvn test`

You can also just run specific subsets of tests such as only the status validation:<br>
`mvn test -Dkarate.options=src/test/java/store/Validate/Level1/validateStatus.feature`

## Mocking

To setup a mock server, you need to download the karate jar file from the
[Karate Repo](https://github.com/karatelabs/karate/releases). The jar files are listed under the
Assets section.

To create a mock server, execute the following command: <br/>
`java -jar <Path_to_jar> -m <Path_to_mock> -p <Port_number>`

E.g:<br/>
`java -jar karate-1.4.0.jar -m src/test/java/Simulate/products.feature -p 8081`

You can also pass multiple feature files for the mock server: <br/>
`java -jar karate-1.4.0.jar -m src/test/java/Simulate/products.feature -m src/test/java/Simulate/users.feature -p 8081`

## Testing against the mock

Once the mock is running, testing against it is as simple as telling the mvn command to use the mock environment. This environment is configured to look for the mock at **localhost port 8081** :<br>
`mvn test -Dkarate.env=mock`

You can configure the environments differently by changing the values in [karate-config.js](src/test/java/karate-config.js)
