import 'package:flutter/material.dart';
import 'package:github_api_demo/api/github_api.dart';

import 'following_page.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final api = GitHubApi();
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              const SizedBox(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('images/github-icon.jpg'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Github",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.1)),
                child: TextField(
                  onChanged: (value) {
                    if (errorMessage != null) {
                      setState(() {
                        errorMessage = null;
                      });
                    }
                  },
                  controller: _controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    errorText: errorMessage,
                    border: InputBorder.none,
                    hintText: "Github username",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding: const EdgeInsets.all(20),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Align(
                  child: isLoading
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2,
                        )
                      : const Text(
                          'Get Your Following Now',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
                onPressed: () {
                  _getUser();
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  _getUser() {
    if (_controller.text.isEmpty) {
      setState(() {
        errorMessage = "Informe o nome de usuário";
      });
    } else {
      setState(() {
        isLoading = true;
      });
      api.findUser(_controller.text).then((user) {
        setState(() {
          isLoading = false;
        });

        if (user != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FollowingPage(user: user)));
        } else {
          setState(() {
            errorMessage = "Usuário não encontrado";
          });
        }
      });
    }
  }
}
