import 'package:flutter/material.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage();

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
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
            child: const Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/583231?v=4"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Octocat",
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            // Lista de usuários seguindo
            child: Container(),
          ),
        ]),
      ),
    );
  }
}
