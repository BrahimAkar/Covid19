import 'package:flutter/material.dart';

class CoronaExplain extends StatefulWidget {
  @override
  _CoronaExplainState createState() => _CoronaExplainState();
}

class _CoronaExplainState extends State<CoronaExplain> {
  Future<bool> circ() async {
    while (true) {
      // await Future.delayed(Duration(seconds: 1));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF243953),
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        title: Center(child: Text('تعرف اكثر على فيروس كورونا')),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Icon(Icons.refresh),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF243953),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(top: 35),
                        width: double.infinity,
                        child: Image.asset('assets/images/virus.png'),
                      ),
                      flex: 2,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 35),
                        child: Text(
                          'فيروس كورونا\n  المستجد',
                          style: TextStyle(fontSize: 45, color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      flex: 5,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'أعراض الإصابة',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF1B2C41),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                height: 180,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/fiver.png', scale: 2),
                            Text(
                              'الحمى',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/kha.png', scale: 2),
                            Text(
                              'السعال',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/breathing.png',
                              scale: 2,
                            ),
                            Text(
                              'صعوبة التنفس',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'نصائح للوقاية',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF1B2C41),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                height: 195,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/mask.png', scale: 2),
                            Text(
                              'إرتدي كمامة',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/contact.png', scale: 2),
                            Text(
                              'تجنب التواصل\nمع المصابين',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/hand.png',
                              scale: 2,
                            ),
                            Text(
                              'إغسل يديك\nبالماء والصابون',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //

              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'كيف ينتشر مرض كوفيد-19؟',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.all(22),
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF1B2C41),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Wrap(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'يمكن أن يصاب الأشخاص بعدوى مرض كوفيد-19 عن طريق الأشخاص الآخرين المصابين بالفيروس. ويمكن للمرض أن ينتقل من شخص إلى شخص عن طريق القُطيرات الصغيرة التي تتناثر من الأنف أو الفم عندما يسعل الشخص المصاب بمرض كوفيد-19 أو يعطس. وتتساقط هذه القُطيرات على الأشياء والأسطح المحيطة بالشخص. ويمكن حينها أن يصاب الأشخاص الآخرون بمرض كوفيد-19 عند ملامستهم لهذه الأشياء أو الأسطح ثم لمس عينيهم أو أنفهم أو فمهم. كما يمكن أن يصاب الأشخاص بمرض كوفيد-19 إذا تنفسوا القُطيرات التي تخرج من الشخص المصاب بالمرض مع سعاله أو زفيره. ولذا فمن الأهمية بمكان الابتعاد عن الشخص المريض بمسافة تزيد على متر واحد (3 أقدام).',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.right),
                      ],
                    ),
                  ],
                ),
              ),

              //

              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'هل يمكن أن ينتقل عبر الهواء؟',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.all(22),
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF1B2C41),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Wrap(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'تشير الدراسات التي أُجريت حتى يومنا هذا إلى أن الفيروس الذي يسبب مرض كوفيد-19 ينتقل في المقام الأول عن طريق ملامسة القُطيرات التنفسية لا عن طريق الهواء. انظر الإجابة عن السؤال السابق: "كيف ينتشر مرض كوفيد-19؟"',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.right),
                      ],
                    ),
                  ],
                ),
              ),
              //

              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'هل يمكن أن يصاب المرء بالمرض  \n عن طريق شخص عديم الأعراض؟',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.all(22),
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF1B2C41),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Wrap(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'تتمثل الطريقة الرئيسية لانتقال المرض في القُطيرات التنفسية التي يفرزها الشخص عند السعال. وتتضاءل احتمالات الإصابة بمرض كوفيد-19 عن طريق شخص عديم الأعراض بالمرة. ولكن العديد من الأشخاص المصابين بالمرض لا يعانون إلا من أعراض طفيفة. وينطبق ذلك بصفة خاصة على المراحل المبكرة للمرض. ولذا فمن الممكن الإصابة بمرض كوفيد-19 عن طريق شخص يعاني مثلاً من سعال خفيف ولا يشعر بالمرض',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.right),
                      ],
                    ),
                  ],
                ),
              ),

//

              Padding(
                padding: const EdgeInsets.only(right: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'ما هي احتمالات إصابتي',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.all(22),
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF1B2C41),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Wrap(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'يتوقف الخطر على المكان الذي تتواجد فيه، وبشكل أكثر تحديدًا، ما إذا كانت عدوى كوفيد-19 تتفشي في هذا المكان.وبالنسبة لمعظم الناس في معظم الأماكن، لا يزال خطر الإصابة بعدوى مرض كوفيد-19 ضعيفا. ومع ذلك، هناك بعض الأماكن في العالم (مدن أو مناطق) التي ينتشر فيها المرض حاليا. ويكون خطر الإصابة بعدوى مرض كوفيد-19 أعلى لدى الأشخاص الذين يعيشون في هذه المناطق أو يزورونها. وتتخذ الحكومات والسلطات الصحية حاليا إجراءات صارمة كلما كُشف عن حالة إصابة جديدة بمرض كوفيد-19. لذا، تأكّد من التزامك بأي قيود تُفرض محليا على السفر أو التنقل أو التجمعات الكبيرة. فالتعاون مع الجهات المعنية بمكافحة الأمراض من شأنه أن يحدّ من خطر الإصابة بمرض كوفيد-19 وانتشاره.',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.right),
                      ],
                    ),
                  ],
                ),
              ),

              FutureBuilder(
                future: circ(),
                builder: (context, snapshot) {
                  if (snapshot.data == false) {
                    return Column(
                      children: <Widget>[
                        CircularProgressIndicator(
                          backgroundColor: Colors.yellow,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          'سيتم تحديث محتوى الصفحة في وقت لاحق..',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
