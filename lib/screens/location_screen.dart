import 'package:flutter/material.dart';
import 'package:soil_mineral_analyser/screens/scan_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "ENABLE YOUR\n    LOCATION ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        Icon(
          Icons.location_on,
          size: 300,
          color: Colors.lightBlueAccent,
        ),
        Container(
          width: 300,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scan_Screen()),
                );
              },
              child: Text("ENABLE LOCATION"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(4.0),
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightBlueAccent))),
              )),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scan_Screen()),
              );
            },
            child: Text(
              "Not now?",
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 18),
            ))
      ],
    )));
  }
}
