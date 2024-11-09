import 'package:flutter/material.dart';
import 'dart:math';
class SoilDetailsScreen extends StatefulWidget {
  @override
  _SoilDetailsScreenState createState() => _SoilDetailsScreenState();
}

class _SoilDetailsScreenState extends State<SoilDetailsScreen> {
  bool isLoading = true;
  double nitrogen = 0;
  double phosphorus = 0;
  double potassium = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    // Generate a random delay between 2 to 5 seconds
    int delayInSeconds = Random().nextInt(4) + 2;
    await Future.delayed(Duration(seconds: delayInSeconds));

    // Generate random composition percentages for soil components
    setState(() {
      nitrogen = Random().nextDouble() * 100;
      phosphorus = Random().nextDouble() * 100;
      potassium = Random().nextDouble() * 100;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soil Details'),
        backgroundColor: Colors.green[700],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Soil Composition:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text('Nitrogen: ${nitrogen.toStringAsFixed(2)}%', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Phosphorus: ${phosphorus.toStringAsFixed(2)}%', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Potassium: ${potassium.toStringAsFixed(2)}%', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
    );
  }
}