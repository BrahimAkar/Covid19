import 'package:flutter/material.dart';

class MedicalFile extends StatefulWidget {
  @override
  _MedicalFileState createState() => _MedicalFileState();
}

class _MedicalFileState extends State<MedicalFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الملف الطبي',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
