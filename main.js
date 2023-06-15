const paths = {};
let errors = [];
const rules = {};

context.read('this:imports.js');

const handleInternal = function (path, methodInfo) {
  if (methodInfo.request) {
    let result = context.match(request.body, checks[methodInfo.request]);
    if (!result.pass) errors.push(result.message);
  }
  if (methodInfo.response) {
    response.body = samples[methodInfo.response];
  }
  let rule = rules[path];
  if (rule) {
    rule();
  }
  if (errors.length) {
    response.body = errors.join('\n');
    response.status = 400;
  }
};
const handle = function () {
  for (const [path, methods] of Object.entries(paths)) {
    if (request.pathMatches(path)) {
      const methodInfo = methods[request.method.toLowerCase()];
      if (methodInfo) {
        handleInternal(path, methodInfo);
        return true;
      }
    }
  }
  return false;
};
if (!handle()) response.status = 404;
