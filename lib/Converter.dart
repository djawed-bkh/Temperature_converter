import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://free.currconv.com/api/v7/convert?q=USD_DZD&compact=ultra&apiKey=f2d1b20d4f369c94970a

class converter extends StatefulWidget {
  @override
  State<converter> createState() => _converterState();
}

class _converterState extends State<converter> {
  static const _Currenciesname = <String>[
    'AED',
    'ARS',
    'AUD',
    'DZD',
    'CRC',
    'CNY',
    'EUR',
    'RUB',
    'ZAR',
    'SGD',
    'QAR',
    'NZD',
  ];
  String fristDropdown = _Currenciesname[0];
  String SecondDropdown = _Currenciesname[1];
  String firstTextdisplay = "";
  String secondTextdisplay = "";
  double cuurencie = 0.0;
  TextEditingController firstTextController = new TextEditingController();
  TextEditingController secondTextController = new TextEditingController();

  Future<double> currencie(String firstCurrency, String SecondCurrency) async {
    var response = await http.get(Uri.parse(
        "https://free.currconv.com/api/v7/convert?q=${firstCurrency}_${SecondCurrency}&compact=ultra&apiKey=f2d1b20d4f369c94970a"));

    var result = response.body.split(":");
    result = result[1].split("}");
    cuurencie = double.parse(result[0]);
    print("this is for test:  $cuurencie");
    return cuurencie;
  }

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
                padding: EdgeInsets.only(top: 50),
                child: TextField(
                  controller: firstTextController,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: " Type the value to convert",
                    hintText: "the value must be a double",
                  ),
                  onChanged: (text) {
                    if (text.isEmpty) {
                      setState(() {
                        secondTextController.text = " 0.0";
                      });
                    } else {
                      setState(() {
                        firstTextdisplay = firstTextController.text;
                        // cacul du change
                        currencie(fristDropdown, SecondDropdown);
                        //print("this is the result ${cuurencie * double.parse(firstTextController.text)}");
                        double result =
                            cuurencie * double.parse(firstTextController.text);
                        secondTextController.text = "$result";
                      });
                    }
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, bottom: 0),
                  child: SizedBox(
                      width: double.infinity,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        isExpanded: true,
                        items: _Currenciesname.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            fristDropdown = newvalue!;
                            // calcul du taux de change
                            currencie(fristDropdown, SecondDropdown);
                            //print("this is the result ${cuurencie * double.parse(firstTextController.text)}");
                            double result = cuurencie *
                                double.parse(firstTextController.text);
                            secondTextController.text = "$result";
                          });
                        },
                        hint: Text(fristDropdown),
                      ))),
            ],
          )
        ],
      ),
    );

    final reverseButton = Container(
      padding: EdgeInsets.only(top: 20, bottom: 0, right: 15, left: 15),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          child: Text(
            "Retour",
            style: TextStyle(fontSize: 20),
          ),
          color: Colors.blue,
          textColor: Colors.white,
          splashColor: Colors.grey,
          onPressed: () {},
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );

    final secondgroup = Container(
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: Wrap(
        children: <Widget>[
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                child: TextField(
                  controller: secondTextController,
                  readOnly: true,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: " Type the value to convert",
                    hintText: "the value must be a double",
                  ),
                  onChanged: (text) {
                    secondTextdisplay = secondTextController.text;

                    // calling the API
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, bottom: 0),
                  child: SizedBox(
                      width: double.infinity,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        isExpanded: true,
                        items: _Currenciesname.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            SecondDropdown = newvalue!;
                            print(SecondDropdown);
                            // calcul du taux de change
                            currencie(fristDropdown, SecondDropdown);
                            //print("this is the result ${cuurencie * double.parse(firstTextController.text)}");
                            double result =  cuurencie *
                                double.parse(firstTextController.text);
                            secondTextController.text = "$result";
                            print("update done");
                          });
                        },
                        hint: Text(SecondDropdown),
                      ))),
            ],
          )
        ],
      ),
    );

    return (Scaffold(
      body: Wrap(children: <Widget>[
        Column(children: [
          firstgroup,
          reverseButton,
          secondgroup,
        ]),
      ]),
    ));
  }
}
