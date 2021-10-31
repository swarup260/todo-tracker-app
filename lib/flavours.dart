enum Flavours { development, staging, production }

Map<Flavours, Map<String, String>> appConfig = {
  Flavours.development: {'baseUrl': '192.168.0.104:3000'},
  Flavours.staging: {'baseUrl': 'jsonplaceholder.typicode.com'},
  Flavours.production: {'baseUrl': 'jsonplaceholder.typicode.com'},
};
