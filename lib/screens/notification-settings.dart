/*import 'dart:typed_data';
import 'dart:ui';
import 'dart:async' show Future, Timer;
import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import './widgets/inputs.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

/*Future<void> inittimerstate() async {
    // Configure BackgroundFetch.
    BackgroundFetch.configure(BackgroundFetchConfig(
        minimumFetchInterval: 15,
        stopOnTerminate: false,
        enableHeadless: false,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.NONE
    ), (String taskId) async {
      // This is the fetch-event callback.
      print("[BackgroundFetch] Event received $taskId");
      setState(() {
    
      });
      // IMPORTANT:  You must signal completion of your task or the OS can punish your app
      // for taking too long in the background.
      BackgroundFetch.finish(taskId);
    }).then((int status) {
      print('[BackgroundFetch] configure success: $status');
      setState(() {
        
      });
    }).catchError((e) {
      print('[BackgroundFetch] configure ERROR: $e');
      setState(() {

      });
    });
     // Optionally query the current BackgroundFetch status.
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }
void tobackground(enabled) {
      BackgroundFetch.start().then((int status) {
      });
  }*/
/*
Future<Timer> repeat(status,todo)
async{
  if(status=="clean")
  {
    const oneDecimal = const Duration(seconds: 30);
    if(todo=="work")
    {
      print('im here clean');
      setState(() {
        this.timerclean = Timer.periodic(oneDecimal, (timerclean) async{
    _scheduleNotification(1,20,'clean',"clean","clean","clean.wav",'لاتنسى ان الكظافة من الايمان','النظافة');
});
      });
    }else{
      setState(() {
         timerclean.cancel();
      });
     }
  }
    if(status=="getout")
  {
    print('im here getout');
    const oneDecimal = const Duration(seconds: 50);
    if(todo=="work")
    {
     Timer.periodic(oneDecimal, (timergetout) async{
    _scheduleNotification(2,30,"getout","getout","getout","getout.wav",'يمكنك ممارسة الرياضة في البيت والمحافظة على نشاطك دون التسبب في مخاطر لنفسك والاخرين','الرياضة');
});
    }
    else{setState(() {
      timergetout.cancel();
    });}
  }
    if(status=="sport")
  {
    const oneDecimal = const Duration(seconds: 90);
    if(todo=="work")
    {
     Timer.periodic(oneDecimal, (timersport) async{
       _scheduleNotification(3,30,"clean","sport","sport","sport.wav",'يمكنك ممارسة الرياضة في البيت والمحافظة على نشاطك دون التسبب في مخاطر لنفسك والاخرين','الرياضة');
});
    }else{setState(() {
      timersport.cancel();
    });}
  }
    if(status=="eat")
  {
    const oneDecimal = const Duration(seconds: 120);
    if(todo=="todo")
    {
    Timer.periodic(oneDecimal, (timereat) async{
   _scheduleNotification(4,30,"eat","eat","eat","eat.wav",'يمكنك ممارسة الرياضة في البيت والمحافظة على نشاطك دون التسبب في مخاطر لنفسك والاخرين','الرياضة');
});
    }else{
      setState(() {
        timereat.cancel();
      });
    }
  }
tobackground(true);
 
}*/
  ////////////

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
                        buildedswitch("clean","clean",1),
                         SizedBox(
                             width: 250,
                             child:
                          Inputs().text('التذكير  بالحفاظ على النظافة', 20),
                          )
                                ])
                          ,
                     Divider(),
             
                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children:<Widget>[
                       buildedswitch('getout','getout',2),
                         SizedBox(
                         width: 250,
                         child: 
                       Inputs().text('التذكير بالتدابير الوقائية عند الخروج من البيت', 20),
                     )
                    ]),

                       Divider(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:<Widget>[
                       buildedswitch("eat","eat",3),
                          SizedBox(
                         width: 250,
                         child:
                         Inputs().text('التذكير بنظام التغذية', 20),
                            )
                         ]),

                        // Divider(),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children:<Widget>[
                        buildedswitch("sport","sport",4),
                        SizedBox(
                             width: 250,
                             child:
                         Inputs().text('التذكير بالنظام الرياضي ', 20),
                         )
                      ]),

                      Divider(color:Colors.white,height:30),
                      
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                           children:<Widget>[
                       Column(
                            children:<Widget>[
                            Row(children: <Widget>[
                             buildedswitch('activeall',"activeall",0),
                              Inputs().text('تعطيل الكل', 20),
                               ],)
                              ]),
                       Column(children:<Widget>[
                            Row(children: <Widget>[
                           buildedswitch('desactiveall','desactiveall',0),
                              Inputs().text('تفعيل الكل', 20),
                                ],)
                              ]),
                    ]),
             ])
             )
      )
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
                               if(value==true && (key!="activeall" || key!="desactiveall" ))
                               {
                                 if(channel=="sport")
                                 {
                                   smartnotificationcall('sport',4,10,00,00);
                                   smartnotificationcall('sport',5,16,00,00);
                                   print("is sport");
                                  }else{smartnotificationcall(channel, id,0,0,0);}
                              
                               }else{
                                 if(channel=="sport")
                                 {
                                   print("is sport");
                               _cancelNotifications(id,channel);
                               _cancelNotifications(id+1,channel);
                                 }else{_cancelNotifications(id,channel);}
                                 
                               }
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

  if(key=="activeall" && val==true)
  {
    prefs.setBool('desactiveall', false);
    makeonrchange(false);
    _cancelallNotifications();
 
   }
  if(key=="activeall" && val==false){prefs.setBool('desactiveall', true);}

  if(key=="desactiveall" && val==true){
    prefs.setBool('activeall', false);
     makeonrchange(true);
     smartnotificationcall('clean',1,0,0,0);
     smartnotificationcall('getout',2,0,0,0);
     smartnotificationcall('eat',3,0,0,0);
     smartnotificationcall('sport',4,10,00,00);
     await Duration(seconds:10);
     smartnotificationcall('sport',5,16,00,00);
  }
  if(key=="desactiveall" && val==false){prefs.setBool('activeall', true);}

  if((key!="desactiveall" || key!='activeall')&& val==true)
  {
       prefs.setBool('activeall', false);
      prefs.setBool('desactiveall', true);
  }
  if((key!="desactiveall" || key!='activeall')&& val==false)
  {
       prefs.setBool('activeall', true);
      prefs.setBool('desactiveall', false);
     
      if(key=="clean" && this.timerclean!=null)
      {
        timerclean.cancel();
        _cancelNotifications(1,key);
        prefs.setBool(key, false);
      }
       if(key=="eat" && this.timereat!=null)
      {
        timerclean.cancel();
        _cancelNotifications(3,key);
         prefs.setBool(key, false);
      } 
       if(key=="getout" && this.timergetout!=null)
      {
        timerclean.cancel();
        _cancelNotifications(2,key);
         prefs.setBool(key, false);
      } 
       if(key=="sport" && this.timersport!=null)
      {
        timerclean.cancel();
        _cancelNotifications(4,key);
         prefs.setBool(key, false);
      }               
  }

  prefs.setBool(key, val);
}


Future getShared(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool val = prefs.getBool(key) == null ? false : (prefs.getBool(key));
  return val;
}


//return one value to all single switchers
void makeonrchange(anser) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('clean', anser);
    prefs.setBool('eat', anser);
    prefs.setBool('sport', anser);
    prefs.setBool('getout', anser);
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
    ////// Sport
  
Future<void> _scheduleNotificationcleansport(id,duration,channelname,channelid,soundandroid,soundios,message,title,hour,min,sec) async {

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
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        id,
        title,
        message,
        Time(4,40,00),
        platformChannelSpecifics,
        );
        print("sport is created at "+hour.toString()+"/"+min.toString()+"/with channel id"+channelid.toString());
    }
  
/////////////////////////////////////////////////////////////
 Future<void> smartnotificationcall(channelname,id,hour,min,sec)
 async{
   if(channelname=="clean"){ Duration(seconds:5); return _scheduleNotification(id,20,'channel1',"id1","clean","clean.wav",'لاتنسى ان الكظافة من الايمان','النظافة');}
   if(channelname=="sport"){ Duration(seconds:20); return _scheduleNotificationcleansport((id+hour),30,"channel1",(channelname+id.toString()),"sport","sport.wav",'يمكنك ممارسة الرياضة في البيت والمحافظة على نشاطك دون التسبب في مخاطر لنفسك والاخرين','الرياضة',hour,min,sec);}
   if(channelname=="eat"){ Duration(seconds:5); return _scheduleNotification(id,30,"channel1","id3","eat","eat.wav",'نظف واغسل واخرص على تعقيم يديك او ملابسك او احديتك','الغسل والتنظيف');}
   if(channelname=="getout"){ Duration(minutes:10); return _scheduleNotification(id,30,"channel1","id4","getout","getout.wav",'احمي نفسك وغيرك باحترامك للاجراءات المتبعة للوقاية من الفيروس','الخروج خارج البيت');} 
}


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
}*/