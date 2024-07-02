import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: IconButton(
            icon: SvgPicture.asset('assets/icons/close.svg',
                width: 100, height: 100),
            onPressed: () {},
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

