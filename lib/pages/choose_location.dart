import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time_api.dart';




class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTimeApi> locations = [
    WorldTimeApi(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTimeApi(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTimeApi(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTimeApi(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTimeApi(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTimeApi(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTimeApi(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTimeApi(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {},
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
