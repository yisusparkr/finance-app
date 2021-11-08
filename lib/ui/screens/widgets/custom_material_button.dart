import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.heroTag,
    this.color,
    this.splashColor,
    this.highlightColor
  }) : super(key: key);

  final String? heroTag;
  final String label;
  final Icon icon;
  final Color? color;
  final Color? splashColor;
  final Color? highlightColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      height: 60,
      minWidth: 200,
      shape: const StadiumBorder(),
      color: color ?? Theme.of(context).colorScheme.secondary,
      splashColor: splashColor ?? Theme.of(context).splashColor,
      highlightColor: highlightColor ?? Theme.of(context).highlightColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox( width: 10 ),
          ( heroTag != null ) ?
          Hero(
            tag: Key(heroTag!), 
            child: icon
          )
          : icon
        ],
      ),
      onPressed: onPressed
    );
  }
}