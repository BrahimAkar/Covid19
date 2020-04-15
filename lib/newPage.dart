
/*
import 'dart:typed_data';
import 'dart:ui';
import 'dart:async' show Future, Timer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import './widgets/inputs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';



final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
// Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();


NotificationAppLaunchDetails notificationAppLaunchDetails;



class Notificationsettings extends StatefulWidget {
  @override
  _NotificationsettingsState createState() => _NotificationsettingsState();

}

class _NotificationsettingsState extends State<Notificationsettings> {

 //start of notifictation methods 
    final MethodChannel platform = MethodChannel('crossingthestreams.io/resourceResolver');
 void initState() {
    super.initState();
    _requestIOSPermissions();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
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

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
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
                    builder: (context) =>
                        SecondScreen(receivedNotification.payload),
                  ),
                );
              },
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen(payload)),
      );
    });
  }

  ////
  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

String elements()
{
  var name="";
  var i =new Random();
  var t = i.nextInt(4);
  if(t==0){name="clean";}
  if(t==1){name="sport";}
  if(t==2){name="eat";}
  if(t==3){name="getout";}
   
  return name;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body:
             Center(
               child:
                   Container(
                          width: 400,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                            color:Color(0XFF243953),
                            borderRadius: BorderRadius.circular(10)
                           ),
             child:
                Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     Inputs().text('اعدادات التنبيه الوقائي', 30)
                    ],), 
                   
                 Divider(color: Colors.white,height: 30),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:<Widget>[
                        buildedswitch("hour"),
                         SizedBox(
                             width: 250,
                             child:
                          Inputs().text('التذكير بالتدابير الوقائية كل ساعة   ', 20),
                          )
                                ])
                          ,
                     Divider(),
             
                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children:<Widget>[
                       buildedswitch('day'),
                         SizedBox(
                         width: 250,
                         child: 
                       Inputs().text('      التذكير بالتدابير الوقائية مرة واحدة كل يوم', 20),
                     )
                    ]),

                       Divider(),
                       Row(children: <Widget>[
                       ],),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:<Widget>[
                       buildedswitch("twohours"),
                          SizedBox(
                         width: 250,
                         child:
                         Inputs().text('التذكير بالتدابير الوقائية مرتين في اليوم ', 20),
                            )
                         ]),

                      Divider(color:Colors.white,height:30),
                                 ])
             )
      )
      );
  }

  FutureBuilder buildedswitch(key)
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
                              smartnotificationcall(key);
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

if(key=="hour" && val==true)
{
  putShared("day",false);
  putShared("twohours",false);
  _cancelNotifications(1);
  _cancelNotifications(2);
  _cancelNotifications(4);
}if(key=="hour" && val==false){_cancelNotifications(3);}

if(key=="twohours" && val==true)
{
  putShared("day",false);
  putShared("hour",false);
  _cancelNotifications(3);
  _cancelNotifications(4);
}if(key=="twohours" && val==false){_cancelNotifications(1);_cancelNotifications(2);}

if(key=="day" && val==true)
{
    putShared("towhours",false);
  putShared("hour",false);
  _cancelNotifications(1);
  _cancelNotifications(2);
  _cancelNotifications(3);
}  if(key=="twohours" && val==false){_cancelNotifications(4);}
  prefs.setBool(key, val);
}


Future getShared(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool val = prefs.getBool(key) == null ? false : (prefs.getBool(key));
  return val;
}

//--------------------------
// set up a notification/s

Future<void> _cancelNotifications(id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

Future<void> _cancelallNotifications() async {
    await flutterLocalNotificationsPlugin.cancel(1);
    await flutterLocalNotificationsPlugin.cancel(2);
    await flutterLocalNotificationsPlugin.cancel(3);
    await flutterLocalNotificationsPlugin.cancel(4);
  }


//start onfiguring a notification


Future<void> notificationforhour(id) async {

var element = elements();

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "id"+element,
        element,
        'your other channel description',
        icon: '@mipmap/ic_launcher',
        importance: Importance.Max,
        priority: Priority.High,
        ongoing: true,
        autoCancel: false,
        sound: RawResourceAndroidNotificationSound(element),
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
        enableLights: true,
        color: const Color.fromARGB(255, 255, 0, 0),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        ledOnMs: 1000,
        ledOffMs: 500,
        );
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound:element+".wav");
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id,
        element,
      "المرجو الالتزام بالتدابير الوقائية للحفاظ على سلامتكم",
        RepeatInterval.EveryMinute,
        platformChannelSpecifics,
        payload: 'حافظ على سلامة مجتمعك'
        );
    }
    ////// Sport
  
Future<void> notificationforday(id,hour) async {
var element = elements();
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
            "id",
            element,
            'your other channel description',
            icon: '@mipmap/ic_launcher',
            importance: Importance.Max,
            priority: Priority.High,
            ongoing: true,
            autoCancel: false,
            sound: RawResourceAndroidNotificationSound(element),
            largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
            enableLights: true,
            color: const Color.fromARGB(255, 255, 0, 0),
            ledColor: const Color.fromARGB(255, 255, 0, 0),
            ledOnMs: 1000,
            ledOffMs: 500);
        var iOSPlatformChannelSpecifics =
            IOSNotificationDetails(sound:element+".wav");
        var platformChannelSpecifics = NotificationDetails(
            androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.showDailyAtTime(
            id,
            element,
          "المرجو الالتزام بالتدابير الوقائية للحفاظ على سلامتكم",
            Time(hour,00,00),
            platformChannelSpecifics,
            );
        }
      
    /////////////////////////////////////////////////////////////
     Future<void> smartnotificationcall(channelname)
     async{
       if(channelname=="twohours")
       {
         notificationforday(1,10);
         notificationforday(2,18);
       }
        if(channelname=="hour")
       {
         notificationforhour(3);
       }
        if(channelname=="day")
       {
         notificationforday(4,12);
       }
       
       }
    
    
         
    }*/
