
String? isValidEmail(String? value) {
  //String _msg;
  RegExp regExp = new RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (value == null || value.isEmpty){
    return 'Email required';
  } else if(!regExp.hasMatch(value)) {
    return 'Invalid Email';
  }
  return null;
}


String? isValidpassword(String? password) {
  RegExp alphabetRegex = RegExp(r'[a-zA-Z]');
  RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  // if (!alphabetRegex.hasMatch(password!) && !specialCharRegex.hasMatch(password)) {
  //   return 'Enter Valid Password';
  // }
  // if(password.length <6){
  //   return 'Enter Atlest 6 digit password';
  // }

  return null;
}


