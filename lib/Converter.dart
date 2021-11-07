import 'package:flutter/material.dart';

class converter extends StatelessWidget {

  const converter({Key? key}) : super(key: key);
  static int selectedIndex = 0;
  static String? _value;

  @override
  Widget build(BuildContext context) {

    final firstgroup = Container(
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: Wrap(
        children: <Widget>[
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 100),
                child: IconButton(
                  icon: Icon(Icons.facebook),
                iconSize: 150.0,
                color: Colors.blue,
                onPressed: () {}
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:50),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: " Phone number, username or email",
                    hintText: "Type your Phone number, username or email",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20,bottom: 0),
                child:SizedBox(
                width: double.infinity,
                child:TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Type your password",
                  ),
                ),
                )
              ),
              Container(
                  padding: EdgeInsets.only(top: 0,bottom:100, right:0,left: 220 ),
                  child:SizedBox(
                    width: double.infinity,
                    child:TextButton(
                      child: Text("Mot de passe oublié ?"),
                      onPressed: () {  },

                    ),
                  )
              ),

              Container(
                child:SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      "Log in",
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.grey,
                    onPressed: () {
                      print("Log in");
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );

    return (Scaffold(

      body: firstgroup,
    ));
  }

}



