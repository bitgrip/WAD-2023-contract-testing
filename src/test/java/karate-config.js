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
  baseURL = "https://fakestoreapi.com/";
  testData = read("classpath:store/websiteTestData.json");

  return config;
}
