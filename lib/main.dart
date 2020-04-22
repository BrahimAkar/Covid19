import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:imback/screens/Corona_explain.dart';
import 'package:imback/screens/addNewMedicalFile.dart';
import 'package:imback/screens/all_Images.dart';

import 'package:imback/screens/solidarite.dart';
import 'package:imback/screens/sos.dart';
import 'package:imback/screens/tadabir.dart';
import 'package:imback/screens/test_map.dart';
import 'package:imback/widgets/text.dart';
import 'package:imback/widgets/iconbutton.dart';
import 'package:rxdart/rxdart.dart';
import 'screens/home_screen.dart';
import 'screens/MapLive.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}

String $payload = "";

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

NotificationAppLaunchDetails notificationAppLaunchDetails;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
  // of the `IOSFlutterLocalNotificationsPlugin` class
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject.add(ReceivedNotification(
            id: id, title: title, body: body, payload: payload));
      });
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    selectNotificationSubject.add(payload);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19',
      theme: ThemeData(
        fontFamily: 'Questv',
        primarySwatch: Colors.red,
        accentColor: Color(0XFFFEF9B),
      ),
      initialRoute: '/',
      home: HomeScreen(),
      routes: {
        'secondscreen': (context) => SecondScreen($payload),
        '/maplive': (context) => MapLive(),
        '/coronaexp': (context) => CoronaExplain(),
        '/sos': (context) => Sos(),
        '/testmap': (context) => TestMap(),
        '/tadabir': (context) => Tadabir(),
        '/notification': (context) => Notificationsettings(),
        '/solidarite': (context) => Solidarite(),
        '/allimages': (context) => AllImages(),
        '/addnewmedicalfile': (context) => AddNewMedicalFile()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: IconButtons(
                text: 'clickme',
                method: () => print('hello'),
                snapcolor: Colors.redAccent,
                textcolor: Colors.black,
                backcolor: Colors.blue,
                icon: Icon(Icons.not_interested))));
  }
}

class Notificationsettings extends StatefulWidget {
  @override
  _NotificationsettingsState createState() => _NotificationsettingsState();
}

class _NotificationsettingsState extends State<Notificationsettings> {
  final MethodChannel platform =
      MethodChannel('crossingthestreams.io/resourceResolver');

  @override
  void initState() {
    super.initState();
    _requestIOSPermissions();
    _configureDidReceiveLocalNotificationSubjectclean();
    _configureSelectNotificationSubjectclean();
  }

  void _requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

//start onfiguring a notification
//configuration working with notifications to return the playload to second calss and handel user reaction to it
  void _configureDidReceiveLocalNotificationSubjectclean() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != "this is some title"
              ? Text(receivedNotification.title)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body)
              : null,
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SecondScreen($payload)));
              },
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubjectclean() {
    selectNotificationSubject.stream.listen((String payload) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => SecondScreen(payload)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                width: 400,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0XFF243953),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Texts().text('اعدادات التنبيه الوقائي', 30)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.notifications_active,
                              color: Colors.white, size: 44),
                        ],
                      ),
                      Divider(color: Colors.white, height: 60),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            buildedswitch("clean", "clean", 1),
                            SizedBox(
                              width: 250,
                              child: Texts()
                                  .text('التذكير  بالحفاظ على النظافة', 20),
                            )
                          ]),
                      Divider(),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            buildedswitch('getout', 'getout', 2),
                            SizedBox(
                              width: 250,
                              child: Texts().text(
                                  'التذكير بالتدابير الوقائية عند الخروج من البيت',
                                  20),
                            )
                          ]),

                      Divider(),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            buildedswitch("eat", "eat", 3),
                            SizedBox(
                              width: 250,
                              child: Texts().text('التذكير بنظام التغذية', 20),
                            )
                          ]),

                      // Divider(),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            buildedswitch("sport", "sport", 4),
                            SizedBox(
                              width: 250,
                              child:
                                  Texts().text('التذكير بالنظام الرياضي ', 20),
                            )
                          ]),

                      Divider(color: Colors.white, height: 30),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(children: <Widget>[
                              Row(
                                children: <Widget>[
                                  buildedswitch('desactiveall', "activeall", 0),
                                  Texts().text('تعطيل الكل', 20),
                                ],
                              )
                            ]),
                            Column(children: <Widget>[
                              Row(
                                children: <Widget>[
                                  buildedswitch('activeall', 'desactiveall', 0),
                                  Texts().text('تفعيل الكل', 20),
                                ],
                              )
                            ]),
                          ]),
                    ]))));
  }

//return a switcher that builded for specific jobs , with a method inside to execute what happen with switcher and change shared values and other switchers results some times
  FutureBuilder buildedswitch(key, channel, id) {
    return FutureBuilder(
        future: getShared(key),
        initialData: false,
        builder: (context, snapshot) {
          return Switch(
            value: snapshot.data,
            onChanged: (value) {
              putShared(key, value);
              setState(() {
                if (id > 0) {
                  var message, title;
                  if (value == true) {
                    if (channel == "clean") {
                      message =
                          "لاتنسى الحفاظ على النظافة والالتزام بغسل اليدين كل 15 دقيقة";
                      title = "من الضروري غسل اليدين";
                      _scheduleNotification2(
                          id, channel, channel, title, message);
                    }
                    if (channel == "eat") {
                      message = "لاتاكل قبل غسل يديك و التاكد من سلامة الطعام";
                      title = "انتبه فالفيروسات قد تتسلل مع الطعام";
                      _scheduleNotification2(
                          id, channel, channel, title, message);
                    }
                    if (channel == "getout") {
                      message =
                          "قبل الخروج من البيت تاكد من وضعك الكمامة واحترام مسافة الامان وعدم الاختلاط بالاخرين";
                      title =
                          "اتخد جميع التدابير اللازمة قبل خروجك من البيت وحافظ على سلامة مجتمعك";
                      _scheduleNotification2(
                          id, channel, channel, title, message);
                    }
                    if (channel == "sport") {
                      message =
                          "حافظ على ممارستك لنشاطك الرياضي من البيت ولاتعرض نفسك والاخرين للخطر";
                      title =
                          "الرياضة اخلاق طبقها اليوم وتمرن في البيت باي وسيلة واحمي غيرك";
                      _scheduleNotification2(
                          id, channel, channel, title, message);
                    }
                    //print('we start shedule in channel '+channel);
                  } else {
                    _cancelNotifications(id, channel);
                    //   print('we cancel notif in channle '+channel);
                  }
                }
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          );
        });
  }

//give a new values from swotchers to the stored keys when user change it with some other logic for the rest of switchers
  void putShared(String key, bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (key == "activeall" && val == true) {
      prefs.setBool('desactiveall', false);
      makeonrchange(true);
      _cancelallNotifications();
      print("active all");
    }
    if (key == "activeall" && val == false) {
      prefs.setBool('desactiveall', true);
    }

    if (key == "desactiveall" && val == true) {
      prefs.setBool('activeall', false);
      makeonrchange(false);
      _cancelallNotifications();
      print("desactive all");
    }
    if (key == "desactiveall" && val == false) {
      prefs.setBool('activeall', true);
    }

    if ((key != "desactiveall" || key != 'activeall')) {
      prefs.setBool('activeall', false);
      prefs.setBool('desactiveall', false);
    }

    prefs.setBool(key, val);
  }

// return the value of each key (string) in bool when user drag the switcher and store it
  Future getShared(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool val = prefs.getBool(key) == null ? false : (prefs.getBool(key));
    return val;
  }

//return one value to all single switchers
  void makeonrchange(anser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('clean', anser);
    prefs.setBool('eat', anser);
    prefs.setBool('sport', anser);
    prefs.setBool('getout', anser);
  }

//--------------------------
// cancel notification defined by id
  Future<void> _cancelNotifications(id, chanelname) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

//void to cancel all notification by id with one click
  Future<void> _cancelallNotifications() async {
    await flutterLocalNotificationsPlugin.cancel(1);
    await flutterLocalNotificationsPlugin.cancel(2);
    await flutterLocalNotificationsPlugin.cancel(3);
    await flutterLocalNotificationsPlugin.cancel(4);
  }

  //notification method with a hourly interval
  Future<void> _scheduleNotification2(
      id, channel, idchannel, title, message) async {
    print('got ' + channel);
    var groupKey = 'com.android.example.WORK_EMAIL';
    var groupChannelId = 'mygroupchannel';
    var groupChannelName = 'taw3iya';
    var groupChannelDescription = 'taw3iya project';

    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        groupChannelId, groupChannelName, groupChannelDescription,
        groupKey: groupKey,
        icon: '@mipmap/ic_launcher',
        importance: Importance.High,
        priority: Priority.High,
        ongoing: true,
        autoCancel: false,
        sound: RawResourceAndroidNotificationSound(channel),
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
        //styleInformation:bigPictureStyleInformation,
        vibrationPattern: vibrationPattern,
        enableLights: true,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000,
        ledOffMs: 500,
        timeoutAfter: 20000);
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: channel + ".wav");
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    if (channel == 'clean' || channel == "getout") {
      await flutterLocalNotificationsPlugin.periodicallyShow(
          id, title, message, RepeatInterval.Hourly, platformChannelSpecifics,
          payload: channel);
    }
    if (channel == "eat") {
      await flutterLocalNotificationsPlugin.showDailyAtTime(
          id, title, message, Time(13, 0, 0), platformChannelSpecifics,
          payload: channel);
      await flutterLocalNotificationsPlugin.showDailyAtTime(
          id, title, message, Time(20, 0, 0), platformChannelSpecifics,
          payload: channel);
    }
    if (channel == 'sport') {
      await flutterLocalNotificationsPlugin.showDailyAtTime(
          id, title, message, Time(10, 0, 0), platformChannelSpecifics,
          payload: channel);
      await flutterLocalNotificationsPlugin.showDailyAtTime(
          id, title, message, Time(18, 0, 0), platformChannelSpecifics,
          payload: channel);
    }
    setState(() {
      $payload = channel;
    });
  }
}

class SecondScreen extends StatefulWidget {
  SecondScreen(this.payload);

  final String payload;

  @override
  State<StatefulWidget> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  String _payload;
  int count = 0;
  var pics = [];
  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF243953),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/' + _payload + '.jpg',
              height: 630,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => navigation(" السابق"),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_left),
                          Text("Back"),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => navigation(" التالي"),
                      child: Row(
                        children: <Widget>[
                          Text('Next'),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  void navigation(name) {
    if (name == "back") {
      setState(() {
        count--;
        if (count < 0) {
          count = 3;
        }
      });
    }
    if (name == "next") {
      setState(() {
        count++;
        if (count > 3) {
          count = 0;
        }
      });
    }

    setState(() {
      if (count == 0) {
        _payload = "clean";
      }
      if (count == 1) {
        _payload = "eat";
      }
      if (count == 2) {
        _payload = "getout";
      }
      if (count == 3) {
        _payload = "sport";
      }
    });
  }
}
