import 'package:flutter/material.dart';
import 'package:fintech/Screen/HomePage.dart';
import 'package:fintech/Screen/OtpPage.dart';
import 'package:fintech/Constant/Constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Navigation',
        home: MainPage(),

        routes: <String, WidgetBuilder>{
          HOME_SCREEN: (BuildContext context) => new MainPage(),
          OTP_SCREEN: (BuildContext context) => new OtpPage(),
        }

    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return Scaffold(

      backgroundColor: Color(0xFF00BFA5),
      appBar: AppBar( title: Center(child:Text('Fintech'),

      ),
        backgroundColor: Color(0xFF00BFA5),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFeaeaea),Color(0xFFeaeaea)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child:  ListView(
          children: <Widget>[
            Text( 'Welcome',
              style: TextStyle(fontSize: 30.0), ),
            Image.network( 'http://breeur.in/Logo.png', height: 400, width: 250 ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.brown,
              child: Text('Click here to continue'),
              onPressed:() {
                navigateToSubPage(context);
              },

            ),
          ],
        ),
      ),
    );
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}

