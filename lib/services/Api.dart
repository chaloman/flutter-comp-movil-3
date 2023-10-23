import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Api {
  static const String baseUrl = "https://us-central1-tienda-flutter-e03a4.cloudfunctions.net/api";

  static Future<void> storeShared(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<void> getShared(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString(key);
  }

  static Future<Map<String, dynamic>> login (email, password) async {

      final response = await http.post(
        Uri.parse("https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyAP5yYZPktHp7WPXkKHeh917nzTd2u8mi0"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true
        }),
      );

      if (response.statusCode == 200) {

        final jsonResponse = json.decode(response.body);

        storeShared("token", jsonResponse["idToken"]);
        storeShared("userId", jsonResponse["localId"]);

        return jsonResponse;

      } else {
        throw Exception('Error en la solicitud POST: ${response.statusCode}');
      }
  }


  static Future get(String endpoint) async {
    var token = (await getShared("token") as String);
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'), headers: {
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error en la solicitud GET: ${response.statusCode}');
    }
  }

  static Future post(String endpoint, Map<String, dynamic> data) async {
    var token = await getShared("token") as String;

    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json', "Authorization": "Bearer $token"},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {

      final jsonResponse = json.decode(response.body);

      storeShared("token", jsonResponse["idToken"]);
      storeShared("userId", jsonResponse["localId"]);

      return jsonResponse;
    } else {
      throw Exception('Error en la solicitud POST: ${response.statusCode}');
    }
  }
}
