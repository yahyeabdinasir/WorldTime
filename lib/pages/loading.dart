import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' ;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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




  void fetchTime() async {
    try {
      final response = await get(
        Uri.parse('https://worldtimeapi.org/api/timezone/Africa/Mogadishu'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
      } else {
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Network error: $e');
    }
  }


  @override
  void initState() {
    super.initState();
    fetchTime();
  }
  @override
  Widget build(BuildContext context) {
    // print("this is the building function");
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("Loading"),
      //   backgroundColor: Colors.cyan[600],
      //   centerTitle: true,
      //   elevation: 0,
      //

      //
      //   ),
      //   body: Center(
      //     child: Column(
      //
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Text("you have clickes ${count} times",
      //           style: TextStyle(
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold,
      //
      //           ),
      //
      //         )
      //
      //       ],
      //     ),
      //   ),
      //
      //
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: (){
      //       setState(() {
      //         count+=1;
      //       });
      //     },
      //     child: Icon(Icons.add),
      //   ),
      //
      //
      //
      //
      // );
    );
  }
}








// init state it's used to trigger the first time that we run the state of our app not the setstate that updates
// that when something is change  and re render the screeen  so that means what we have out in the init state will run to the
// first when the page is loadded ,
//
//   @override
//   void initState() {
// print("this is the initial state that runs each time the whole page loaded");
//     super.initState();
//   }