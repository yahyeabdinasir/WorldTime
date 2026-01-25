import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // data =  ModalRoute.of(context).settings.arguments; this was what have coused the error

    // and also here how i solved the error

    if (data.isNotEmpty) {
      data.isNotEmpty
          ? data
          : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??{};

      print(data);
    }

    //
    bool isDaytime = data['isDaytime'] ?? true;
    String bgImage = isDaytime ? 'day.png' : 'night.png';

    return Scaffold(
      // backgroundColor: AssetImage('assets/${is_it_day_or_night}'),
      appBar: AppBar(
        title: Text("location time"),
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/${bgImage}'),
            fit: BoxFit.cover,

          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 150, 44, 0),

          // padding: EdgeInsets.all(1),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic results = await Navigator.pushNamed(
                      context,
                      "/location",
                    );
                    if (results!= null) {

                    setState(() {
                    data = {
                    'time': results['time'],
                    'location': results['location'],
                    'flag': results['flag'],

                    // 'isDaytime' : results['isDaytime'],
                    };
                    });

                    }

                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: Text(
                    "edit location",

                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  data?['location'],
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data?['time'] ?? "unknown data",
                  style: TextStyle(color: Colors.white, fontSize: 54),
                ),
              ],
            ),
          ),
        ),

      )
    );



  }
}
//
// TextButton.icon(
// onPressed: () {
// Navigator.pushNamed(context, '/');
// },
// icon: Icon(Icons.edit_location),
// label: Text("go loading "),
//
// // child: Center(
// //   child: Text("hello there"),
// // ),
// ),
