import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:udacity_learning/Converter.dart';
import 'category.dart';
import 'category_route.dart';

const String _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.blue;

void main() {
  runApp(const UnitConvertApp());
}

class UnitConvertApp extends StatelessWidget {
  const UnitConvertApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Unit converter",
      home: converter(),
    ));
  }
}
