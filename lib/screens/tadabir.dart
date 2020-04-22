import 'package:flutter/material.dart';
import 'package:imback/widgets/cardTadabir.dart';

class Tadabir extends StatelessWidget {
  List<Color> firstCard = [Color(0xffCF5AEF), Color(0xffFE3258)];
  List<Color> secondCard = [Color(0xff56AB2F), Color(0xffA8E063)];
  List<Color> thirdard = [Color(0xff0CDAE4), Color(0xff1A41FD)];
  List<Color> fourthCard = [Color(0xffFD3755), Color(0xff0099F7)];
  List<Color> fifthCard = [Color(0xffFD3755), Color(0xffFE965C)];
  List<Color> sixthCard = [Color(0xff273EFD), Color(0xff9930FE)];

  List<String> texts = [
    "تدابير وقائية ونصائح ضد فيروس كوفيد 19، المصدر منظمة الصحة العالمية",
    "تدابير وقائية ضد فيروس كوفيد 19، المصدر وزارة الصحة",
    "تدابير لجنة اليقظة الاقتصادية ووزارة الاقتصاد والمالية وإصلاح الإدارة",
    "التعرف على التدابير الوقائية لمحاربة فيروس كوفيد 19",
    "الملف الطبي المرجعي",
    "المستجدات"
  ];
  List<String> pageLinks = [
    "http://www.emro.who.int/ar/health-topics/corona-virus/information-resources.html",
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
        backgroundColor: Color(0xFF243953),
        elevation: 0.0,
        title: Center(child: Text('التدابير الوقائية         ')),
      ),
      body: Container(
        color: Color(0xFF243953),
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
              CardTadabir(secondCard, _stops, texts[1], pageLinks[1], null),
              SizedBox(
                height: 9,
              ),
              CardTadabir(thirdard, _stops, texts[2], pageLinks[2], ""),
              SizedBox(
                height: 9,
              ),
              CardTadabir(fourthCard, _stops, texts[3], null, "/allimages"),
              SizedBox(
                height: 9,
              ),
              CardTadabir(
                  fifthCard, _stops, texts[4], null, "/addnewmedicalfile"),
              SizedBox(
                height: 9,
              ),
              CardTadabir(sixthCard, _stops, texts[5], null, "/testmap"),
              SizedBox(
                height: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
