import 'package:flutter/material.dart';

class If_S extends StatelessWidget {
  final Function(String) onAccept;

  const If_S({super.key, required this.onAccept});

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 170,
          height: 170,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 6),
          ),
          child: const Center(
            child: Text(
              '------',
              style: TextStyle(
                fontSize: 90,
                color: Colors.white,
                fontFamily: "Vazirani",
              ),
            ),
          ),

        );
      },
      onAccept: (data) {
        if (data == 'س') {
          onAccept(data);
        }
      },
    );
  }
}
