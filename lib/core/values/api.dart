class Api {
  static const apiUrlDev = "http://10.227.3.33:8000";
  static const apiUrl = "https://inventory.seethis.net";
  //static const apiUrl = "https://seethis.net/inventory-api/public";
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
    "material-returns": "/material-returns",
    "home": "/home",
    "transactions": "/transactions",
    "sendLink": "/password/reset",
    "stores_engineers": "/stores_engineers",
    "fcm": "/fcm",
  };
}
