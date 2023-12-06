class User {
  final int userID;
  String name;
  String birthDate;
  String passcode; // not a very secure way to store a password, idk if this is ok
  int newUser;
  num monthlyIncome;

  User({
    required this.userID,
    required this.name,
    required this.passcode,
    required this.birthDate,
    required this.newUser,
    required this.monthlyIncome,
  });

  Map<String, dynamic> toMap() {
    return {
      "userID" : userID,
      "name" : name,
      "passcode" : passcode,
      "birthDate" : birthDate,
      "isNewUser" : newUser,
      "monthlyincome" : monthlyIncome,
    };
  }

  @override
  String toString(){
    return 'User{ID: $userID, name : $name, passcode: $passcode, birth date: $birthDate'
        ' isNewUser: $newUser, Monthly income: $monthlyIncome}';
  }
}

