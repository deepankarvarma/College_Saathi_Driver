class TFirebaseException implements Exception {
  final String code;
  TFirebaseException(this.code);

  String get message{
    switch(code){
      case 'email-already-in-use':
      return 'The email address is already registered. Please use a different email.';
      default:
      return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
