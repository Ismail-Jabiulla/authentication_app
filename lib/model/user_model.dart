
class UserLogin {
  final String email;
  final String password;
  final String oneSignalID;
  UserLogin({required this.email, required this.password, required this.oneSignalID});
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'oneSignalId': oneSignalID,
    };
  }
}

class UserSignup {
  final String email;
  final String password;
  final String oneSignalID;
  UserSignup({required this.email, required this.password, required this.oneSignalID});
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'oneSignalId': oneSignalID,
    };
  }
}