import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  var _username;
  var _password;

void _login() async{
var url = 'https://smart-i-server.herokuapp.com/login';
var response = await http.post(url, body: {'user_name': _username, 'password': _password});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      Container(
        decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
          image: DecorationImage(
           
            fit: BoxFit.cover,
            //colorFilter: new ColorFilter.mode(Colors.black54, BlendMode.darken),
                image: AssetImage("assets/newwhite.JPG"),
            
            
          ),
        ),
        child: Center(
         child: ListView(
            children: <Widget>[
             
              // Container(
              //   padding: EdgeInsets.fromLTRB(70.0, 80.0, 70.0, 10.0),
              //   child: Image(
              //     image: AssetImage("assets/logo.png"),
              //     width: 100.0,
              //     height: 100.0,
              //   ),
              // ),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 215.0, 30.0, 10.0),
                child: Form(
                  //key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //email
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide an email';
                            }
                          },
                          decoration: InputDecoration(
                            
                            prefixIcon: Icon(Icons.email, color: Colors.black,),
                              labelText: 'Email',
                              labelStyle: TextStyle(
          color: Colors.black,
            
        ),
                              focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
 
                              
                              border: OutlineInputBorder(
                                
                                  borderRadius: BorderRadius.circular(5.0))),
                          onSaved: (input) => _username = input,
                        ),
                      ),
                      //password
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          // validator: (input) {
                          //   if (input.length < 6) {
                          //     return 'Password should be 6 char atleast';
                          //   }
                          // },
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                            color: Colors.black,
            
                               ),
                              prefixIcon: Icon(Icons.lock, color: Colors.black,),
                              focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          onSaved: (input) => _password = input,
                          obscureText: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
                        child: RaisedButton(
                          padding:
                              EdgeInsets.fromLTRB(35.0, 15.0, 35.0, 15.0),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                         onPressed: _login,
                          child: Text('Sign In',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0)),
                        ),
                      ),
                      
                      GestureDetector(
                        
                     onTap: ()=>Navigator.of(context).pushNamed("/SignupPage"),
                        child: Text('Create an account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.0)),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 40.0),
                child: Image(
                  image: AssetImage("assets/plant.JPG"),
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
