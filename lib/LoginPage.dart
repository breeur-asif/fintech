import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:fintech/PassPage.dart';
class Post {
final String userId;

final String body;

Post({this.userId,this.body});

factory Post.fromJson(Map<String, dynamic> json) {
return Post(
userId: json['userId'],

body: json['body'],
);
}
Map toMap() {
  var map = new Map<String, dynamic>();
  map["userId"] = userId;
  map["body"] = body;
  return map;
}
}
Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
    print(response.body);
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));

  });
}



class LoginPage extends StatelessWidget {
  final Future<Post> post;

  LoginPage({Key key, this.post}) : super(key: key);
  static final CREATE_POST_URL = 'http://breeur.in/fintech/userlogin.php';
  TextEditingController bodyControler = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F5E9),
      body:  Container(

        child:  ListView(

          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                ],
              ),
            ),
            Text('Login Page',
              style: TextStyle(fontSize: 30.0),),
            Image.asset( 'assets/Logo.png', height: 400, width: 250 ),

            TextField(
              controller: bodyControler,
              decoration: new InputDecoration(labelText: "10 Digit Mobile Number"),

              keyboardType: TextInputType.number,

              // Only numbers can be entered
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.brown,
              child: Text('Generate OTP'),
              onPressed: (){
                navigateToOtp(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future navigateToOtp(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PassPage()));
  }

}