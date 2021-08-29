import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Anathor extends StatefulWidget {

  @override
  _AnathorState createState() => _AnathorState();
}

class _AnathorState extends State<Anathor> {


  List  values=['',0,6,false,'',''];


  List <String> elemantName=['Name :','Age :',"Height :","Developer :",'Skill 1 :','Skill 2 :'];

@override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('anatorScreen'),
      ),
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold),

            child:SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 500,
                    width: 500,
                    child: ListView.builder(itemBuilder: (context,index){

                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(horizontal:40,vertical: 10),
                        child: ListTile(
                          title: Text('${values[index]}'),
                          leading: Text(elemantName[index],style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                        ),
                      );
                    },
                      itemCount: elemantName.length,
                    ),
                  ),
                  RaisedButton(
                    child: Text('Get data'),
                      onPressed: ()async{
                      await getData();
                  })
                ],
              ),
            )


          ),


    );
  }
  getData()async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    setState(() {
      values[0]=_pref.getString('Name');
      values[1]=_pref.getInt('Age');
      values[2]=_pref.getDouble('Height');
      values[3]=_pref.getBool('Developer');
      values[4]=_pref.getString('Skill 1');
      values[5]=_pref.getString('Skill 2');
    });

  }

}
