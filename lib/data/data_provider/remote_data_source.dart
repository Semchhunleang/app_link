import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/data/model/auth/verify_otp_model.dart';

import '../../logic/bloc/create_property/bloc/property_create_bloc.dart';
import '../../logic/cubit/agent/agent_state_model.dart';
import '../../logic/cubit/change_password/change_password_cubit.dart';
import '../../logic/cubit/contact_us/contact_us_state_model.dart';
import '../../logic/cubit/payment/stripe_payment/stripe_payment_state_model.dart';
import '../../logic/cubit/profile/profile_state_model.dart';
import 'network_parser.dart';
import 'remote_url.dart';

abstract class RemoteDataSource {
  Future signIn(Map<String, dynamic> body);
  Future login(Map<String, dynamic> body);
  Future<String> userRegister(Map<String, dynamic> userInfo);
  Future<String> verifyForgotPassword(Map<String, dynamic> body);

  Future getHomeData();

  Future getPropertyCreateInfo(String token, String purpose);

  Future getCheckPricing(String token, String purpose);

  Future createPropertyRequest(PropertyCreateModel data, String token);

  Future<String> updatePropertyRequest(
      String id, PropertyCreateModel data, String token);

  Future<String> removeSliderImageApi(String id, String token);

  Future<String> deleteProperty(String id, String token);

  Future<String> removeSingleNearestLocationApi(String id, String token);

  Future<String> removeSingleAddInfoApi(String id, String token);

  Future<String> removeSinglePlanApi(String id, String token);

  Future getPropertyEditInfo(String id, String token);

  Future getPropertyChooseInfo(String token);

  Future websiteSetup();

  Future<String> passwordChange(
      ChangePasswordStateModel changePassData, String token);

  Future<String> sendForgotPassCode(Map<String, dynamic> body);

  //Future<String> setPassword(SetPasswordModel body);

  Future<String> sendActiveAccountCode(String email);

  Future<String> activeAccountCodeSubmit(Map<String, String> body);

  Future<String> resendVerificationCode(Map<String, String> email);
  Future requestOtp(Map<String, dynamic> body);
  // Future<String> verifyOtp(Map<String, dynamic> body);
  Future<String> verifyOtp(VerifyOtpModel body);
  //Future verifyOtp(Map<String, dynamic> body);

  Future getSinglePropertyDetails(String slug);

  Future getAgentDashboardInfo(String token);
//---------- old api get user info --------
  Future getAgentProfile(String token);

//------------- new api get user info ------
  Future getUserProfile(String token);
  //----- get setting from mlm api -------------
  Future getSettings();

  Future getAllAgent();

  Future getAllAgentByPage(String page);

  Future getAgentDetails(String userName);

  Future sendMessageToAgent(AgentStateModel messages);

  //---------- old api of update user profile ----------
  Future<String> updateAgentProfileInfo(String token, ProfileStateModel body);
  //------------- new api of update user profile ---------
  Future<String> updateUserProfileInfo(String token, ProfileStateModel body);

  Future getFaqContent();

  Future getPrivacyPolicy();

  Future getTermsAndCondition();

  Future getReviewList(String token);

  Future getWishListProperties(String token);

  Future<String> addToWishlist(String token, String id);

  Future<String> removeFromWishlist(String token, String id);

  Future getContactUs();

  Future<String> sendContactUsMessage(ContactUsStateModel body);

  Future getAboutUs();

  Future getAllOrders(String token);

  Future getOrderDetails(String token, String orderId);

  Future getPricePlan();

  Future getPaymentPageInformation(String token, String planSlug);

  Future<String> freeEnrollment(String token, String planSlug);

  Future<String> bankPayment(
      String token, String planSlug, Map<String, String> body);

  Future<String> stripePayment(
      String token, String planSlug, StripePaymentStateModel body);

  Future<Map<String, dynamic>> flutterWavePayment(Uri uri);

  //Future getPropertyDetail(String slug);

  Future getSearchProperty(Uri uri);

  Future getAllProperty();

  Future getPropertyByPage(String numPage);

  Future getFilterProperty(Uri uri);

  Future filterOptionAPIer(String token);

  Future getSummaryData(String token, String startDate, String endDate);

  Future getApierDetailByFilter(
      String token, String startDate, String endDate, String depth);

  Future<String> logOut(String token);
//----- get product subscription plan with mlm api ----
  Future getProduct(String token, String group);
//-------- submit payment link with kess -----------
  Future submitPaymentLink(String token, Map<String, dynamic> body);
}

typedef CallClientMethod = Future<http.Response> Function();

class RemoteDataSourceImp extends RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImp({required this.client});

  final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };

  final postDeleteHeader = {
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };

  @override
  Future signIn(Map body) async {
    final headers = postDeleteHeader;
    final uri = Uri.parse(RemoteUrls.userLogin);

    final clientMethod = client.post(uri, headers: headers, body: body);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getHomeData() async {
    final headers = {'Accept': 'application/json'};
    final uri = Uri.parse(RemoteUrls.homeUrl);
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getPropertyCreateInfo(String token, String purpose) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.createPropertyInfoUrl(purpose));
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getCheckPricing(String token, String purpose) async {
    //final headers = {'Accept': 'application/json'};
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.checkPricingPlan(purpose));
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getPropertyChooseInfo(String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getPropertyChooseInfo());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['property_content'];
  }

  @override
  Future websiteSetup() async {
    final uri = Uri.parse(RemoteUrls.websiteSetup);

    final clientMethod = client.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);

    return responseJsonBody;
  }

  /// I have to change from api base to api mode -------

  @override
  Future<String> userRegister(Map<String, dynamic> userInfo) async {
    final uri = Uri.parse(RemoteUrls.register);

    final clientMethod = client.post(
      uri,
      headers: postDeleteHeader,
      body: userInfo,
    );
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future<String> sendForgotPassCode(Map<String, dynamic> body) async {
    final uri = Uri.parse(RemoteUrls.sendForgetPassword);

    final clientMethod = client.post(
      uri,
      headers: postDeleteHeader,
      body: body,
    );
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  // @override
  // Future<String> setPassword(SetPasswordModel body) async {
  //   final uri = Uri.parse(RemoteUrls.storeResetPassword);

  //   final clientMethod = client.post(
  //     uri,
  //     headers: postDeleteHeader,
  //     body: body.toMap(),
  //   );
  //   final responseJsonBody =
  //       await NetworkParser.callClientWithCatchException(() => clientMethod);
  //   return responseJsonBody['message'];
  // }

  @override
  Future<String> sendActiveAccountCode(String email) async {
    final uri = Uri.parse(RemoteUrls.resendRegisterCode);

    final clientMethod = client.post(
      uri,
      headers: postDeleteHeader,
      body: {'email': email},
    );
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future<String> activeAccountCodeSubmit(Map<String, String> body) async {
    final uri = Uri.parse(RemoteUrls.userVerification);

    final clientMethod =
        client.post(uri, body: body, headers: postDeleteHeader);

    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future<String> resendVerificationCode(Map<String, String> email) async {
    final uri = Uri.parse(RemoteUrls.resendVerificationCode);

    final clientMethod =
        client.post(uri, body: email, headers: postDeleteHeader);

    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future<String> passwordChange(
    ChangePasswordStateModel changePassData,
    String token,
  ) async {
    //final headers = postDeleteHeader;
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.changePassword());

    final clientMethod =
        client.post(uri, headers: headers, body: changePassData.toMap());
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] ?? "";
  }

  @override
  Future<String> logOut(String token) async {
    // final headers = {'Accept': 'application/json'};
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.userLogOut());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] as String;
  }

  @override
  Future<void> getAgentDashboardInfo(String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getAgentDashboardInfo());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  //------------ old api of update profile -------------
  @override
  Future<String> updateAgentProfileInfo(
      String token, ProfileStateModel body) async {
    final url = Uri.parse(RemoteUrls.updateAgentProfileInfo());
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': 'Bearer $token'
    };
    // final clientMethod = client.put(url, headers: headers,body: body);
    final request = http.MultipartRequest(
      'POST',
      url,
    );
    request.fields.addAll(body.toMap());

    request.headers.addAll(headers);
    if (body.image.isNotEmpty) {
      print('immmmmm: ${body.image}');
      final file = await http.MultipartFile.fromPath('image', body.image);
      request.files.add(file);
    }
    // final file = await http.MultipartFile.fromPath('image', body.image);
    // request.files.add(file);

    http.StreamedResponse response = await request.send();
    final clientMethod = http.Response.fromStream(response);

    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] as String;
  }

  @override
  Future getFaqContent() async {
    final uri = Uri.parse(RemoteUrls.getFaqContent());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['faq'];
  }

  @override
  Future getSinglePropertyDetails(String slug) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final uri = Uri.parse(RemoteUrls.singlePropertyDetailsUrl(slug));

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getTermsAndCondition() async {
    final uri = Uri.parse(RemoteUrls.getTermsAndCondition());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['terms_conditions'];
  }

  @override
  Future getPrivacyPolicy() async {
    final uri = Uri.parse(RemoteUrls.getPrivacyPolicy());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['privacyPolicy'];
  }

  @override
  Future getReviewList(String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getReviewList());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['reviews'];
  }

  @override
  Future getWishListProperties(String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getWishListProperties());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future<String> addToWishlist(String token, String id) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.addToWishlist(id));
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future<String> removeFromWishlist(String token, String id) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.removeFromWishlist(id));
    final clientMethod = client.delete(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future getContactUs() async {
    final uri = Uri.parse(RemoteUrls.getContactUs());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future<String> sendContactUsMessage(ContactUsStateModel body) async {
    final uri = Uri.parse(RemoteUrls.sendContactUsMessage);
    final headers = postDeleteHeader;

    final clientMethod = client.post(uri, body: body.toMap(), headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] as String;
  }

  @override
  Future getAboutUs() async {
    final uri = Uri.parse(RemoteUrls.getAboutUs());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  //--------------- old api get user info --------------
  @override
  Future getAgentProfile(String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getAgentProfile());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['user'];
  }

  @override
  Future getAllAgent() async {
    final uri = Uri.parse(RemoteUrls.getAllAgent());
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getAllAgentByPage(String page) async {
    final uri = Uri.parse(RemoteUrls.getAllAgentByPage(page));
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getAgentDetails(String userName) async {
    final uri = Uri.parse(RemoteUrls.getAgentDetails(userName));

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future sendMessageToAgent(AgentStateModel messages) async {
    final uri = Uri.parse(RemoteUrls.sendMessageToAgent());
    final header = postDeleteHeader;
    final clientMethod =
        client.post(uri, body: messages.toMap(), headers: header);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future getAllOrders(String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getAllOrders());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getOrderDetails(String token, String orderId) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getOrderDetails(orderId));

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['order'];
  }

  @override
  Future getPricePlan() async {
    final uri = Uri.parse(RemoteUrls.getPricePlan());

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getPaymentPageInformation(String token, String planSlug) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getPaymentPageInformation(planSlug));

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future<String> freeEnrollment(String token, String planSlug) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.freeEnrollment(planSlug));

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] as String;
  }

  @override
  Future<String> bankPayment(
      String token, String planSlug, Map<String, String> body) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    //final headers = postDeleteHeader;
    final uri = Uri.parse(RemoteUrls.bankPayment(planSlug));

    final clientMethod = client.post(uri, body: body, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] as String;
  }

  @override
  Future<String> stripePayment(
      String token, String planSlug, StripePaymentStateModel body) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    //final headers = postDeleteHeader;
    final uri = Uri.parse(RemoteUrls.stripePayment(planSlug));

    final clientMethod = client.post(uri, body: body.toMap(), headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] as String;
  }

  @override
  Future<Map<String, dynamic>> flutterWavePayment(Uri uri) async {
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody as Map<String, dynamic>;
  }

  @override
  Future getSearchProperty(Uri uri) async {
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['properties'];
  }

  @override
  Future getAllProperty() async {
    final uri = Uri.parse(RemoteUrls.getAllProperty);
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getPropertyByPage(String numPage) async {
    final uri = Uri.parse(RemoteUrls.getPropertyByPage(numPage));
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getFilterProperty(Uri uri) async {
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future createPropertyRequest(PropertyCreateModel data, String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    // final headers = postDeleteHeader;
    final uri = Uri.parse(RemoteUrls.createPropertyUrl());

    final request = http.MultipartRequest('POST', uri);
    request.fields.addAll(data.toMap());

    log('create property map data:', name: '${data.toMap()}');

    request.headers.addAll(headers);

    if (data.propertyImageDto.thumbnailImage != '') {
      print("================thumbnail_image");
      print(data.propertyImageDto.thumbnailImage);
      final thumbImage = await http.MultipartFile.fromPath(
          'thumbnail_image', data.propertyImageDto.thumbnailImage);
      request.files.add(thumbImage);
    }

    if (data.propertyImageDto.sliderImages.isNotEmpty) {
      for (var i = 0; i < data.propertyImageDto.sliderImages.length; i++) {
        final file = await http.MultipartFile.fromPath(
            'slider_images[$i]', data.propertyImageDto.sliderImages[i].image);
        request.files.add(file);
      }
    }

    // if (data.propertyVideoDto.videoThumbnail != '') {
    //   final file = await http.MultipartFile.fromPath(
    //       'video_thumbnail', data.propertyVideoDto.videoThumbnail);
    //   request.files.add(file);
    // }

    if (data.propertyPlanDto.isNotEmpty) {
      for (var i = 0; i < data.propertyPlanDto.length; i++) {
        print("image crete===========");
        print("Path ${data.propertyPlanDto[i].planImages}");
        if (data.propertyPlanDto[i].planImages.isNotEmpty) {
          final file = await http.MultipartFile.fromPath(
              'plan_images[$i]', data.propertyPlanDto[i].planImages);
          request.files.add(file);
        }
      }
    }

    http.StreamedResponse response = await request.send();
    final clientMethod = http.Response.fromStream(response);

    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future<String> updatePropertyRequest(
      String id, PropertyCreateModel data, String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    // final headers = postDeleteHeader;
    final uri = Uri.parse(RemoteUrls.updatePropertyUrl(id));

    log('update property map data:', name: '${data.toMap()}');
    final request = http.MultipartRequest('POST', uri);
    request.fields.addAll(data.toMap());

    request.headers.addAll(headers);

    if (data.propertyImageDto.thumbnailImage.contains('https://') == false) {
      final thumbImage = await http.MultipartFile.fromPath(
          'thumbnail_image', data.propertyImageDto.thumbnailImage);
      request.files.add(thumbImage);
    }

    for (var i = 0; i < data.propertyImageDto.sliderImages.length; i++) {
      final element = data.propertyImageDto.sliderImages[i];
      if (element.image.contains('https://') == false) {
        final file = await http.MultipartFile.fromPath(
            'slider_images[$i]', element.image);
        request.files.add(file);
      }
    }

    // if (data.propertyVideoDto.videoThumbnail.contains('https://') == false) {
    //   final file = await http.MultipartFile.fromPath(
    //       'video_thumbnail', data.propertyVideoDto.videoThumbnail);
    //   request.files.add(file);
    // }

    if (data.propertyPlanDto.isNotEmpty) {
      for (var i = 0; i < data.propertyPlanDto.length; i++) {
        final element = data.propertyPlanDto[i].planImages;
        final id = data.propertyPlanDto[i].id;
        print("pln img $element");
        if (element.isNotEmpty && element.contains('https://') == false) {
          final file =
              await http.MultipartFile.fromPath('plan_images[$i]', element);
          request.files.add(file);
        } else if (element.isNotEmpty) {
          final imgPath = element.split(RemoteUrls.rootUrl).last;
          print("imgPath $imgPath");
          final file =
              http.MultipartFile.fromString('existing_plan_image_$id', imgPath);
          request.files.add(file);
        }
      }
    }

    http.StreamedResponse response = await request.send();
    final clientMethod = http.Response.fromStream(response);

    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] as String;
  }

  @override
  Future getPropertyEditInfo(String id, String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    // final headers = {'Accept': 'application/json'};
    final uri = Uri.parse(RemoteUrls.editInfoUrl(id));

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future<String> removeSingleAddInfoApi(String id, String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.removeSingleAddInfoUrl(id));

    final clientMethod = client.delete(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future<String> removeSingleNearestLocationApi(String id, String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.removeSingleNearestLocationUrl(id));

    final clientMethod = client.delete(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future<String> removeSinglePlanApi(String id, String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.removeSinglePlanUrl(id));

    final clientMethod = client.delete(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future<String> removeSliderImageApi(String id, String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.removeSliderImageUrl(id));

    final clientMethod = client.delete(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  @override
  Future<String> deleteProperty(String id, String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.deletePropertyUrl(id));

    final clientMethod = client.delete(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  // --------------request otp with new api model ---------------
  @override
  Future requestOtp(Map<String, dynamic> body) async {
    debugPrint("---- otp request 1 : $body ");
    final headers = {'Accept': 'application/json'};
    debugPrint("---- otp request 2 ");
    final uri = Uri.parse(RemoteUrls.requestOtp());
    debugPrint("---- otp request 3 : $uri ");
    final clientMethod = client.post(uri, headers: headers, body: body);
    debugPrint("---- otp request 4 : $clientMethod");
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    debugPrint("---- otp request 5 : ${responseJsonBody['data']}");
    return responseJsonBody;
  }

  // --------------verify otp with new api model ---------------
  @override
  Future<String> verifyOtp(VerifyOtpModel body) async {
    final uri = Uri.parse(RemoteUrls.verifyOtp);
    final clientMethod = client.post(
      uri,
      headers: postDeleteHeader,
      body: body.toMap(),
    );
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  // --------------login with new api model ---------------
  @override
  Future login(Map body) async {
    final headers = postDeleteHeader;
    final uri = Uri.parse(RemoteUrls.login);

    final clientMethod = client.post(uri, headers: headers, body: body);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  //-------------- verify forgot password ----------
  @override
  Future<String> verifyForgotPassword(Map<String, dynamic> body) async {
    final uri = Uri.parse(RemoteUrls.verifyForgotPassword);

    final clientMethod = client.post(
      uri,
      headers: postDeleteHeader,
      body: body,
    );
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'];
  }

  //------------- new api get user info ----------------
  @override
  Future getUserProfile(String token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getUserProfile);

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['data'];
  }

  //-------------- new api update user profile -------------
  @override
  Future<String> updateUserProfileInfo(
      String token, ProfileStateModel body) async {
    final url = Uri.parse(RemoteUrls.getUserProfile);
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': 'Bearer $token'
    };
    // final clientMethod = client.put(url, headers: headers,body: body);
    final request = http.MultipartRequest(
      'POST',
      url,
    );
    request.fields.addAll(body.toMap());

    request.headers.addAll(headers);
    if (body.image.isNotEmpty) {
      print('immmmmm: ${body.image}');
      final file = await http.MultipartFile.fromPath('image', body.image);
      request.files.add(file);
    }
    // final file = await http.MultipartFile.fromPath('image', body.image);
    // request.files.add(file);

    http.StreamedResponse response = await request.send();
    final clientMethod = http.Response.fromStream(response);

    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['message'] as String;
  }

  //------- get product subscription with mlm api ---------
  @override
  Future getProduct(String token, String group) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getProduct(group));

    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future submitPaymentLink(String token, Map<String, dynamic> body) async {
    final headers = {
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.submitPaymentLink);

    final clientMethod = client.post(
      uri,
      headers: headers,
      body: body,
    );
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future filterOptionAPIer(token) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.getFilterOption);
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody['data'];
  }

  @override
  Future getSummaryData(token, startDate, endDate) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    print(RemoteUrls.getFilterSummary(startDate, endDate));
    final uri = Uri.parse(RemoteUrls.getFilterSummary(startDate, endDate));
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  @override
  Future getApierDetailByFilter(token, startDate, endDate, depth) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri =
        Uri.parse(RemoteUrls.getApierDetailByFilter(startDate, endDate, depth));
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }

  //----------- get settings from mlm api -------------
  @override
  Future getSettings() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final uri = Uri.parse(RemoteUrls.getSettings);
    final clientMethod = client.get(uri, headers: headers);
    final responseJsonBody =
        await NetworkParser.callClientWithCatchException(() => clientMethod);
    return responseJsonBody;
  }
}
