class UserModel {
  final String id;
  final String fullName;
  final String email;
  final bool isAdmin;

  UserModel(this.id, this.fullName, this.email, this.isAdmin);

  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        isAdmin = data['isAdmin'];

  Map<String, dynamic> toJson() {
    return {'id': id, 'fullName': fullName, 'email': email, 'isAdmin': isAdmin};
  }
}
