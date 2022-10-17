import 'package:flutter/material.dart';
import 'package:github_api_demo/api/github_api.dart';

import '../models/user.dart';

class FollowingPage extends StatefulWidget {
  final User user;
  const FollowingPage({required this.user});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  final api = GitHubApi();
  late Future<List<User>> _futureFollowings;

  @override
  void initState() {
    _futureFollowings = api.getFollowing(widget.user.login);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Following"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(widget.user.avatarUrl),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.user.login,
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: FutureBuilder<List<User>>(
            future: _futureFollowings,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                var followings = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: followings.length,
                  itemBuilder: ((context, index) {
                    var user = followings[index];
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatarUrl)),
                      title: Text(user.login),
                      trailing: const Text(
                        "Following",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    );
                  }),
                );
              }
            },
          ))
        ]),
      ),
    );
  }
}
