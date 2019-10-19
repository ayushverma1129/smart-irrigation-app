import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
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
              //   padding: EdgeInsets.fromLTRB(2.0, 200.0, 5.0, 50.0),
              //   child: Image(
              //     image: AssetImage("assets/logo.png"),
              //     width: 100.0,
              //     height: 100.0,
              //   ),
              // ),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 200.0, 30.0, 10.0),
                child: Form(
                  //key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide a name';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                            color: Colors.black,
            
                               ),
                              prefixIcon: Icon(Icons.person, color: Colors.black,),
                              focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          //onSaved: (input) => _name = input,
                        ),
                      ),
                      //email
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide an email';
                            }
                          },
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                            color: Colors.black,
            
                               ),
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email, color: Colors.black,),
                              fillColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                              border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.0))),
                                  
                          //onSaved: (input) => _email = input,
                        ),
                      ),
                      //password
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Password should be 6 char atleast';
                            }
                          },
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
                         // onSaved: (input) => _password = input,
                          obscureText: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: RaisedButton(
                          padding:
                              EdgeInsets.fromLTRB(35.0, 15.0, 35.0, 15.0),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                         // onPressed: signup,
                          child: Text('Sign In',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0)),
                        ),
                      ),
                      //redirect to signup page
                      // GestureDetector(
                      //  // onTap: navigateToSigninScreen,
                      //   child: Text('Create an account?',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontSize: 16.0)),
                      // ),
                      Container(
                padding: EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
                child: Image(
                  image: AssetImage("assets/plant.JPG"),
                  width: 100.0,
                  height: 100.0,
                ),
              ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
