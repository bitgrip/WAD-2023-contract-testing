## Mocking

To setup a mock server, you need to download the karate jar file from the
[Karate Repo](https://github.com/karatelabs/karate/releases). The jar files are listed under the
Assets section. <br>

To create a mock server, execute the following command: <br>
`java -jar <Path_to_jar> -m <Path_to_mock> -p <Port_number>` <br><br> E.g: <br>
`java -jar karate-1.4.0.jar -m main.js -p 8081`

## Mock architecture

In the root folder there are two js files

- [main.js](main.js) is the central part of the mock. It is the file
  that you should start if you want to run the mock and it incorporates all mocked endpoints (see the java command above).
- [imports.js](src/test/java/occ_api/mocks/imports.js) is used by main.js to read files from subdirectories using karates `context.read()`. If you want to write a new endpoint mock you have to add an import for its **endpoints.js** and **mock.js** to this file (explanation of these files below)

Any endpoint mocks are placed in an appropriate subdirectory e.g.
/foo for any /foo endpoints. These subdirectories all follow the same pattern:

- an **endpoints.js** file. This file lists all the available endpoints as well as the http methods
  they support (get, post, put, patch etc.).
- a **mock.js** file. It contains the actual business logic for all the endpoints defined in
  endpoints.js (see previous bulletpoint). This is where you will write most of your code. Check
  the [Documentation](https://github.com/karatelabs/karate/wiki/Karate-JavaScript-Mocks#js-api) for
  more Information. Even more examples can be found in
  [this demo by the karate creator](https://github.com/ptrthomas/karate-oas-demo)
- (if needed) a **/ResponseData/** subdirectory for any json files the endpoint uses
