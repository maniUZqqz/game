import 'package:flutter/material.dart';



class Div extends StatelessWidget {
  final String letter;
  final Color color;
  final VoidCallback? onDragCompleted;
  const Div({
    super.key,
    required this.letter,
    required this.color,
    this.onDragCompleted,
  });
  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: letter,
      feedback: squareDiv(letter, color),
      childWhenDragging: const SizedBox(width: 170, height: 170),
      onDragCompleted: onDragCompleted,
      child: squareDiv(letter, color),
    );
  }

}

Widget squareDiv(String letter, Color color) {
  return Container(
    width: 170,
    height: 170,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.white, width: 6),
    ),
    child: Center(
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 90,
          color: Colors.black87,
          fontFamily: "Vazir",
          inherit: false,
        ),
      ),
    ),

  );
}

