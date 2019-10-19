import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  @override
   _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
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
                  onTap: ()=>Navigator.of(context).pop(),
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
                image: AssetImage("assets/newwhite.JPG"),
            
            
          ),
        ),
       child:Center(
         
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             
             
             Container(
                padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 40.0),
                child: Image(
                  image: AssetImage("assets/plant.JPG"),
                  width: 250.0,
                  height: 250.0,
                ),
              ),
              
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