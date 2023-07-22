import 'package:flutter/material.dart';

class Modal extends StatefulWidget {
  final Function(String) onSelect;
  const Modal({super.key, required this.onSelect});

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: Text('Value 1'),
            onTap: () {
              // handle selection of Value 1
              Navigator.pop(context, 'Value 1');
            },
          ),
          ListTile(
            title: Text('Value 2'),
            onTap: () {
              // handle selection of Value 2
              Navigator.pop(context, 'Value 2');
            },
          ),
          ListTile(
            title: Text('Value 3'),
            onTap: () {
              // handle selection of Value 3
              Navigator.pop(context, 'Value 3');
            },
          ),
        ],
      ),
    );
  }
}
