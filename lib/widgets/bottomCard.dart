import 'package:flutter/material.dart';

class ButtomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        color: Color(0xffFF4A4A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListTile(
            leading: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/maplive'),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_back,
                  size: 38,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              'آخر الإحصائيات بالمغرب',
              style: TextStyle(color: Colors.white, fontSize: 21,fontFamily: 'Questv'),
              textAlign: TextAlign.right,
            ),
            subtitle: Text(
              'محدثة بشكل مستمر',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
              
            ),
            isThreeLine: true,
          ),
        ),
      ),
    );
  }
}
