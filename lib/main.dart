
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:work/secondscreen.dart';


void main() {
  runApp( LoginScreen()) ;
}
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void login(String email,password) async{
    try{
    Response response=await post(
      Uri.parse('localhost'),
        body:{
        'email': email.toString(),
        'password':password.toString()
      }
    );
    if(response.statusCode==200){
      print('I get data');

    }else{print('faild');
    }

    }
    catch(e){
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                SafeArea(child: Text('Lets get you logged in!',style: TextStyle(color: Colors.black,fontSize: 23),)),
                SizedBox(
                  height: 10,
                ),

              const   Padding(
                  padding:  EdgeInsets.all(8.0),

                  child: Text('The first step to booking photographers,buying gift cards and more',style: TextStyle(color: Colors.black,fontSize: 13),),
                ),
                 SizedBox(
                   height: 100,
                 ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Email',style: TextStyle(fontSize: 14),),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                          //  prefix: Icon(Icons.email_rounded),
                              suffixIcon: Icon(Icons.email_rounded),

                              border: OutlineInputBorder(),
                              labelText: 'Enter your email address'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Password',style: TextStyle(fontSize: 14),),
                          SizedBox(
                            width: 180,
                          ),
                          Text('Forgot your password?',style: TextStyle(fontSize: 12,color: Colors.blue),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter your password'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(

                  ),
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate())
                     { login(_emailController.text.toString(),_passwordController.text.toString());}
                    },
                    child:  Text('Login'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Dont have an account?'),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Secondscreen()),
                          );
                        },
                        child: Text('Sign up',style: TextStyle(color: Colors.blue),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



