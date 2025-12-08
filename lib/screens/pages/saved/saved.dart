import 'package:flutter/material.dart';

import '../../../resources/bottom_navigation_bar/botton_navigation.dart';


class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved'),
      ),
      bottomNavigationBar: BottomNavigation(index: 2,),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
