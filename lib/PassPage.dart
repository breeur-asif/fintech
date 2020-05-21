import 'package:flutter/material.dart';
import 'package:fintech/DashPage.dart';

class PassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFE8F5E9),



      body: Container(

        child:  ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                ],
              ),
            ),
            headerSection(),
            textSection(),
            Container(
              width: 20.0,
              height: 40.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              margin: EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.brown,
                child: Text('Sign In'),
                onPressed:() {
                  navigateToDash(context);

                },



              ),
            )
          ],
        ),
      ),
    );
  }
  final TextEditingController passwordController = new TextEditingController();
  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }


  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Enter Password To Login",
          style: TextStyle(
              color: Colors.black45,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
    );
  }
  Future navigateToDash(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DashPage()));
  }

}