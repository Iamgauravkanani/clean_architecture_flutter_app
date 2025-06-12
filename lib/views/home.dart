import 'package:api_demo/service/restService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic>? postData;
  bool isLoading = false;

  fetchPosts() async{
    setState(() {
      isLoading = true;
    });
    postData = await RestService.getPost();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchPosts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: (isLoading == true)?Center(child: CupertinoActivityIndicator()):(postData == null)?Center(child: Text("No Data")):ListView.builder(
        itemCount: postData?.length,
        itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Text("${postData?[index]['userId']}"),
              Text("${postData?[index]['id']}"),
              Text("${postData?[index]['title']}"),
              Text("${postData?[index]['completed']}"),
            ],
          ),
        );
      },),
    );
  }
}
