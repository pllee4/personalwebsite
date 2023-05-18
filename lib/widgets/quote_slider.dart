import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/quote.dart';
import 'package:personalwebsite/widgets/quote_author.dart';

class QuoteSlider extends StatefulWidget {
  QuoteSlider({Key? key}) : super(key: key);

  @override
  _QuoteSliderState createState() => _QuoteSliderState();
}

class _QuoteSliderState extends State<QuoteSlider> {
  // int _quoteIndex = 0;
  List<Widget> quoteList = [
    ListView(children: [
      Center(child: Quote(quote: '1.02^{365} = 1377.4')),
      Center(child: Divider()),
      Center(child: Quote(quote: '0.98^{365} = 0.0006'))
    ]),
    QuoteAuthor(
        quote: "Work hard in silence, let your success be your noise",
        author: "Frank Ocean",
        backgroundColor: Colors.cyan[900]!),
    QuoteAuthor(
        quote: "Growth and comfort do not coexist",
        author: "Ginni Rometty",
        backgroundColor: Colors.green[800]!),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final CarouselController _quoteCarouselController = CarouselController();

  List<Widget> generateQuotes() {
    return quoteList.map((quote) => quote).toList();
  }

  @override
  Widget build(BuildContext context) {
    var quoteSliders = generateQuotes();
    return Material(
        type: MaterialType.transparency,
        child: CarouselSlider(
          carouselController: _quoteCarouselController,
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: (MediaQuery.of(context).size.height) / 3,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: (MediaQuery.of(context).size.width) /
                (MediaQuery.of(context).size.height),
            // enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                // _quoteIndex = index;
              });
            },
          ),
          items: quoteSliders,
        ));
  }
}
