import 'package:api_and_model_class/model/users_model.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatefulWidget {

  final UsersModel userData;
  const DetailScreen({Key? key, required this.userData}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Card(
        child: ListTile(
          title: Text(widget.userData.company!.bs.toString()),
          subtitle: Text(widget.userData.address!.city.toString()),
          leading: CircleAvatar(
            child: Icon(Icons.people_alt_sharp),
          ),
          trailing: Icon(Icons.delete),
        ),
      ),

    ),);
  }
}
