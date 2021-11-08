String? validateFullName( String? value ) {
  return ( value != null && value.length >= 10 )
    ? null
    : 'At least 6 characters';
}

String? validateEmail( String? value ) {
  final reg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return ( value != null && reg.hasMatch(value) )
    ? null
    : 'Write a valid email';
}

String? validateRfc( String? value ) {
  return ( value != null && value.length >= 13 )
    ? null
    : 'At least 13 characters';
}

String? validatePassword( String? value ) {
  return ( value != null && value.length >= 8 )
    ? null
    : 'At least 8 characters';
}