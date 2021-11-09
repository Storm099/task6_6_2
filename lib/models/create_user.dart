
import 'package:task6_6_2/models/user.dart';

class CreateUser{

  String ?status;
  User ?data;

  CreateUser({this.status,this.data});

  CreateUser.fromJson(Map<String, dynamic> json):
      status = json['status'],
      data = User.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
    'status':status,
    'data':data!.toJson()
  };

}