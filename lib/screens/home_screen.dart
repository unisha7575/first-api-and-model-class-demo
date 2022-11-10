import 'dart:convert';

import 'package:api_and_model_class/model/users_model.dart';
import 'package:api_and_model_class/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<UsersModel> loadedData = <UsersModel>[];
  Future<void> loadData() async {
    http.Response res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    print("Line14: ${res.body}");
    setState(() {
      isLoading = false;
      loadedData = usersModelFromJson(res.body);
    });
  }

  @override

  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Users'
          ),
        ),
        body: (isLoading)? const Center(child: CircularProgressIndicator()):ListView(
          children: List.generate(loadedData.length, (index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=>DetailScreen(
                        userData: loadedData[index],
                    )));
              },
              child: Card(
                child: ListTile(
                  title: Text(loadedData[index].name.toString()),
                  trailing: const Icon(Icons.delete),
                  subtitle: Text(loadedData[index].username.toString()),
                  leading: CircleAvatar(
                    radius: 12.0,
                    child: Icon(Icons.person_outline),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
