import 'package:flutter/material.dart';
import 'package:worldtimes/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'Istanbul', flagUrl: 'turkey.png', url: 'Europe/Istanbul');
    await instance.getTime();
    //print(instance.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flagUrl': instance.flagUrl,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }
  @override
  void initState()
  {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
