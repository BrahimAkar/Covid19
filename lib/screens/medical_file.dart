import '../widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentMedical extends StatefulWidget {
  @override
  _DocumentMedicalState createState() => _DocumentMedicalState();
}

class _DocumentMedicalState extends State<DocumentMedical> {
//linked to the first textfield to return the value as a controller.text
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller3 = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    _controller1.dispose();
    _controller3.dispose();
    super.dispose();
  }

//for dropdown menu at the bottom
  Fordropdown selecteditem;
  List<Fordropdown> users = <Fordropdown>[
    const Fordropdown('A+ فصيلة الدم'),
    const Fordropdown('A- فصيلة الدم'),
    const Fordropdown("B+ فصيلة الدم"),
    const Fordropdown("B- فصيلة الدم"),
    const Fordropdown('AB+ فصيلة الدم'),
    const Fordropdown('AB- فصيلة الدم'),
    const Fordropdown('O+ فصيلة الدم'),
    const Fordropdown('O- فصيلة الدم')
  ];

//input design
  InputDecoration inputdecorationnormal2 =
      Inputs().inputdecorationnormal(' مثال 647369');
  InputDecoration inputdecorationnormal =
      Inputs().inputdecorationnormal('ماهو؟');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Stack(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0XFF243953),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Inputs().text('الملف الطبي', 30),
            Divider(),
            Table(children: [
              TableRow(
                children: [
                  Container(
                      width: 100.0,
                      height: 45.0,
                      child: Inputs().inputwidget(
                          _controller, inputdecorationnormal2, 20)),
                ],
              ),
              TableRow(
                children: [
                  Divider(),
                ],
              ),
              TableRow(children: [
                Inputs().text(' هل تعاني من مرض مزمن؟', 20),
              ]),
              TableRow(children: [
                TableCell(
                    child: Table(children: [
                  TableRow(children: [
                    Inputs().text(' لا', 18),
                    buildedswitch('no1'),
                    Inputs().text(' نعم', 18),
                    buildedswitch('yes1'),
                  ]),
                ]))
              ]),
              TableRow(children: [
                Container(
                    width: 100.0,
                    height: 45.0,
                    child: Inputs()
                        .inputwidget(_controller1, inputdecorationnormal, 18))
              ]),
              TableRow(
                children: [
                  Divider(),
                ],
              ),
              TableRow(children: [Inputs().text(' هل تعاني من حساسية؟', 20)]),
              TableRow(children: [
                TableCell(
                    child: Table(children: [
                  TableRow(children: [
                    Inputs().text(' لا', 18),
                    buildedswitch('no2'),
                    Inputs().text(' نعم', 18),
                    buildedswitch('yes2')
                  ]),
                ]))
              ]),
              TableRow(children: [
                Container(
                    width: 100.0,
                    height: 45.0,
                    child: Inputs()
                        .inputwidget(_controller3, inputdecorationnormal, 18)),
              ]),
              TableRow(
                children: [
                  Divider(),
                ],
              ),
              TableRow(
                  children: [Inputs().text(' ماهي فصيلة الدم الخاصة بك؟', 20)]),
              TableRow(children: [
                DropdownButton<Fordropdown>(
                  isExpanded: true,
                  hint: new Inputs().text(' اختر فصيلة الدم الخاصة بك', 20),
                  value: selecteditem,
                  focusColor: Colors.white,
                  onChanged: (Fordropdown f) {
                    setState(() {
                      selecteditem = f;
                    });
                  },
                  items: users.map((Fordropdown txt) {
                    return new DropdownMenuItem<Fordropdown>(
                      value: txt,
                      child: new Row(
                        children: <Widget>[
                          Text(txt.name, style: TextStyle(color: Colors.red)),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              ]),
              TableRow(
                children: [
                  Divider(),
                ],
              ),
            ]),
            Center(
              child: Container(
                  child: RaisedButton.icon(
                      color: Colors.lightBlue,
                      onPressed: () => Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('تم الحفظ بنجاح!'))),
                      icon: Icon(Icons.check_circle_outline,
                          color: Colors.white60),
                      label: Text('مصادقة'))),
            )
          ]),
        ),
      ]),
    )));
  }

  FutureBuilder buildedswitch(key) {
    return FutureBuilder(
        future: getShared(key),
        initialData: false,
        builder: (context, snapshot) {
          return Switch(
            value: snapshot.data,
            onChanged: (value) {
              putShared(key, value);
              setState(() {});
            },
            activeTrackColor: Colors.blueAccent,
            activeColor: Colors.blue,
          );
        });
  }

  Future getShared(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool val = prefs.getBool(key) == null ? false : (prefs.getBool(key));
    return val;
  }

  void putShared(String key, bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (key == "yes1" && val == true) {
      prefs.setBool("no1", false);
    }
    if (key == "no1" && val == true) {
      prefs.setBool("yes1", false);
    }

    if (key == "yes2" && val == true) {
      prefs.setBool("no2", false);
    }
    if (key == "no2" && val == true) {
      prefs.setBool("yes2", false);
    }
    prefs.setBool(key, val);
  }
}

//class for dropdown items
class Fordropdown {
  const Fordropdown(this.name);

  final String name;
}
