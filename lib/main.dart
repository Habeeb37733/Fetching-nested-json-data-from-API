import 'dart:convert';

import 'package:flutter/material.dart';

import 'main1.dart';
import 'model.dart';
import 'package:http/http.dart'as http;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ) );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Welcome> getapi() async{
    final response= await http.get(Uri.parse('http://174.138.121.52:3009/v1/product/getAllProduct'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      print(response.statusCode);
      return Welcome.fromJson(data);
    }else{
      return Welcome.fromJson(data);
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getapi(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    print(snapshot.data);
                    return Text("nodata");
                  }
                 else {
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context,index)
                    {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(snapshot.data!.data![index].name!.toString()),
                            subtitle: Text(snapshot.data!.data![index].brand!.toString()),
                            leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data!.data![index].image.toString() ),)
                          )
                        ],
                      );
                    }
                    );
                  }
                }

            ),
          )
        ],
      ),
    );
  }
}



