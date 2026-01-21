import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String? time = "loading";

  void world_instance() async {
    WorldTimeApi worldTimeApi_instace = WorldTimeApi(
      url: 'Africa/Mogadishu',
      location: 'Mogadishu',
      flag: 'jjj.png',
    );
    await worldTimeApi_instace.fetchTime();
// using await it helping to us to get response after getting from the world api instance


    Navigator.pushReplacementNamed(context, '/home', arguments: {

      'location': worldTimeApi_instace.location,
      'flag': worldTimeApi_instace.flag,
      'time': worldTimeApi_instace.time ?? "loading",


    }
    );
  }

    @override
    void initState() {
      super.initState();
      // calling the world instance function
      world_instance();
    }

    @override
    Widget build(BuildContext context) {
      // print("this is the building function");
      return Scaffold(
        // padding: EdgeInsetsGeometry.all(30.0),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Loading"),
          backgroundColor: Colors.cyan[600],
          centerTitle: true,
          // elevation: 0,

        ),
        body: Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ),


      );
    }
  }



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


// init state it's used to trigger the first time that we run the state of our app not the setstate that updates
// that when something is change  and re render the screeen  so that means what we have out in the init state will run to the
// first when the page is loadded ,
//
//   @override
//   void initState() {
// print("this is the initial state that runs each time the whole page loaded");
//     super.initState();
