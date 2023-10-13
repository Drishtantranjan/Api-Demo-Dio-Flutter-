import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Social extends StatefulWidget {
  const Social({super.key});

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  List<dynamic> Users = [];

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  Future<void> getUserProfile() async {
    try {
      var response =
          await Dio().get("https://dummyapi.io/data/v1/user?limit=10");
      setState(() {
        Users = response.data;
      });
    } catch (error) {
      print("Error found : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sociofy",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
        ),
        itemCount: Users.length,
        itemBuilder: (BuildContext context, int index) {
          final profiles = Users[index];

          return GridTile(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // Background color
                ),
                child: Image.network(
                  profiles['User'],
                  fit: BoxFit.contain, // Ensure the image fills the container
                ),
              ),
            ),
            footer: Container(
              color: Colors.white, // Footer background color
              child: ListTile(
                title: Text(profiles['title']),
              ),
            ),
          );
        },
      ),
    );
  }
}
