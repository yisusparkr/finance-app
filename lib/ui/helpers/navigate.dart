part of 'helpers.dart';

void navigateTo( BuildContext context, Widget screen, [bool? replace] ) {

  if ( Platform.isAndroid ) {
    ( replace != null && replace ) 
      ? Navigator.of(context).pushReplacement(
        _androidNavigation(context, screen)
      )
      : Navigator.of(context).push(
        _androidNavigation(context, screen)
      );
  } else {
    ( replace != null && replace ) 
      ? Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (_) => screen
        )
      )
      : Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (_) => screen
        )
      );
  }
}

void navigateBack( BuildContext context ) => Navigator.of(context).pop();

Route _androidNavigation( BuildContext context, Widget screen ) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => screen,
    transitionDuration: const Duration( milliseconds: 300 ),
    reverseTransitionDuration: const Duration( milliseconds: 300 ),
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1.0
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0), 
            end: Offset.zero
          ).animate(animation),
          child: child,
        ),
      );
    },
  );
}