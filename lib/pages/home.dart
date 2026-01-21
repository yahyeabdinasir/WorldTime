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
    final data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    print(data);

    return Scaffold(
      appBar: AppBar(
        title: Text("location time"),
        backgroundColor: Colors.brown[400],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40,150,0,0),


        child: SafeArea(

          child: Column(

            children: <Widget>[
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/location");
                },
                icon: Icon(Icons.edit_location),
                label: Text("edit location",

                  style: TextStyle(fontSize: 21),
                ),

              ),
              SizedBox(height: 20,),

              Text(data?['location'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),


              ),
              Text(
                 data?['time']?? "unknown data",
                style: TextStyle(
                  fontSize: 60
                ),


              )





            ],
          ),
        ),
      ),
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