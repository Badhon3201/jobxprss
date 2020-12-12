import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobxpress/screens/published_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'email': email,
      };
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool _isLoading = false;

  my(String email, String pass)async {
    Map<String, String> headers = {"Content-type": "application/x-www-form-urlencoded"};
    Map data = {
      'email': email,
      'password': pass
    };
    //final response = await http.get('http://api.larntech.net/users/454/');
    String url = "http://api.larntech.net/users/"+"454";
    final response = await http.get(url);
    
    //print(response.body);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      //print(jsonString);
      var jsonMap = json.decode(jsonString);
      if(email == jsonMap['email']) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => PubliaherHome()),
                (Route<dynamic> route) => false);
      }else {
        print("Login Faild");
      }
    } else {
      throw Exception('Failed to load post');
    }

  }
  //we need the function from the server api
  signIn(String email, String pass)async{
    String url = "https://raw.githubusercontent.com/Badhon3201/abc/master/login.json";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"email":email,"password":pass};
    var jsonResponse;
    var res = await http.post(url,body: body);
    //need to check the api status
    if(res.statusCode == 200){
      print("ok");
      jsonResponse = json.decode(res.body);
      print("Response status: ${res.statusCode}");
      print("Response status: ${res.body}");
      if(jsonResponse != null){
        setState(() {
          _isLoading = false;
        });
        
        sharedPreferences.setString("token", jsonResponse["token"]);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route<dynamic> route) => false);

        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
      }
      else{
        setState(() {
          _isLoading = false;
        });
        print("Response status: ${res.body}");
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset('images/tlogo.png',height: 100,width: 200,),
                ),
                Text('Welcome Back',style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,

                ),),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text('Sign in your existing account',style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),),
                ),

                SizedBox(height: 20,),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Container(
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Emails',
                                    border: InputBorder.none,
                                    icon: Icon(Icons.person),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Container(
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextField(
                                  controller: _passController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: InputBorder.none,
                                    icon: Icon(Icons.lock),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:5, bottom:5, right: 12),
                      child: Text('Forgot Password?',style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 60,
                  width: 140,
                  child: RaisedButton(
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Text('Sign In',style: TextStyle(
                      fontSize: 20,color: Colors.white
                    ),),
                    onPressed:/*(){
                      //print(_emailController.text);
                      /*setState(() {
                        _isLoading = true;
                      });*/
                      my("akramuzzamansiddique@gmail.com", "12345");
                    }*/
                      _emailController.text == "" ||
                      _passController.text == ""
                      ? null
                      :(){
                        setState(() {
                          _isLoading = true;
                        });
                        my(_emailController.text, _passController.text);
                      }
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text('Or connect using',style: TextStyle(
                    fontSize: 17,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 120,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      onPressed: () {},
                      child: const Text('Google', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: Text("Don't have an account ?",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black54,
                          ),),
                        ),
                        SizedBox(width: 5,),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: Text("Sign Up",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.amber,
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
