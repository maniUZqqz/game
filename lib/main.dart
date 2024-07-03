import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'div.dart';
import 'if.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool starFull = false;
  bool sInPlace = false;
  bool hora = false;
  bool bluePage = false;
  AnimationController? _animationController;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan.shade300,
        body: OrientationBuilder(
          builder: (context, orientation) {
            double fontSize = MediaQuery.of(context).size.width * 0.2;
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (sInPlace)
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              textDirection: TextDirection.rtl,
                              children: [
                                SlideTransition(
                                  position: _offsetAnimation!,
                                  child: Div(
                                    letter: 'س',
                                    color: Colors.pink.shade200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: RichText(
                                    text: TextSpan(
                                      text: ' ـتاره',
                                      style: TextStyle(
                                        fontSize: fontSize,
                                        color: Colors.blue.shade700,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Vazirani",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        else if (!bluePage)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.rtl,
                            children: [
                              If_S(onAccept: (data) {
                                showPartialWordDisplay();
                              }),
                              IgnorePointer(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: RichText(
                                    text: TextSpan(
                                      text: ' ـتاره',
                                      style: TextStyle(
                                        fontSize: fontSize,
                                        color: Colors.blue.shade700,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Vazirani",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 50),
                        if (!bluePage)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Transform.rotate(
                                  angle: 3 * 180,
                                  // rotating the card 3 * 180 in positive for the first card
                                  child: Div(
                                    letter: 'ب',
                                    color: Colors.orange.shade300,
                                  ),
                                ),
                                Transform.rotate(
                                  angle: -2.6 * pi / 180,
                                  // rotating the card -2.6 * pi / 180 in negative for the seconde card
                                  child: Div(
                                    letter: 'س',
                                    color: Colors.pink.shade200,
                                  ),
                                ),
                                Transform.rotate(
                                  angle: 3 * 180,
                                  // rotating the card 3 * 180 in positive for the fourth card
                                  child: Div(
                                    letter: 'چ',
                                    color: Colors.green.shade300,
                                  ),
                                ),
                                Transform.rotate(
                                  angle: 3 * pi / 180,
                                  // rotating the card  3 * pi / 180 in positive for the fifth card
                                  child: Div(
                                    letter: 'ز',
                                    color: Colors.yellow.shade300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (hora)
                    Align(
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        'assets/Confetti-original.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (starFull)
                    Center(
                      child: IgnorePointer(
                        child: RichText(
                          text: TextSpan(
                            text: 'ستاره',
                            style: TextStyle(
                              fontSize: 300,
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Vazirani",
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Column(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset('assets/icons/close.svg',
                              width: 100, height: 100),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: SvgPicture.asset('assets/icons/speaker.svg',
                              width: 100, height: 100),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void showPartialWordDisplay() {
    setState(() {
      bluePage = true;
      sInPlace = true;
      _animationController?.forward();
    });
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        sInPlace = false;
        starFull = true;
        hora = true;
      });
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          bluePage = false;
          starFull = false;
          hora = false;
          _animationController?.reset();
        });
      });
    });
  }
}
