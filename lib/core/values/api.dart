class Api {
  static const apiUrlDev = "http://192.168.176.33:8000";
  static const apiUrl = "https://inventory.seethis.net";
  static const apiPrefix = "/api/v1/engineer";
  static const baseUrlDev = apiUrlDev + apiPrefix;
  static const baseUrl = apiUrl + apiPrefix;
  static const endPoints = {
    "register": "/register",
    "login": "/login",
    "logout": "/logout",
    "sendLink": "/sendLink",
    "reset": "/reset",
    "products": "/products",
    "mr": "/mr",
  };
}
