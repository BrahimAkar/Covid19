import 'dart:typed_data';
import 'dart:ui';
import 'dart:async' show Future, Timer;
import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
// Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();


NotificationAppLaunchDetails notificationAppLaunchDetails;



class Notification2 extends StatefulWidget {
  @override
  _Notification2State createState() => _Notification2State();

}

class _Notification2State extends State<Notification2> {

Timer timerclean,timereat,timersport,timergetout;
 //start of notifictation methods 
    final MethodChannel platform = MethodChannel('crossingthestreams.io/resourceResolver');

  @override
  void initState() {
    super.initState();
    _requestIOSPermissions();
    _configureDidReceiveLocalNotificationSubjectclean();
    _configureSelectNotificationSubjectclean();

     //inittimerstate();
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

  @override
  Widget build(BuildContext context) {
    return Container(
                          width: 400,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                            color:Color(0XFF243953),
                            borderRadius: BorderRadius.circular(10)
                           ),
                    child:
                       Column(children:<Widget>[
                            Row(children: <Widget>[
                           buildedswitch('eat','eat',2),
                                ],)
                              ]),
       
             );
  }

  FutureBuilder buildedswitch(key,channel,id)
  {
    return
       FutureBuilder(
                    future: getShared(key),
                    initialData: false,
                    builder: (context, snapshot) {
                       return Switch(
                            value: snapshot.data,
                            onChanged: (value) {
                           putShared(key, value);
                             setState(() {
                             smartnotificationcall(channel,id);
                             });
                      },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                );
          });
    }

// data store on  shared refernce

void putShared(String key, bool val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, val);
}

Future getShared(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool val = prefs.getBool(key) == null ? false : (prefs.getBool(key));
  return val;
}


//--------------------------
// set up a notification/s

Future<void> _cancelNotifications(id,chanelname) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

Future<void> _cancelallNotifications() async {
    await flutterLocalNotificationsPlugin.cancel(1);
    await flutterLocalNotificationsPlugin.cancel(2);
    await flutterLocalNotificationsPlugin.cancel(3);
    await flutterLocalNotificationsPlugin.cancel(4);
  }


//start onfiguring a notification

 void _configureDidReceiveLocalNotificationSubjectclean() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != "this is some title"
              ? Text(receivedNotification.title)
              : null,
          content: receivedNotification.body != 'Text("hello")'
              ? Text(receivedNotification.body)
              : null,
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.pushNamed(
                  context,
                    "/shop",
                );
              },
            )
          ],
        ),
      );
    });
  }
    
   void _configureSelectNotificationSubjectclean() {
    selectNotificationSubject.stream.listen((String payload) async {
      await Navigator.pushNamed(
        context,
        "/sport",
      );
    });
  }

Future<void> _scheduleNotification(id,duration,channelname,channelid,soundandroid,soundios,message,title) async {

    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelid,
        channelname,
        'your other channel description',
        icon: '@mipmap/ic_launcher',
        importance: Importance.Max,
        priority: Priority.High,
        ongoing: true,
        autoCancel: false,
        sound: RawResourceAndroidNotificationSound(soundandroid),
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
        vibrationPattern: vibrationPattern,
        enableLights: true,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000,
        ledOffMs: 500);
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound:soundios);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id,
        title,
        message,
        RepeatInterval.EveryMinute,
        platformChannelSpecifics,
        );
    }

/////////////////////////////////////////////////////////////
 Future<void> smartnotificationcall(channelname,id)
 async{
return _scheduleNotification(id,20,'channel1',"id1","sport","sport.wav",'لاتنسى ان النظافة من الايمان','النظافة');}


/*Future<void> _showNotificationWithNoSound() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'silent channel id',
        'silent channel name',
        'silent channel description',
        playSound: false,
        styleInformation: DefaultStyleInformation(true, true));
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, '',
        '', platformChannelSpecifics);
        setState(() {
      timersport;
      timereat;
      timergetout;
      timerclean;
  });
    }*/
     
}



//reciver notification class
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


class SecondScreen extends StatefulWidget {
  SecondScreen(this.payload);

  final String payload;

  @override
  State<StatefulWidget> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  String _payload;
  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen with payload: ${(_payload ?? '')}'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}