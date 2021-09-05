import 'package:flutter/material.dart';

import 'storybrain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destiny',
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = new StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Text(
                      storyBrain.getChoice1(),
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black45),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: TextButton(
                      child: Text(
                        storyBrain.getChoice2(),
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black45),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
