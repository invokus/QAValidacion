function fn() {
  var env =
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
   config.urlBase = 'https://api.demoblaze.com/'
  } else if (env == 'e2e') {
  }
  return config;
}