

import 'package:flutter/material.dart';
import 'package:youtube_camera/example1_page.dart';
import 'package:youtube_camera/example2_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Example'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Example1Page()),
              );
            }, child: const Text('Example #1'),),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Example2Page()),
                );
              },
              child: const Text('Example #2'),
            ),
          ],
        ),
      ),
    );
  }
}

