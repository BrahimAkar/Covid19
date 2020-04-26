import 'package:flutter/material.dart';
import 'dart:async';
import 'package:imback/models/databaseHelper.dart';
import 'package:imback/models/fileMedical.dart';
import 'package:imback/models/user.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../theme.dart';

class AddNewMedicalFile extends StatefulWidget {
  @override
  _AddNewMedicalFileState createState() => _AddNewMedicalFileState();
}

class _AddNewMedicalFileState extends State<AddNewMedicalFile> {
  static var _propr = ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"];
  String fileNumber;
  int disease = 0;
  int sensitivity = 0;
  String bloodType;
  String weight;
  String age;
  String height;

  final _formKey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    Color textsColor = Theme.of(context).accentColor;
    return Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
      getColor() {
        if (notifier.isDark == true) {
          return Colors.white24;
        } else {
          return Colors.black26;
        }
      }

      return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).accentColor),
            centerTitle: true,
            elevation: 1,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              'الملف الطبي',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Questv'),
            ),
          ),
          body: Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(right: 25, left: 25),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 80),
                        Text(
                          'رقم الملف الطبي',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        Theme(
                          data: new ThemeData(
                            primaryColor: Colors.redAccent,
                            primaryColorDark: Colors.red,
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              style: TextStyle(color: getColor()),
                              textAlignVertical: TextAlignVertical.center,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'من فضلك، ادخل رقم الملف الطبي';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                fileNumber = value;
                              },

                              // textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.check_circle,
                                  size: 29,
                                  color: Colors.blue,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff1C95FF), width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff1C95FF), width: 1.0),
                                ),
                                hintText: 'مثال 808556',
                                hintStyle: TextStyle(
                                  color: getColor(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'هل تعاني من مرض مزمن؟',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'نعم',
                              style: TextStyle(color: textsColor, fontSize: 18),
                            ),
                            Radio(
                              autofocus: true,
                              activeColor: Colors.blue,
                              value: 1,
                              groupValue: disease,
                              onChanged: (t) {
                                setState(() {
                                  disease = t;
                                });
                              },
                            ),
                            Text(
                              'لا',
                              style: TextStyle(color: textsColor, fontSize: 18),
                            ),
                            Radio(
                              activeColor: Colors.blue,
                              value: 0,
                              groupValue: disease,
                              onChanged: (t) {
                                setState(() {
                                  disease = t;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        // الحساسية
                        Text(
                          'هل تعاني من حساسية؟',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'نعم',
                              style: TextStyle(color: textsColor, fontSize: 18),
                            ),
                            Radio(
                              autofocus: true,
                              activeColor: Colors.blue,
                              value: 1,
                              groupValue: sensitivity,
                              onChanged: (t) {
                                setState(() {
                                  sensitivity = t;
                                });
                              },
                            ),
                            Text(
                              'لا',
                              style: TextStyle(color: textsColor, fontSize: 18),
                            ),
                            Radio(
                              activeColor: Colors.blue,
                              value: 0,
                              groupValue: sensitivity,
                              onChanged: (t) {
                                setState(() {
                                  sensitivity = t;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        // الحساسية
                        Text(
                          'ماهي فصيلة الدم الخاصة بك؟',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        Theme(
                          data: new ThemeData(
                            primaryColor: Colors.redAccent,
                            primaryColorDark: Colors.red,
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              style: TextStyle(color: textsColor),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'من فضلك أدخل فصيلة دمك';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                bloodType = value;
                              },
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  fontFamily: "Questv",
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff1C95FF), width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff1C95FF), width: 1.0),
                                ),
                                hintText: 'مثال : O+',
                                hintStyle: TextStyle(
                                  color: getColor(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // الحساسية
                        Text(
                          'كم وزنك؟',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        Theme(
                          data: new ThemeData(
                            primaryColor: Colors.redAccent,
                            primaryColorDark: Colors.red,
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'من فضلك، ادخل الوزن';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                weight = value;
                              },
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  fontFamily: "Questv",
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff1C95FF), width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff1C95FF), width: 1.0),
                                ),
                                hintText: ' مثال: 85 كيلوغرام',
                                hintStyle: TextStyle(
                                  color: getColor(),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              minLines: 1,
                              style: TextStyle(color: getColor()),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // الحساسية
                        Text(
                          'كم عمرك؟',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.right,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'من فضلك، ادخل العمر';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              age = value;
                            },
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontFamily: "Questv",
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff1C95FF), width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff1C95FF), width: 1.0),
                              ),
                              hintText: ' مثال: 25 سنة',
                              hintStyle: TextStyle(
                                color: getColor(),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            minLines: 1,
                            style: TextStyle(color: getColor()),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        SizedBox(height: 15),
                        // الحساسية
                        Text(
                          'كم طولك؟',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.right,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'من فضلك، ادخل الطول';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              height = value;
                            },
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontFamily: "Questv",
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff1C95FF), width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff1C95FF), width: 1.0),
                              ),
                              hintText: ' مثال: 125 سنتيميتر ',
                              hintStyle: TextStyle(
                                color: getColor(),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            minLines: 1,
                            style: TextStyle(color: getColor()),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: FlatButton(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    'إلغاء',
                                    style: TextStyle(
                                        color: textsColor, fontSize: 18),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.black26,
                                ),
                              ),
                              SizedBox(
                                width: 19,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      _insert(fileNumber, disease, sensitivity,
                                          bloodType, weight, age, height);
                                      _query();
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        duration: Duration(seconds: 15),
                                        backgroundColor: Colors.blueGrey,
                                        content: Row(
                                          children: <Widget>[
                                            Text(
                                              'تم تخزين الملف الطبي على ذاكرة هاتفك بنجاح.',
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: "Questv"),
                                            ),
                                            SizedBox(width: 8),
                                            Icon(
                                              Icons.check_circle_outline,
                                              color: textsColor,
                                            ),
                                          ],
                                        ),
                                      ));
                                    }
                                  },
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    'حفظ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 75),
                      ],
                    ),
                  ),
                ),
              );
            },
          ));
    });
  }

  void _insert(String fileNumber, int disease, int sensitivity,
      String bloodType, String weight, String age, String height) async {
    // row to insert
    Map<String, dynamic> row = {
      //       $columnId INTEGER PRIMARY KEY,
      // $columnfileNumber TEXT NOT NULL,
      // $columndisease INTEGER NOT NULL,
      // $columnsensitivity INTEGER NOT NULL,
      // $columnbloodType TEXT NOT NULL,
      // $columnweight TEXT NOT NULL,
      // $columnage TEXT NOT NULL
      DatabaseHelper.columnfileNumber: fileNumber,
      DatabaseHelper.columndisease: disease,
      DatabaseHelper.columnsensitivity: sensitivity,
      DatabaseHelper.columnbloodType: bloodType,
      DatabaseHelper.columnweight: weight,
      DatabaseHelper.columnage: age,
      DatabaseHelper.columnheight: height
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }
}
