import 'package:flutter/material.dart';

class NewMedicalFile extends StatefulWidget {
  @override
  _NewMedicalFileState createState() => _NewMedicalFileState();
}

class _NewMedicalFileState extends State<NewMedicalFile> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إنشاء ملف طبي'),
      ),
      body: Column(
        children: <Widget>[
          getNotelist(),
        ],
      ),
    );
  }

  ListView getNotelist() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            onTap: () => print('listTile clicked!'),
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.file_download),
            ),
            title: Text('Title text'),
            subtitle: Text('subtitle text'),
            trailing: Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
