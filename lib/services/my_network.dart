
import 'dart:convert';

import 'package:http/http.dart';
import 'package:task6_6_2/models/create_user.dart';
import 'package:task6_6_2/models/user.dart';

class Network{

  static String BASE = "dummy.restapiexample.com";

  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/";
  static String API_DELETE = "/api/v1/delete/";

  static Map<String,String> headers = {"Content-Type":"application/json; charset=UTF-8"};

  static Future<String> POST(String api,Map<String, dynamic> params) async{
    var url = Uri.http(BASE, api);
    var response = await post(url,body: jsonEncode(params),headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    else {
      return "request error";
    }
  }
  static Future<String> PUT(String api,Map<String, dynamic> params) async{
    var url = Uri.http(BASE, api);
    var response = await put(url,body: jsonEncode(params),headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    else {
      return "request error";
    }
  }

  static Future<String> DELETE(String api,Map<String, String> headers) async{
    var url = Uri.http(BASE, api,headers);
    var response = await delete(url);
    if(response.statusCode == 200){
      return response.body;
    }
    else{
      return "request error";
    }
  }


  static Map<String, dynamic> createParams(User user){
    var map = <String,dynamic>{};
    map.addAll({
      'name':user.name,
      'salary':user.salary,
      'age':user.age
    });
    return map;
  }

  static Map<String, dynamic> updateParams(User user){
    var map = <String,dynamic>{};
    map.addAll({
      'id':user.id,
      'name':user.name,
      'salary':user.salary,
      'age':user.age
    });
    return map;
  }

  static CreateUser parseCreate(String body){
    dynamic str = jsonDecode(body);
    var data = CreateUser.fromJson(str);
    return data;
  }

}