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
  String myWord = "";


  void _apiCreate(User user){
    Network.POST(Network.API_CREATE, Network.createParams(user)).then((response){
      CreateUser createUser = Network.parseCreate(response);
      setState(() {
        myWord = createUser.toJson().toString();
      });
    });
  }

  void _apiUpdate(User user){
    Network.PUT(Network.API_UPDATE+user.id.toString(), Network.updateParams(user)).then((response){
      CreateUser createUser = Network.parseCreate(response);
      setState(() {
        myWord = createUser.toJson().toString();
      });
    });
  }

  void _apiDelete(User user){
    Network.DELETE(Network.API_DELETE+user.id.toString(), Network.headers).then((value) {
      setState(() {
        myWord = value.toString();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User user = User(name: "Yorqin",salary: 300,age: 22,id: 1);
    _apiDelete(user);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(myWord,style: const TextStyle(fontSize: 24),),
        ),
      ),
    );
  }
}
