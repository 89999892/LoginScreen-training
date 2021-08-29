import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'anathor.dart';
import 'login_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
SharedPreferences _peref=await SharedPreferences.getInstance();
var email=_peref.getString('email');
 var pass= _peref.getString('pass');
  runApp(email==null&&pass==null?Screenlogin():MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 /* Future getFetch()async{
var res=await http.get('https://jsonplaceholder.typicode.com/photos');
if(res.statusCode==200){
  var object=json.decode(res.body);
  return object;
}

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFetch();
  }*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   setdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


      ),
      body: Center(

        child:Container(child:RaisedButton(child: Text('Go to another screen'),
          onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Anathor()));

          },
          
        )),


      ),

    );
  }
  setdata()async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    _pref.setString('Name', "Mohamed Montaser");
    _pref.setInt('Age', 21);
    _pref.setDouble('Height', 167.5);
    _pref.setBool('Developer', true);
    _pref.setString('Skill 1', "Dart");
    _pref.setString('Skill 2', "Flutter");


  }
}
