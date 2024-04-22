class RemoteUrls {
  // static const String rootUrl = "https://quomodothemes.website/homeco/";
  // static const String rootUrl = "https://www.z1reap.io/";
  // static const String rootUrl = "http://192.168.18.29:8001/";
  // static const String urlMlm = "http://192.168.18.29:8002/mobile/";
  // static const String urlMlm = "https://mlm.z1reap.io/mobile/";
  // static const String rootUrl = "https://mamunuiux.com/homeco/";
  static const String rootUrl = "https://rx-remp.remp.co/";
  static const String urlMlm = "https://rx-staging-api.remp.co/mobile/";

  static const String baseUrl = '${rootUrl}api/';
  static const String homeUrl = baseUrl;
  static const String userRegister = '${baseUrl}store-register';
  static const String userLogin = '${baseUrl}store-login';

  //-----------Authentication with API Model---------
  static const String register = '${urlMlm}register';
  static String requestOtp() => '${urlMlm}request-otp';
  static const String verifyOtp = '${urlMlm}verify-otp';
  static const String login = '${urlMlm}login';
  static String verifyForgotPassword = '${urlMlm}forget-password';
  //------ new api get and update user info ------------------------
  static const getUserProfile = '${urlMlm}user';

  //------- Payment online with API Model -------------
  static getProduct(String group) => '${urlMlm}product?group=$group';
  static const submitPaymentLink = '${urlMlm}kess/payment-link';

  //---------- get settings from mlm api -------------
  static const getSettings = '${urlMlm}settings';

  // logo
  static const String websiteSetup = '${baseUrl}website-setup';

  // property type
  static String createPropertyInfoUrl(String purpose) =>
      '${baseUrl}user/property/create?purpose=$purpose';

  static String checkPricingPlan(String purpose) =>
      '${baseUrl}user/check-pricing-plan?purpose=$purpose';

  //------- for get info of property that have to edit ------
  static String editInfoUrl(String id) => '${baseUrl}user/property/$id/edit';

  static String getPropertyChooseInfo() =>
      '${baseUrl}user/choose-property-type';

  static String changePassword() => '${baseUrl}user/update-password';

  static String userLogOut() => '${baseUrl}user/logout';
  static const String sendForgetPassword = '${baseUrl}send-forget-password';
  static const String resendRegisterCode = '${baseUrl}resend-register-code';

  static String storeResetPassword = '${baseUrl}store-reset-password';

  static String userVerification = '${baseUrl}user-verification';
  static String resendVerificationCode = '${baseUrl}resend-register';

  static String singlePropertyDetailsUrl(String slug) =>
      '${baseUrl}property/$slug';

  static String createPropertyUrl() => '${baseUrl}user/property';

  static String updatePropertyUrl(String id) =>
      '${baseUrl}user/update-property/$id';

  static String removeSliderImageUrl(String id) =>
      '${baseUrl}user/remove-property-slider/$id';

  static String removeSingleNearestLocationUrl(String id) =>
      '${baseUrl}user/remove-nearest-location/$id';

  static String removeSingleAddInfoUrl(String id) =>
      '${baseUrl}user/remove-add-infor/$id';

  static String removeSinglePlanUrl(String id) =>
      '${baseUrl}user/remove-plan/$id';

  static String deletePropertyUrl(String id) => '${baseUrl}user/property/$id';

  static String getAgentDashboardInfo() => '${baseUrl}user/dashboard';

// maybe fun facts
//------ old api get user info ------------------------
  static String getAgentProfile() => '${baseUrl}user/my-profile';

  static String getAllAgent() => '${baseUrl}agents';

  static String getAllAgentByPage(String page) => '${baseUrl}agents?page=$page';

  static String getAgentDetails(String userName) =>
      '${baseUrl}agent?agent_type=agent&user_name=$userName';

  static String sendMessageToAgent() => '${baseUrl}send-mail-to-agent';

  //------------ old api of update user profile -----------
  static String updateAgentProfileInfo() => '${baseUrl}user/update-profile';

  static String getFaqContent() => '${baseUrl}faq';

  static String getPrivacyPolicy() => '${baseUrl}privacy-policy';

  static String getTermsAndCondition() => '${baseUrl}terms-and-conditions';

  static String getReviewList() => '${baseUrl}user/my-reviews';

  static String getWishListProperties() => '${baseUrl}user/wishlist';

  static String addToWishlist(String id) =>
      '${baseUrl}user/add-to-wishlist/$id';

  static String removeFromWishlist(String id) =>
      '${baseUrl}user/remove-wishlist/$id';

  static String getContactUs() => '${baseUrl}contact-us';
  static String sendContactUsMessage = '${baseUrl}send-contact-message';

  static String getAboutUs() => '${baseUrl}about-us';

  static String getAllOrders() => '${baseUrl}user/orders';

  static String getOrderDetails(String orderId) =>
      '${baseUrl}user/order/$orderId';

  static String getPricePlan() => '${baseUrl}pricing-plan';

  static String getPaymentPageInformation(String planSlug) =>
      '${baseUrl}payment/$planSlug';

  //payment urls start

  static String freeEnrollment(String planSlug) =>
      '${baseUrl}free-enroll/$planSlug';

  static String bankPayment(String planSlug) =>
      '${baseUrl}bank-payment/$planSlug';

  static String stripePayment(String planSlug) =>
      '${baseUrl}pay-with-stripe/$planSlug';

  static String payWithFlutterWave(String token, String planSlug) =>
      '${rootUrl}flutterwave-webview/$planSlug?token=$token';

  static String payWithPayStack(String token, String planSlug) =>
      '${rootUrl}paystack-webview/$planSlug?token=$token';

  static String payWithMolli(String token, String planSlug) =>
      '${rootUrl}mollie-webview/$planSlug?token=$token';

  static String payWithInstamojo(String token, String planSlug) =>
      '${rootUrl}instamojo-webview/$planSlug?token=$token';

  static String payWithRazorpay(String token, String planSlug) =>
      '${rootUrl}razorpay-webview/$planSlug?token=$token';

  static String payWithPaypal(String token, String planSlug) =>
      '${rootUrl}paypal-webview/$planSlug?token=$token';

  //payment urls end

  static String getSearchProperty = '${baseUrl}properties?';
  static String getAllProperty = '${baseUrl}properties';
  static String getFilterProperty = '${baseUrl}properties?';

  static String getPropertyByPage(String page) =>
      '${baseUrl}properties?page=$page';

  static String getFilterOption = '${urlMlm}apier/filter/options';

  static String getFilterSummary(String start, String end) =>
      '${urlMlm}apier/?start_date=$start&end_date=$end';

  static String getApierDetailByFilter(
          String start, String end, String depth) =>
      '${urlMlm}apier/order?start_date=$start&end_date=$end&depth=$depth';

  static imageUrl(String imageUrl) => rootUrl + imageUrl;
}
