import 'package:flutter/material.dart';

import '../../../resources/bottom_navigation_bar/botton_navigation.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress'),
      ),
      bottomNavigationBar: BottomNavigation(index: 1,),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
