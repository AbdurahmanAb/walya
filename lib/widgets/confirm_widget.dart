import 'package:flutter/material.dart';

class ConfirmWidget extends StatelessWidget {
  final String initial;
  final second;
  const ConfirmWidget({required this.initial, required this.second, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "$initial",
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
                child: Text(
              "$second",
              style: TextStyle(),
            )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
