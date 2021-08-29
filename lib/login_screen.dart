import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training2/main.dart';
class Screenlogin extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginScreen(),
    );
  }
}

class loginScreen extends StatefulWidget {


  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String _email='';
  String _password='';

  bool passwordvibil=true;
 final _emailcontroller=TextEditingController();
  final _passcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
       body: Center(
         child: SingleChildScrollView(
           child: Card(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
             margin: EdgeInsets.all(15),
             child: Container(
               width:700,
               height: 500,


                   child: Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Column(


                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         TextField( decoration: InputDecoration(

                           border: OutlineInputBorder(
                             borderSide: BorderSide(width: 2),
                             borderRadius: BorderRadius.circular(15)
                           ),
                           hintText: 'Enter email address',
                           suffixIcon: Icon(Icons.alternate_email)
                         ),
                           keyboardType: TextInputType.emailAddress,
                           controller: _emailcontroller,


                         ),
                         SizedBox(height: 20,),
                         TextField( decoration: InputDecoration(
                           suffixIcon: IconButton(
                             icon: Icon(passwordvibil?Icons.visibility:Icons.visibility_off),
                             onPressed: (){
                               setState(() {
                                 passwordvibil=!passwordvibil;
                               });
                             },
                           ),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15),
                             borderSide: BorderSide(
                               width: 2                           )
                           ),
                           hintText: 'Enter Password',
                         ),

                           keyboardType: TextInputType.visiblePassword,

                           controller: _passcontroller,
                           obscureText: passwordvibil,


                         ),
                         SizedBox(height: 20,),
                         Builder(
                           builder:(ctx)=> RaisedButton(
                             child: Text('login',style: TextStyle(fontSize: 20),),
                               onPressed: ()async{
                               SharedPreferences _peref= await SharedPreferences.getInstance();
                               _peref.setString('email', _emailcontroller.text);
                               _peref.setString('pass', _passcontroller.text);
                               Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder:(_)=>MyHomePage()));
                               

                               }),
                         )
                       ],

                 ),
                   ),
               ),
             ),
         ),


       ),
    );
  }
}
