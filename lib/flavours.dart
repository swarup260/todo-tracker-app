enum Flavours { development, staging, production }

Map<Flavours, Map<String, String>> appConfig = {
  Flavours.development: {'baseUrl': 'jsonplaceholder.typicode.com'},
  Flavours.staging: {'baseUrl': 'jsonplaceholder.typicode.com'},
  Flavours.production: {'baseUrl': 'jsonplaceholder.typicode.com'},
};
