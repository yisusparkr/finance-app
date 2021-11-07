import 'package:flutter/material.dart';

class FieldsContainer extends StatelessWidget {
  const FieldsContainer({
    Key? key,
    required this.children
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 600,
        minWidth: 300
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 30, 
        horizontal: 30
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}



