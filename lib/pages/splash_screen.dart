import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/animated_progress_bar.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var duration = Duration(milliseconds: 3500);
    Future.delayed(duration, () {
      Navigator.pushNamed(context, '/Home');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Center(child: Text("Text"));
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10),
        alignment: Alignment.center,
        // width: MediaQuery.of(context).size.width / 2.0,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: (MediaQuery.of(context).size.height) / 2.5),
          Center(
              child: Column(children: [
            AnimatedProgressBar(percentage: 100, label: "Pin Loon")
          ]))
        ]));
  }
}
