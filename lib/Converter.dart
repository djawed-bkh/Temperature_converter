import 'package:flutter/material.dart';

class converter extends StatelessWidget {
  const converter({Key? key}) : super(key: key);

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
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: " Texting",
                    hintText: "write the temperature",
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text(
                    "Convert it",
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.grey,
                  onPressed: () {
                    print("this was pressed");
                  },
                ),
              ),
              Container(
                padding:  EdgeInsets.all(70.0),
                child: IconButton(    icon: Icon(Icons.downloading),
                  color: Colors.grey,
                  highlightColor: Colors.red,
                  hoverColor: Colors.green,
                  focusColor: Colors.purple,
                  splashColor: Colors.yellow,
                  iconSize: 48,
                  onPressed: () { print("this was pressed"); },  ),
              )
            ],
          )
        ],
      ),
    );

    return (Scaffold(
      appBar: AppBar(
        title: Text("Djawed converter"),
        centerTitle: true,
      ),
      body: firstgroup,
    ));
  }
}
