class UserData {
  String fullName;
  String territory;
  bool agreedToTerms;
  String phone;
  String email;
  String? selectedSpecialty;
  Map<String, bool> documents;

  UserData({
    this.fullName = '',
    this.territory = '',
    this.agreedToTerms = false,
    this.phone = '',
    this.email = '',
    this.selectedSpecialty,
    Map<String, bool>? documents,
  }) : documents = documents ?? {};
}
