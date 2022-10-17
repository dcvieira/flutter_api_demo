class User {
  final String login;
  final String avatarUrl;
  final String htmlUrl;

  User(this.login, this.avatarUrl, this.htmlUrl);

  Map<String, dynamic> toJson() =>
      {'login': login, 'avatar_url': avatarUrl, 'html_url': htmlUrl};

  User.fromJson(Map json)
      : login = json['login'],
        avatarUrl = json['avatar_url'],
        htmlUrl = json['html_url'];
}
