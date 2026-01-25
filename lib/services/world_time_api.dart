import 'dart:convert';

import 'package:http/http.dart';

import 'package:intl/intl.dart';

class WorldTimeApi {
  String location;


  String url;

  String flag;

   String? time;

   bool ? isDaytime ;

  WorldTimeApi(
      {required this.location, required this.url,required this.flag});


  Future<void> fetchTime() async {
    try {
      // initialising the api request from world time api
      final response =
      await get(
        Uri.parse('https://worldtimeapi.org/api/timezone/$url'),
      ).timeout(
        const Duration(seconds: 10),
      ); // setting the time to wait 10 secund to wait the response

      // display the data when the it's successfully;
      if (response.statusCode == 200) {
        // converting the json date to the map object
        final Map<String, dynamic> data = jsonDecode(response.body);
        // print(data);

        // fetching the datetime and offset  from the date
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);
        print(datetime);
        print(offset);

        // Stored time  → UTC
        // Displayed time → UTC ± offset

        // creating datetime object  anc converting into the string
        DateTime now = DateTime.parse(datetime);


          isDaytime =  now.hour >6  && now.hour <= 20 ? true : false ;
          print(" thi is daytime result ${isDaytime}");




        now = now.add(Duration(hours: int.parse(offset)));


        //row time
        // time = now.toString(); //setting the time property
        // time = now.toLocal().toString();



        //formatting the time usign the plugin called int1
        time = DateFormat.jm().format(now);


      } else {
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Network error: $e');
      time = "time could not fetch ";
    }
  }
}


// int count = 0;

// void my_async() async {
//   Response response = await get(
//     Uri.parse('https://jsonplaceholder.typicode.com/todos/1')
//
//
//   );
//   Map data = jsonDecode(response.body);
//   print(data['title']);
// }