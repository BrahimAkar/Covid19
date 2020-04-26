import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  final List<String> texts = [
    "يمكنك تشغيل المنبه الذكي في المنزل لتذكيرك بضرورة غسل اليدين بالصابون ...",
    "يمكنك تشغيل المنبه الذكي عند الخروج من المنزل لتذكيرك بضرورة إحترام التباعد مع الاخرين وعدم ملامسة الاسطح... ",
    " يمكن للمنبه الذكي ايضا تذكيرك بممارسة الرياضة لتقوية المناعة داخل الجسم",
    "بتشغيل خاصية التغذية يمكن للمنبه الذكي تذكيرك بضرورة تناول أغذية متنوعة لتقوية المناعة"
  ];
  List<Color> firstCard = [Color(0xffCF5AEF), Color(0xffFE3258)];
  List<Color> secondCard = [Color(0xff56AB2F), Color(0xffA8E063)];
  List<Color> thirdard = [Color(0xff0CDAE4), Color(0xff1A41FD)];
  List<Color> fourthCard = [Color(0xffFD3755), Color(0xff0099F7)];
  List<Color> fifthCard = [Color(0xffFD3755), Color(0xffFE965C)];
  List<Color> sixthCard = [Color(0xff273EFD), Color(0xff9930FE)];

  @override
  Widget build(BuildContext context) {
    Widget diver = Divider(
      height: 8,
    );
    Widget diver2 = Divider(
      height: 40,
    );
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
        ),
        backgroundColor: Color(0XFF243953),
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(2)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 28,
                  ),
                  Text('توصيات المنبه الذكي',
                      style: TextStyle(
                          fontSize: 30, color: Theme.of(context).accentColor),
                      textAlign: TextAlign.center),
                  Icon(Icons.hearing,
                      size: 50, color: Theme.of(context).accentColor),
                  diver2,
                  CardGuide(texts[0], Colors.green, firstCard),
                  diver,
                  CardGuide(texts[1], Colors.yellow, secondCard),
                  diver,
                  CardGuide(texts[2], Colors.cyan, thirdard),
                  diver,
                  CardGuide(texts[3], Colors.teal, fourthCard),
                  diver,
                ],
              ),
            )));
  }
}

class CardGuide extends StatelessWidget {
  final String cardText;

  final Color containerColor;
  List<Color> colors = [];
  CardGuide(this.cardText, this.containerColor, this.colors);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 11, left: 11),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: containerColor,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: colors,
            //     //  stops: stops,
          )),
      child: SizedBox(
          width: 400,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    width: 300,
                    child: Text(
                      cardText,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                    //  ,Icon(Icons.info_outline),
                    ),
                Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ])),
    );
  }
}
