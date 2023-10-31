import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class GitHubApi {
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

  Future<List<User>> getFollowing(String userName) async {
    final url = '${baseUrl}users/$userName/following';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      var users = jsonList.map<User>((json) => User.fromJson(json)).toList();

      return users ?? [];
    } else {
      return [];
    }
  }
}
