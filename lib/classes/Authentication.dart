import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.5:8000/api/v1/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Parse response
      final Map<String, dynamic> parsed = json.decode(response.body);

      // Save token to shared preferences
      final SharedPreferences prefs = await _prefs;
      prefs.setString('token', parsed["token"]);

      return true;
    } else {
      return false;
    }
  }
}
