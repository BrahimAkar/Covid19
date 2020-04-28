import 'dart:typed_data';

import 'package:covid19/langauge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:covid19/classes/changeTheme.dart';

import 'package:covid19/screens/Corona_explain.dart';
import 'package:covid19/screens/addNewMedicalFile.dart';
import 'package:covid19/screens/all_Images.dart';
import 'package:covid19/screens/animation.dart';
import 'package:covid19/screens/notification-guid.dart';

import 'package:covid19/screens/solidarite.dart';
import 'package:covid19/screens/sos.dart';
import 'package:covid19/screens/settings.dart';
import 'package:covid19/screens/tadabir.dart';
import 'package:covid19/screens/test_map.dart';
import 'package:covid19/widgets/text.dart';
import 'package:covid19/widgets/iconbutton.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'localization/demo_localization.dart';
import 'localization/localization_constants.dart';
import 'theme.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocale(Locale locale) {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _locale = locale;
      });
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      Container(child: CircularProgressIndicator());
    } else {
      SystemChrome.setEnabledSystemUIOverlays([]);
      return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
            return MaterialApp(
              supportedLocales: [
                Locale('ar', 'MA'), // Arabic
                Locale('fr', 'FR'), // French
              ],
              locale: _locale,
              localizationsDelegates: [
                DemoLocalizations.delegate,
                // ... app-specific localization delegate[s] here
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (locale.languageCode == deviceLocale.languageCode &&
                      locale.countryCode == deviceLocale.countryCode) {
                    return deviceLocale;
                  }
                }
                return supportedLocales.first;
              },
              debugShowCheckedModeBanner: false,
              title: 'Covid19',
              theme: notifier.isDark ? darkMode : lightMode,
              initialRoute: '/homescreen',
              home: HomeScreen(),
              routes: {
                'secondscreen': (context) => SecondScreen($payload),
                '/homescreen': (context) => HomeScreen(),
                '/maplive': (context) => MapLive(),
                '/coronaexp': (context) => CoronaExplain(),
                '/sos': (context) => Sos(),
                '/animation': (context) => MyAnimation(),
                '/testmap': (context) => TestMap(),
                '/tadabir': (context) => Tadabir(),
                '/notification': (context) => Notificationsettings(),
                '/solidarite': (context) => Solidarite(),
                '/allimages': (context) => AllImages(),
                '/addnewmedicalfile': (context) => AddNewMedicalFile(),
                '/settings': (context) => AppSettings(),
                'languageselector': (context) => LanguageSelector()
              },
            );
          },
        ),
      );
    }
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(child: CircularProgressIndicator()));
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
      appBar: AppBar(
        title: Text('Covid 19'),
      ),
      body: Center(child: Text("main")),
    );
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
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Stack(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(23),
                  decoration: BoxDecoration(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Texts().text('اعدادات التنبيه الوقائي', 30,
                                Theme.of(context).accentColor),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.notifications_active,
                                color: Theme.of(context).accentColor, size: 44),
                          ],
                        ),
                        Divider(color: Colors.white, height: 60),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              buildedswitch("clean", "clean", 1),
                              SizedBox(
                                width: 250,
                                child: Texts().text(
                                    'التذكير  بالحفاظ على النظافة',
                                    20,
                                    Theme.of(context).accentColor),
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
                                    20,
                                    Theme.of(context).accentColor),
                              )
                            ]),

                        Divider(),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              buildedswitch("eat", "eat", 3),
                              SizedBox(
                                width: 250,
                                child: Texts().text('التذكير بنظام التغذية', 20,
                                    Theme.of(context).accentColor),
                              )
                            ]),

                        // Divider(),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              buildedswitch("sport", "sport", 4),
                              SizedBox(
                                width: 250,
                                child: Texts().text('التذكير بالنظام الرياضي ',
                                    20, Theme.of(context).accentColor),
                              )
                            ]),

                        Divider(color: Colors.white, height: 30),

                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: RaisedButton(
                                    padding: EdgeInsets.all(15),
                                    onPressed: () => stopallnotifications(),
                                    child: Text(
                                      "ايقاف الكل",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: RaisedButton(
                                    padding: EdgeInsets.all(15),
                                    color: Colors.green,
                                    child: Text(
                                      'دليل إستخدام المنبه',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (
                                          BuildContext context,
                                        ) =>
                                                Guide())),
                                  ),
                                ),
                              ]),
                        ),
                      ])),
            ]),
          ),
        ));
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
                      cleanNotification(1, channel, channel, title, message);
                    }
                    if (channel == "eat") {
                      message = "لاتاكل قبل غسل يديك و التاكد من سلامة الطعام";
                      title = "انتبه فالفيروسات قد تتسلل مع الطعام";
                      dailyNotification(
                          3, channel, channel, title, message, 9, 24);
                      dailyNotification(
                          33, channel, channel, title, message, 3, 24);
                    }
                    if (channel == "getout") {
                      message =
                          "قبل الخروج من البيت تاكد من وضعك الكمامة واحترام مسافة الامان وعدم الاختلاط بالاخرين";
                      title =
                          "اتخد جميع التدابير اللازمة قبل خروجك من البيت وحافظ على سلامة مجتمعك";
                      getoutNotification(2, channel, channel, title, message);
                    }
                    if (channel == "sport") {
                      message =
                          "حافظ على ممارستك لنشاطك الرياضي من البيت ولاتعرض نفسك والاخرين للخطر";
                      title =
                          "الرياضة اخلاق طبقها اليوم وتمرن في البيت باي وسيلة واحمي غيرك";
                      dailyNotification(
                          4, channel, channel, title, message, 8, 26);
                      dailyNotification(
                          44, channel, channel, title, message, 12, 26);
                    }
                  }
                }
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          );
        });
  }

//give a new values from switchers to the stored keys when user change it with some other logic for the rest of switchers
  void putShared(String key, bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if ((key == "clean")) {
      if (val == true) {
        prefs.setBool('getout', false);
        flutterLocalNotificationsPlugin.cancel(2);
      } else {
        flutterLocalNotificationsPlugin.cancel(1);
      }
    }
    if ((key == "eat" && val == false)) {
      flutterLocalNotificationsPlugin.cancel(3);
      flutterLocalNotificationsPlugin.cancel(33);
    }
    if ((key == "getout")) {
      if (val == true) {
        prefs.setBool('clean', false);
        flutterLocalNotificationsPlugin.cancel(1);
      } else {
        flutterLocalNotificationsPlugin.cancel(2);
      }
    }
    if ((key == "sport" && val == true)) {
      flutterLocalNotificationsPlugin.cancel(4);
      flutterLocalNotificationsPlugin.cancel(44);
    }
    prefs.setBool(key, val);
  }

// return the value of each key (string) in bool when user drag the switcher and store it
  Future getShared(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool val = prefs.getBool(key) == null ? false : (prefs.getBool(key));
    return val;
  }

//cancel all notifcations and reset values to false for every switcher
  stopallnotifications() {
    setState(() {
      _cancelallNotifications(1, 2, 3);
      _cancelallNotifications(4, 33, 44);
      putShared('clean', false);
      putShared('getout', false);
      putShared('eat', false);
      putShared('sport', false);
    });
  }

//void to cancel all notification by id with one click
  Future<void> _cancelallNotifications(id1, id2, id3) async {
    await flutterLocalNotificationsPlugin.cancel(id1);
    await flutterLocalNotificationsPlugin.cancel(id2);
    await flutterLocalNotificationsPlugin.cancel(id3);
  }

  //notification method with a hourly interval
  Future<void> cleanNotification(id, channel, idchannel, title, message) async {
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "clean", "channelclean", "this channel is for clean notifications",
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
        timeoutAfter: 30000);
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: channel + ".wav");
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, message, RepeatInterval.Hourly, platformChannelSpecifics,
        payload: channel);

    setState(() {
      $payload = channel + "15";
    });
  }

  //notification method with a hourly interval
  Future<void> getoutNotification(
      id, channel, idchannel, title, message) async {
    print('getout start');

    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "getout", "channelgetout", "this is a getout notification",
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
        timeoutAfter: 30000);
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: channel + ".wav");
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, message, RepeatInterval.Hourly, platformChannelSpecifics,
        payload: channel);

    setState(() {
      $payload = channel;
    });
  }

//
  //notification method with a hourly interval
  Future<void> dailyNotification(
      id, channel, idchannel, title, message, hour, minute) async {
    print(channel + 'start');
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'idis' + id.toString(),
        'channel' + id.toString(),
        'this channel for daily reminder',
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

    await flutterLocalNotificationsPlugin.showDailyAtTime(
        id, title, message, Time(hour, minute, 0), platformChannelSpecifics,
        payload: channel);

    setState(() {
      $payload = channel;
    });
  }
}

//second screen class called by notification from main file
class SecondScreen extends StatefulWidget {
  SecondScreen(this.payload);

  final String payload;

  @override
  State<StatefulWidget> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  String _payload;
  int count = 0;
  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  void dispose() {
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
                      onPressed: () => navigation("back"),
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
                      onPressed: () => navigation("next"),
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
        --count;
        if (count < 0) {
          count = 3;
        }
      });
    }
    if (name == "next") {
      setState(() {
        ++count;
        if (count > 3) {
          count = 0;
        }
      });
    }

    setState(() {
      if (count == 0) {
        _payload = "clean15";
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
