import 'package:api_test/model/posts_model.dart';
import 'package:api_test/services/api/post_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.data});
  final dynamic data;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> posts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost().then((value) {
      posts = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/logo.jpg",
              height: 250,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "Exam",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )),
            Center(
                child: Text("${widget.data}", style: TextStyle(fontSize: 20))),
            SizedBox(
              height: 30,
            ),
            Text(
              "Home",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "About",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Services",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Logout",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      appBar: AppBar(),
      body: (posts.isEmpty)
          ? Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text("${posts[index].id}"),
                    title: Text("${posts[index].title}"),
                  ),
                );
              },
            ),
    );
  }
}
