class Api {
  static const apiUrlDev = "http://192.168.123.33:8000";
  static const apiUrl = "https://inventory.seethis.net";
  static const apiPrefix = "/api/v1/engineer";
  static const baseUrlDev = apiUrlDev + apiPrefix;
  static const baseUrl = apiUrl + apiPrefix;
  static const endPoints = {
    "register": "/register",
    "login": "/login",
    "logout": "/logout",
    "reset": "/reset",
    "products": "/products",
    "mr": "/mr",
    "home": "/home",
    "transactions": "/transactions",
    "sendLink": "/password/reset",
    "stores_engineers": "/stores_engineers",
  };
}
