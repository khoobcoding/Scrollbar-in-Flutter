import 'package:flutter/material.dart';

class ScrollbarApp extends StatefulWidget {
  const ScrollbarApp({super.key});

  @override
  State<ScrollbarApp> createState() => ScrollbarAppState();
}

class ScrollbarAppState extends State<ScrollbarApp> {
  ScrollController controller = ScrollController();
  final languagelist = [
    'Python',
    'Dart',
    'Java',
    'CSS5',
    'HTML',
    'C++',
    'C',
    'Php',
    'JavaScript',
    'Flutter',
    'React Native',
    'React',
    'C#',
    'Visual Basic .NET',
    'SQL',
    'Assembly language',
    'PHP',
    'R',
    'Go',
    'Classic Visual Basic',
    'MATLAB',
    'Swift',
    'Ruby',
    'Perl',
    'Objective-C',
    'Rust',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      print(controller.position);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'ScrollBar App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
      ),
      bottomNavigationBar:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        MaterialButton(
          color: Colors.red,
          onPressed: () {
            controller.jumpTo(controller.position.minScrollExtent);
          },
          minWidth: 60,
          child: const Text(
            'Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          color: Colors.blue,
          onPressed: () {
            controller.jumpTo(controller.position.maxScrollExtent);
          },
          minWidth: 60,
          child: const Text(
            'Down',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          color: Colors.teal,
          onPressed: () {
            controller.animateTo(controller.position.minScrollExtent,
                duration: Duration(seconds: 2), curve: Curves.linear);
          },
          minWidth: 60,
          child: const Text(
            'Ani Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          color: Colors.blue,
          onPressed: () {
            controller.animateTo(controller.position.maxScrollExtent,
                duration: Duration(seconds: 2), curve: Curves.linear);
          },
          minWidth: 60,
          child: const Text(
            'Ani Down',
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
      body:
          //  Scrollbar(
          RawScrollbar(
        controller: controller,
        thickness: 15,
        thumbColor: Colors.red,
        thumbVisibility: true,
        trackVisibility: true,
        trackColor: Colors.amber,
        trackBorderColor: Colors.black,
        radius: Radius.circular(30),
        trackRadius: Radius.circular(30),
        scrollbarOrientation: ScrollbarOrientation.right,
        mainAxisMargin: 10, //thumb
        crossAxisMargin: 5, //track
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          itemCount: languagelist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                languagelist[index],
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(255, 59, 58, 58)),
              ),
            );
          },
        ),
      ),
    );
  }
}
