import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:test1111/MongoDBMain.dart';
import 'package:test1111/dbHelper/mongodb.dart';

class MongoDbInsert extends StatefulWidget{
  MongoDbInsert({Key? key}) : super(key:key);

  @override
  _MongoDbInsertState createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert>{
  var nameController = new TextEditingController();
  var empController = new TextEditingController();
  var flagController = new TextEditingController();
  var idController = new TextEditingController();


  @override
  Widget build(BuildContext context){
    return Scaffold(body:
    SafeArea(child: Column(
      children:[
      Text("Insert Data",
        style: TextStyle(fontSize: 28)),
        SizedBox(
          height: 50,
        ),
        TextField(
          controller: empController,
          decoration: InputDecoration(labelText: "Employee ID"),
        ),
        SizedBox(
          height: 50,
        ),

        TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: "Name ID"),
        ),
        SizedBox(
          height: 50,
        ),

        TextField(
          controller: flagController,
          decoration: InputDecoration(labelText: "Employee ID"),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(onPressed: (){}, child: Text("Generate Data")),
            ElevatedButton(onPressed: (){_insertData(nameController.text, idController.text, empController.text);}, child: Text("Insert Data"))

        ],)
      ],
      )),
    );
  }

  Future<void> _insertData(Object id,String name,String empID) async{
    var _id = M.ObjectId();
    final data = MongoDbModel(
        id: _id, name: name, empID: empID);
      var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Inserted ID" + _id.$oid)));
  }

  void _clearAll(){

  }

  void _fakeData(){
    setState(() {
        nameController.text = faker.person.firstName();
    });
  }
}

