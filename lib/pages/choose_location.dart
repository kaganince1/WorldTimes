import 'package:flutter/material.dart';
import 'package:worldtimes/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flagUrl: 'uk.png'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flagUrl: 'turkey.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flagUrl: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flagUrl: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flagUrl: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flagUrl: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flagUrl: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flagUrl: 'indonesia.png'),
  ];

  void updateTime(index) async
  {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flagUrl': instance.flagUrl,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flagUrl}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
