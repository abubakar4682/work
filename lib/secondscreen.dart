import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Secondscreen extends StatefulWidget {
  const Secondscreen({Key? key}) : super(key: key);

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  var data;
  Future<void> getuserApi() async{

    final  response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
   if(response.statusCode==200){
     data=jsonDecode(response.body.toString());
     print(data);
     print('asdsad');
   }

   else
     {
       Text('loading');
     }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('API testing'),),
        body:  Column(
          children: [
      FutureBuilder(
          future:getuserApi() ,
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Text('loading');
            }else{

              return ListView.builder(
                  itemBuilder: (context,index){
                    return Card(
                      child: Column(
                        children: [
                          Text(data[index]['albumId'].toString())
                        ],
                      ),
                    );

              });
            }
          })

          ],
        ),
      ),
      

    );
  }
}
