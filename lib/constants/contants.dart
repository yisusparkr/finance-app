/*
  [Constants] is a [Singleton] class that
  contains the entire strings used
  in the app.
*/
class Constants {

  static final _constants = Constants._internal();
  factory Constants() {
    return _constants;
  }

  Constants._internal();

  // Sign In Screen constants
  static const String welcomeTo  = 'Welcome to \n';
  static const String financeApp = 'Finance App';
  static const String signIn     = 'Sign In';
  static const String withoutAccount = 'Don\'t have an account? ';

  // Sign Up Screen constants
  static const String createAccount = 'Create an account';
  static const String sayHello = 'Say hello to a new world';

  // Sign In Screen & Sign Up Screen fields constants
  static const String fullName = 'Full Name';
  static const String email    = 'Email';
  static const String rfc      = 'rfc';
  static const String password = 'Password';
  static const String signUp   = 'Sign Up';

  // Home Screen constants
  static const String welcome = 'Welcome,';
  static const String welcomeBack = 'Welcome back,';
  static const String letsDo      = 'Let\'s do something amazing';
  static const String check       = 'Check History';
  static const String signOut     = 'Sign Out';

  // Finance Types Screen constants
  static const String nasdaq = 'Nasdaq';
  static const String nikkei = 'Nikkei';
  static const String dax = 'Dax';

  // Finance Data Screen constants
  static const String winning = 'Winning';
  static const String losing = 'Losing';

  // Assets
  static const String config = 'assets/config.json';
  static const String signInLottie = 'assets/lotties/sign_in_lottie.json';

}