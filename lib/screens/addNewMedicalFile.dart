import 'package:covid19/localization/localization_constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:covid19/models/databaseHelper.dart';
import 'package:covid19/models/fileMedical.dart';
import 'package:covid19/models/user.dart';
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
              getTranslated(context, "medicalFileAppBarTitle"),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 80),
                        Text(
                          getTranslated(context, "medicalFileNum"),
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        Theme(
                          data: new ThemeData(
                            primaryColor: Colors.redAccent,
                            primaryColorDark: Colors.red,
                          ),
                          child: TextFormField(
                            style: TextStyle(color: getColor()),
                            textAlignVertical: TextAlignVertical.center,
                            validator: (value) {
                              if (value.isEmpty) {
                                return getTranslated(
                                    context, "medicalFileNumError");
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
                              hintText:
                                  getTranslated(context, "medicalFileNumHint"),
                              hintStyle: TextStyle(
                                color: getColor(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          getTranslated(context, "medicalFilediseaseTitle"),
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              getTranslated(context, "medicalFilediseaseYES"),
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
                              getTranslated(context, "medicalFilediseaseNO"),
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
                          getTranslated(context, "medicalFilesensitivityTitle"),
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              getTranslated(
                                  context, "medicalFilesensitivityYES"),
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
                              getTranslated(
                                  context, "medicalFilesensitivityNO"),
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
                          getTranslated(context, "medicalFileBloodTypeTitle"),
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        Theme(
                          data: new ThemeData(
                            primaryColor: Colors.redAccent,
                            primaryColorDark: Colors.red,
                          ),
                          child: TextFormField(
                            style: TextStyle(color: textsColor),
                            validator: (value) {
                              if (value.isEmpty) {
                                return getTranslated(
                                    context, "medicalFileBloodTypError");
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
                              hintText: getTranslated(
                                  context, "medicalFileBloodTypeHint"),
                              hintStyle: TextStyle(
                                color: getColor(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // الحساسية
                        Text(
                          getTranslated(context, "medicalFileWeightTitle"),
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        Theme(
                          data: new ThemeData(
                            primaryColor: Colors.redAccent,
                            primaryColorDark: Colors.red,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return getTranslated(
                                    context, "medicalFileWeightError");
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              weight = value;
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
                              hintText: getTranslated(
                                  context, "medicalFileWeightHint"),
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
                        SizedBox(height: 15),
                        // الحساسية
                        Text(
                          getTranslated(context, "medicalFileAgeTitle"),
                         
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                         
                          validator: (value) {
                            if (value.isEmpty) {
                              return getTranslated(
                                  context, "medicalFileAgeError");
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
                            hintText:
                                getTranslated(context, "medicalFileAgeHint"),
                            hintStyle: TextStyle(
                              color: getColor(),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          minLines: 1,
                          style: TextStyle(color: getColor()),
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        SizedBox(height: 15),
                        // الحساسية
                        Text(
                          getTranslated(context, "medicalFileHeightHint"),
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textsColor, fontSize: 19),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                        
                          validator: (value) {
                            if (value.isEmpty) {
                              return getTranslated(
                                  context, "medicalFileHeightError");
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
                            hintText: getTranslated(
                                context, "medicalFileHeightHint"),
                            hintStyle: TextStyle(
                              color: getColor(),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          minLines: 1,
                          style: TextStyle(color: getColor()),
                         
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
                                    getTranslated(context, "medicalFileCancel"),
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
                                              getTranslated(
                                                  context, "buttonSuccessSave"),
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
                                    getTranslated(
                                        context, "medicalFileButtonSave"),
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
