import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../constants/app_url.dart';
import '../model/user_model.dart';
import '../share_preference/user_share_prefs.dart';

class AuthenticationProvider extends ChangeNotifier {
  Future<int> login(String email, String password) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(authUrl));

    request.fields['data'] = json.encode(
        UserLogin(email: email, password: password, oneSignalID: "56565656")
            .toJson());
    var response = await request.send();
    if (response.statusCode == 200) {
      Map<String, dynamic> parsedJson =
          json.decode(await response.stream.bytesToString());
      String token = parsedJson['token'];
      String uid = parsedJson['user']['_id'];

      SessionManager.createSession(token);   /// Share Preference - Token Load
      print('Token: $token');
      print('UID: $uid');
      notifyListeners();
      return 200;
    } else {
      print("Error: ${response.statusCode}");
      print("Error: ${await response.stream.bytesToString()}");
      notifyListeners();
      return response.statusCode;
    }

    return 400;
  }

  Future<int> SignUp(String email, String password) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("https://testgeniepers.onrender.com/users/register"));

    request.fields['data'] = json.encode(
        UserSignup(email: email, password: password, oneSignalID: "56565656")
            .toJson());
    var response = await request.send();
    if (response.statusCode == 201) {
      Map<String, dynamic> parsedJson =
      json.decode(await response.stream.bytesToString());
      String token = parsedJson['token'];
      String uid = parsedJson['user']['_id'];

      SessionManager.createSession(token);     /// Share Preference - Token Load
      print('Token: $token');
      print('UID: $uid');
      notifyListeners();
      return 201;
    } else {
      print("Error: ${response.statusCode}");
      print("Error: ${await response.stream.bytesToString()}");
      notifyListeners();
      return response.statusCode;
    }
  }

}
