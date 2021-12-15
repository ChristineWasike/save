class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final double accountBalance;
  final int pin;

  UserData({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.accountBalance,
    this.pin,
  });
}
