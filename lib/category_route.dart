import 'package:flutter/material.dart';
import 'category.dart';

class categoryRoute extends StatelessWidget {
  const categoryRoute({Key? key}) : super(key: key);

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {

    final categorieList = <category>[];

    for (var i = 0; i < _categoryNames.length; i++) {
      categorieList.add(category(
          name: _categoryNames[i],
          color: _baseColors[i]  as ColorSwatch<dynamic>,
          iconLocation: Icons.favorite));


    }

    final listView = Container(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: categorieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child:categorieList[index],
          );
        },
      ),
    );

    // TODO: Create an App Bar
    final appBar = AppBar(
      backgroundColor: Colors.green,
      elevation: 0.0,
      title: Text(
        "Unit converter",
        style: TextStyle(fontSize: 30.0),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
