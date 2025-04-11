class APIEndpoint {
  static String get baseUrl => "http://192.168.24.134:8000/";
  // static String get baseUrl => "http://127.0.0.1:8000/";
  // static String get clientToken => "MzAyMjAzNjV8MTY2ODAwNjIzNC4xODU5ODM";

  // for login signup
  static String get signUpUrl => "auth/signup/";
  static String get signinUrl => "auth/signin/";
  static String get socialSignUpUrl => "auth/social/signup/";
  static String get socilaSigninUrl => "auth/social/signin/";
  // for personal profile
  static String get createPersonalProfileUrl => "auth/personal/create/";
  static String get getPersonalProfileUrl => "auth/personal/profile/";
  static String get getPersonalProfileWithNameUrl => "auth/personal/profile/";
  static String get registerQRCodeUrl =>
      "auth/personal/profile/register/physical/qr/card/";

  // for company profile
  static String get createCompanyProfileUrl => "auth/company/create/";
  static String get getCompanyProfileUrl => "auth/company/profile/";
  static String get getCompanyProfileWithNameUrl => "auth/company/profile/";

// for jwt
  static String get getTokenUrl => "auth/api/token/";
  static String get refreshTokenUrl => "auth/api/token/refresh/";

  // for products
  static String get createProductsUrl => "products/";
  static String get getAllProductsUrl => "products/all/";
  static String get updateProductsUrl => "products/";

  // for cards
  static String get createCardUrl => "card/create_card/";
  static String get updateCardsUrl => "card/update_card/";
  static String get activeCardUrl => "card/activate_card/";
  static String get getActiveCardByQr => "card/get/card_by_qr/";
  static String get getActiveCardUrl => "card/get/active_card/";
  static String get getAllCardsUrl => "card/get/all_card/";
  static String get getCardbyId => "card/get/card/";
  static String get getAllEmails => "card/get/all_emails/";
  static String get getAllPhoneNumbers => "card/get/all_phone-numbers/";

  static String get getUserAllScanLocation => "location/scan/"; //<int:user_id>
  static String get getlocationBuyId => "location/"; //<int:user_id>

  static String get createLocation => "location/";
  static String get totalScansOfUser => "location/scan/total/";
  static String get totalScans => "location/user/total/";
  static String get splineChartValues => "location/monthly-scans/";

  // End points for contacts
  static String get addToContactsByCard => "contacts/by/card";
  static String get addToContacts => "contacts/add/";
  static String get getAllContacts => "contacts/all/";
  // End points for contact requestws
  static String get addToRequests => "requests/add/";
  static String get getAllRequests => "requests/all/";


  static String imagePath(String url) {
    if (url.startsWith('/')) {
      url = url.substring(1);
    }
    if (url.startsWith('http://') || url.startsWith('https://')) {
      return url;
    }
    return baseUrl + url;
  }
}
