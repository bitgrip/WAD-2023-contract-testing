function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log("karate.env system property was:", env);
  if (!env) {
    env = "dev";
  }
  var config = {
    env: env,
    myVarName: "someValue",
  };

  if (env == "dev") {
    baseURL = "https://fakestoreapi.com/";
  } else if (env == "mock") {
    baseURL = "http://localhost:8081/";
  }
  testData = read("classpath:store/websiteTestData.json");
  return config;
}
