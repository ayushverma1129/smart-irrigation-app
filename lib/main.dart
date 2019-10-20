import 'package:flutter/material.dart';
//import 'package:validate/validate.dart';
import 'package:http/http.dart' as http;
import 'HomePage.dart';
import 'SignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum AuthStatus{
  notSignedIn,
  signedIn,
}

class _MyHomePageState extends State<MyHomePage> {

  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void initState() {
    _getAuth();
    super.initState();
  }

  _getAuth() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authCheck = prefs.getBool("login") ?? false ;
    if(authCheck == true){
      setState(() {
        authStatus = AuthStatus.signedIn;
      });
    }else{
      setState(() {
        authStatus = AuthStatus.notSignedIn;
      });

    }
  }

  _navigateSignUp(){
    var route = new MaterialPageRoute(
        builder: (BuildContext context)=>new SignUpPage()
    );
    Navigator.of(context).push(route);

  }


    _login(username,password) async {
    bool login ;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = 'https://smart-i-server.herokuapp.com/login';
    var response = await http.post(url, body: {'user_name': username, 'password': password});
    print('Response status: ${response.statusCode}');
    if(response.statusCode == 200){
      login = true;
      await prefs.setBool('login',login);
      var route = new MaterialPageRoute(
          builder: (BuildContext context)=>new FirstPage()
      );
      Navigator.of(context).push(route);
    }
    print('Response body: ${response.body}');
  }

  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.notSignedIn:
        return new Scaffold(
          backgroundColor: Colors.green[200],
          body: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/girl.png"),
                fit: BoxFit.cover,
                color: Colors.black38,
                colorBlendMode: BlendMode.darken,
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("Smart Irrigation System",textAlign: TextAlign.center,style:new TextStyle(color: Colors.black,fontFamily:'Pacifico',fontSize: 30.0)
                  ),
                  new Form(child: new Theme(data: new ThemeData(brightness: Brightness.dark,primarySwatch:Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.teal,
                              fontSize: 20.0
                          )
                      )),
                      child: new Container(
                        padding: const EdgeInsets.all(40.0),
                        child: new Column(
                          children: <Widget>[
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Enter Username",
                                labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold

                              ),
                              ),
                              keyboardType: TextInputType.text,
                              controller: usernameController,
                            ),
                            new TextFormField(
                              obscureText: true,
                              decoration: new InputDecoration(
                                labelText: "Enter Password",
                                labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold

                              ),
                              ),
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                            ),
                            new Padding(
                                padding: const EdgeInsets.only(top: 80.0)
                            ),
                            new MaterialButton(
                              height: 50.0,
                              minWidth: 150.0,
                              color: Colors.teal,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                              
                              splashColor: Colors.teal,
                              textColor: Colors.white,
                              child: new Text("Login",style: TextStyle(fontWeight:FontWeight.bold ),),
                              onPressed: () {
                                _login(usernameController.text, passwordController.text);
                              },
                            ),
                            new Padding(padding: const EdgeInsets.only(top: 20.0)),
                            new MaterialButton(
                              height: 50.0,
                              minWidth: 150.0,
                              color: Colors.teal,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                              splashColor: Colors.teal,
                              textColor: Colors.white,
                              child: new Text("Sign Up",
                              style: TextStyle(fontWeight:FontWeight.bold ),),
                              onPressed: () {
                                _navigateSignUp();
                              },
                            )
                          ],
                        ),
                      )
                  )
                  )
                ],

              ),
            ],

          ),
        );
      case AuthStatus.signedIn:
        return new FirstPage();

    }


  }
}
