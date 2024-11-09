import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:soil_mineral_analyser/screens/soil_details_screen.dart';

class Scan_Screen extends StatefulWidget {
  @override
  _Scan_ScreenState createState() => _Scan_ScreenState();
}

class _Scan_ScreenState extends State<Scan_Screen> {
  CameraController? _controller;
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      _controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator()); // Loading indicator
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 5.0, // Border width
                ),
                borderRadius:
                    BorderRadius.circular(8.0), // Optional: Rounded corners
              ),
              width: 300,
              height: 300,
              child: CameraPreview(
                  _controller!), // Display camera feed within this Container
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SoilDetailsScreen()),
                      );
                    },
                    child: Text(
                      "Get data",
                      style: TextStyle(fontSize: 17),
                    ),
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
            )
          ],
        ),
      ),
    );
  }
}
