part of 'helpers.dart';

void showLoadingDialog( BuildContext context, String title ) {
  if ( Platform.isIOS ) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(title),
          content: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 100
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }

}