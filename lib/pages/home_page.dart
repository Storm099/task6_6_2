import 'package:flutter/material.dart';
import 'package:task6_6_2/models/create_user.dart';
import 'package:task6_6_2/models/user.dart';
import 'package:task6_6_2/services/my_network.dart';

class HomePage extends StatefulWidget {
  static String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void _apiCreate(User user){
    Network.POST(Network.API_CREATE, Network.createParams(user)).then((response){
      CreateUser createUser = Network.parseCreate(response);
      print(createUser.data!.name);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User user = User(name: "Yorqin",salary: 300,age: 22,id: 1);
    _apiCreate(user);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
backgroundColor: Colors.purpleAccent,
    );
  }
}
