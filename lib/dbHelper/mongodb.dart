import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:test1111/MongoDBMain.dart';
import 'package:test1111/dbHelper/constant.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> insert(MongoDbModel data) async{
    var result = await userCollection.insertOne(data.toJson());
    if(result.isSuccess){
      return "Data inserted";
    } else{
      return "Error while inserting data";
    }
  }

  static Future<List<Map<String, dynamic>>> getQueryData() async {
    final data = userCollection.find(where.eq("empID" ,  "102")).toList();
    userCollection.findOneAndReplace(
      /*{ category: "flag", status: false },
      { category: "flag", status: true },
    */);

    return data;
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }
}
