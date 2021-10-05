import 'package:flutter/material.dart';
import './quotes.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5K Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuotesPage(),
    );
  }
}

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  var quote = "";

  var author = "";

  void setQuote() {
    var randomNb = Random().nextInt(quotes.length);
    setState(() {
      quote = quotes[randomNb]["quoteText"]!;
      author = quotes[randomNb]["quoteAuthor"]!;
    });
  }

  Color generateColor() {
    var r = Random().nextInt(156);
    var g = Random().nextInt(156);
    var b = Random().nextInt(156);
    return Color.fromRGBO(r, g, b, 1);
  }

  @override
  void initState() {
    setQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("5K Quotes"),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: setQuote,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [generateColor(), generateColor(), generateColor()])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "speech.png",
              height: 80,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 83, 100, 0.8),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "\" $quote \" ",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lobster',
                    color: Colors.white),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 2))),
                child: Text(
                  "- $author",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 21,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
