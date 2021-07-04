// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'prokolpo_bebosthapok.dart';
import 'user_model.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AttendanceApp",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

/*Future<UserModel?> createUser(String name, String pass) async{
  const String apiUrl = "https://reqres.in/api/users";

  final myResponse = await http.post(apiUrl, body: {
    "name" : name,
    "job" : pass
  });

  if(myResponse.statusCode == 201)
    {
      final String responseString = myResponse.body;

      return userModelFromJson(responseString);
    }else{
    return null;
  }
}*/

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController getNameController = TextEditingController();
    TextEditingController getPassController = TextEditingController();
    String pass = "";
    String username = "";
    Color colorLoginBtn = const Color(0x00e7ecfa);
    // final ButtonStyle btnStyle = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16.0, color: Colors.blue), primary: Colors.lightBlueAccent  );

    void _loginMethod() {
      setState(() {
        username = getNameController.text;
        pass = getPassController.text;

        // final UserModel user =  createUser(username, pass)

        if(username.isNotEmpty && pass.isNotEmpty)
          {

          }else{
          
        }

        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProkolpoBebosthapok()));
/*        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the user has entered by using the
              // TextEditingController.
              content: Text(username),
            );
          },
        );*/
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 2.0,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Image.asset(
                      "assets/images/ic_home_1.png",
                      height: 35.0,
                      width: 35.0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: const Text(
                      'বীর নিবাস',
                      style: TextStyle(fontSize: 20.0, color: Colors.blue),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: TextField(
                      /*  onChanged: (text){
                        username = text;
                      },*/
                      controller: getNameController,
                      // obscureText: true,
                      maxLines: 1,

                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Enter user name here",
                          labelStyle: TextStyle(color: Colors.black87),
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: "Username",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.only(top: 10.0)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextField(
                      /*onChanged: (text) {
                        pass = text;
                      },*/
                      controller: getPassController,
                      obscureText: true,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.black87),
                          labelText: "Password",
                          hintText: "Enter password here",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.only(top: 10.0)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Forgot Password?",
                                  style: TextStyle(color: Colors.black54, fontSize: 12.0),
                                  /* recognizer: TapGestureRecognizer()..onTap = () => showDialog(context: context, builder: (context) {
                                    return AlertDialog(
                                      content: Text(getNameController.text)
                                    );
                                  }),*/
                                ),
                              ],


                            )
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5.0),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue),
                          ),
                          onPressed: _loginMethod,
                          child: const Text(
                            'Login',
                            style:
                            TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
