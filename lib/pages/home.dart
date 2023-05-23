import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/quote_slider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(height: (MediaQuery.of(context).size.height) / 3.5),
        QuoteSlider(),
        ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {
              Navigator.pushNamed(context, '/About');
            },
            child: Text('EXPLORE NOW',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 30))),
      ]),
    );
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.teal[900],
    minimumSize: Size(140, 70),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  );
}
