import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const ButtonAnimation(),
    );
  }
}

class ButtonAnimation extends StatefulWidget {
  const ButtonAnimation({super.key});

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation> {
  bool _isFilterShow = false;
  double _filterWidth = 0;
  double _filterHeight = 0;

  final Duration _duration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _filterWidth = 150;
    _filterHeight = 50;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  if (_isFilterShow) {
                    _filterWidth = 0;
                    _filterHeight = 0;
                  } else {
                    _filterWidth = 150;
                    _filterHeight = 50;
                  }
                  _isFilterShow = !_isFilterShow;
                });
              },
              child: Text(_isFilterShow ? "Hide" : "Show"),
            ),
            AnimatedContainer(
              width: _filterWidth,
              height: _filterHeight,
              duration: _duration,
              curve: Curves.fastEaseInToSlowEaseOut,
              margin: const EdgeInsets.only(bottom: 20),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(55),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange,
                    spreadRadius: 0.2,
                    blurRadius: 12,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: AnimatedScale(
                      scale: _isFilterShow ? 1 : 0,
                      curve: Curves.fastOutSlowIn,
                      duration: _duration,
                      child: AnimatedRotation(
                        turns: _isFilterShow ? 0 : -1,
                        curve: Curves.fastOutSlowIn,
                        duration: _duration,
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      "Filter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
