import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitness Tracker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.greenAccent,borderRadius: BorderRadius.circular(16),),
              alignment: Alignment.center,
              height: 40.h,
              child: const Column(
                children: [
                  Text("20"),
                  Text("/6000 steps")
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  color: Colors.redAccent,
                  child: const Text("Food"),
                ),
                Container(
                  color: Colors.blueAccent,
                  child: const Text("Water"),
                ),
              ],
            ),
            Container(
              color: Colors.blueGrey,
              child: const Text("BPM"),),
            Row(
              children: [
                Container(
                  color: Colors.yellowAccent,
                  child: const Text("Workout"),
                ),
                Container(
                  color: Colors.yellow,
                  child: const Text("Workout History"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
