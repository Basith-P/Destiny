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
          child: Container(
            color: Color(0xff252B49).withAlpha(220),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white10,
                          border: Border.all(color: Colors.white12)),
                      padding: EdgeInsets.all(25),
                      // color: Colors.white.withOpacity(.1),
                      child: Text(
                        storyBrain.getStory(),
                        style: TextStyle(fontSize: 22, height: 1.5, fontFamily: 'RaleWay'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Text(
                      storyBrain.getChoice1(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(BorderSide(
                        width: 3,
                        color: Color(0xff2B8CED),
                      )),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      overlayColor: MaterialStateProperty.all<Color>(Color(0xff2B8CED)),
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
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(BorderSide(
                          width: 3,
                          color: Color(0xff2B8CED),
                        )),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        overlayColor: MaterialStateProperty.all<Color>(Color(0xff2B8CED)),
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
