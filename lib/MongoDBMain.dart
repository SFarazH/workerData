import 'dart:convert';
import 'dart:ffi';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));
String mongoDbModeltoJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel(
      {required this.id,
      //required this.username,
      required this.name,
      //required this.previouswork,
      required this.empID,
      //required this.currentwork,
      //required this.attendance,
      //required this.flag
   });

  ObjectId id;
  //String username;
  String name;
  String empID;
  //Array previouswork;
  //String currentwork;
  //num attendance;
  //bool flag;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        //username: json["username"],
        name: json["name"],
        //previouswork: json["previouswork"],
        empID: json["empID"],
       // currentwork: json["currentwork"],
        //attendance: json["attendance"],
        //flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        //"username": username,
        "name": name,
        //"previouswork": previouswork,
        "empID": empID,
        //"currentwork": currentwork,
        //"attendance": attendance,
        //"flag": flag,
      };
}
