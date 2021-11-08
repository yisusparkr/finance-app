part of 'helpers.dart';

void showError( BuildContext context, String message ) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Theme.of(context).colorScheme.secondary,
    content: ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          LineIcon(
            LineIcons.timesCircle,
            color: Colors.red,
          ),
          const SizedBox( width: 5 ),
          Text(
            message,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    )
  );
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}