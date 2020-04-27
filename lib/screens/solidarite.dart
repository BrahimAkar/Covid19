import 'package:flutter/material.dart';
import 'package:covid19/widgets/cardTadabir.dart';

class Solidarite extends StatelessWidget {
  List<Color> firstCard = [Color(0xffCF5AEF), Color(0xffFE3258)];
  List<Color> secondCard = [Color(0xff56AB2F), Color(0xffA8E063)];
  List<Color> thirdard = [Color(0xff0CDAE4), Color(0xff1A41FD)];
  List<Color> fourthCard = [Color(0xffFD3755), Color(0xff0099F7)];
  List<Color> fifthCard = [Color(0xffFD3755), Color(0xffFE965C)];
  List<Color> sixthCard = [Color(0xff273EFD), Color(0xff9930FE)];
  List<String> texts = [
    "تبرع للصنودق الخاص بإدارة جائحة كوفيد 19 عبر موقع الخزينة العامة للمملكة",
    "تبرع للصندوق الخاص بإدارة جائحة كوفيد 19 عبر رسالة قصيرة SMS",
    "تدابير لجنة اليقظة الاقتصادية ووزارة الاقتصاد والمالية وإصلاح الإدارة",
    "التعرف على التدابير الوقائية لمحاربة فيروس كوفيد 19",
    "الملف الطبي المرجعي",
    "المستجدات"
  ];
  List<String> pageLinks = [
    "https://www.tgr.gov.ma/wps/portal/donsenlignecoronavirus",
    "https://www.sante.gov.ma/Pages/corona.aspx",
    "https://www.finances.gov.ma/ar/%D9%85%D9%87%D9%86%D9%86%D8%A7/Pages/%D9%84%D8%AC%D9%86%D8%A9-%D8%A7%D9%84%D9%8A%D9%82%D8%B8%D8%A9-%D8%A7%D9%84%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF%D9%8A%D8%A9.aspx",
    "",
    "",
    "https://covidata.2m.ma/#/ar/news"
  ];
  List<double> _stops = [0, 0.5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        elevation: 1,
        title: Text(
          'التضامن',
          style: TextStyle(fontSize: 18, color: Theme.of(context).accentColor),
        ),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              CardTadabir(firstCard, _stops, texts[0], pageLinks[0], null),
              SizedBox(
                height: 9,
              ),
              CardTadabir(fourthCard, _stops, texts[1], 'sms:1919', null),
              SizedBox(
                height: 9,
              ),
              Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Image.asset('assets/images/wh.jpg')),
            ],
          ),
        ),
      ),
    );
  }
}
