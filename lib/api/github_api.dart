// https://api.github.com/users/octocat
// https://api.github.com/users/octocat/following

// https://api.github.com/users/octocat
// https://api.github.com/users/octocat/following

import 'dart:convert';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class GithubApi {
  final String baseUrl = 'https://api.github.com/';
  final String token = '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';

  Future<User?> findUser(String userName) async {
    final url = '${baseUrl}users/$userName';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var user = User.fromJson(json);

      return user;
    } else {
      return null;
    }
  }
}
