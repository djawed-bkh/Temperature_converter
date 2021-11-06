import 'package:flutter/material.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;

  const category(
      {Key? key,
      required this.name,
      required this.color,
      required this.iconLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Material(
      color: Colors.blue,
      child: SizedBox(
        height: _rowHeight,
        child: InkWell(
          highlightColor: Colors.lightBlueAccent,
          splashColor: Colors.lightBlueAccent,
          onTap: () {
            print("i was taped");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.favorite,
                    size: 50.0,
                    color: Colors.red,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
