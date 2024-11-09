import 'package:flutter/material.dart';
import 'package:soil_mineral_analyser/screens/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 184, 158, 228)),
        useMaterial3: true,
      ),
      home: LanguageSelectScreen(),
    );
  }
}

class LanguageSelectScreen extends StatelessWidget {
  final List<Color> colorsList = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.cyan,
  ];
  final List<Language> languages = [
    Language('English', "E"),
    Language('Hindi', "ह"),
    Language('Marathi', "म"),
    Language('Gujarati', "ग"),
    Language('Tamil', "त"),
    Language('Telugu', "तम"),
    Language('Kannada', "क"),
    Language('Malayalam', "मल"),
    Language('Bengali', "ब"),
    Language('Punjabi', "प"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select a Language',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Center(
              child: Container(
                width: 500,
                height: 500,
                child: GridView.builder(
                  padding: EdgeInsets.all(16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle language selection
                         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocationScreen()),
            );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colorsList[
                                    index], // Specify border color here
                                width: 3.0, // Specify border thickness here
                              ),
                            ),
                            child: CircleAvatar(
                              child: Text(languages[index].language_name),
                              radius: 30,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Text(languages[index].name)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Language {
  final String name;
  final String language_name;

  Language(this.name, this.language_name);
}
