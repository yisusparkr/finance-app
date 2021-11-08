/*
  Method used to validate the user [Name]
  written in a field.
*/
String? validateFullName( String? value ) {
  return ( value != null && value.length >= 10 )
    ? null
    : 'At least 6 characters';
}
/*
  Method used to validate the user [Email]
  written in a field.
*/
String? validateEmail( String? value ) {
  final reg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return ( value != null && reg.hasMatch(value) )
    ? null
    : 'Write a valid email';
}
/*
  Method used to validate the user [RFC]
  written in a field.
*/
String? validateRfc( String? value ) {
  return ( value != null && value.length >= 13 )
    ? null
    : 'At least 13 characters';
}
/*
  Method used to validate the user [Password]
  written in a field.
*/
String? validatePassword( String? value ) {
  return ( value != null && value.length >= 8 )
    ? null
    : 'At least 8 characters';
}