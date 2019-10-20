import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  void _logout() async{
    bool logout = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login',logout);
    var route = new MaterialPageRoute(
        builder: (BuildContext context)=>new MyHomePage()
    );
    Navigator.of(context).push(route);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Farm Automation'),
      ),
      drawer: Drawer(
        child:Container(


          child: ListView(

            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                ),
                accountName: Text("Ayush Verma"),
                accountEmail: Text("ayushverma1129av@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white60,
                  child: Text('AV'),
                ),
              ),
              ListTile(

                title: Text("Home",
                    style: TextStyle(fontWeight: FontWeight.bold,)),

                trailing: Icon(Icons.home,color: Colors.black,),
              ),
              ListTile(
                title: Text('Category',
                    style: TextStyle(fontWeight: FontWeight.bold,)),
                trailing: Icon(Icons.card_travel,color: Colors.black,),

              ),

              Divider(),

              ListTile(
                title: Text("SignOut",
                  style: TextStyle(fontWeight: FontWeight.bold,),),
                trailing: Icon(Icons.close,color: Colors.black,),
                onTap:_logout,
              ),
            ],
          ),
        ),),
      body:
      Container(
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: DecorationImage(

            fit: BoxFit.cover,
            //colorFilter: new ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: AssetImage("assets/girl.png"),


          ),
        ),
        child:Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            ],
          ),
        ),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud_circle),
        onPressed: (){},
      ),
    );
  }


}



