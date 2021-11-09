
import 'package:task6_6_2/models/user.dart';

class CreateUser{

  String ?status;
  User ?data;
  String? message;

  CreateUser({this.status,this.data,this.message});

  CreateUser.fromJson(Map<String, dynamic> json):
      status = json['status'],
      message = json['message'],
      data = User.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
    'status':status,
    'message':message,
    'data':data!.toJson()
  };

}