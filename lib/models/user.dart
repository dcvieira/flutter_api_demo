class User {
  final String login;
  final String avatarUrl;

  User(this.login, this.avatarUrl);

  factory User.fromJson(Map json) {
    return User(
      json['login'],
      json['avatar_url'],
    );
  }
}
