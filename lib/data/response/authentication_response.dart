class AuthenticationResponse {
  final String? accessToken;
  final String? email;
  final String? status;
  final String? id;
  final String? userName;
  final String? password;
  final String? phoneNumber;
  final String? address;
  final String? avatar;
  final DateTime? createdDate;
  final DateTime? updatedDate;
  final String? role;

  AuthenticationResponse({
    this.accessToken,
    this.email,
    this.status,
    this.id,
    this.userName,
    this.password,
    this.phoneNumber,
    this.address,
    this.avatar,
    this.createdDate,
    this.updatedDate,
    this.role,
  });

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticationResponse(
      accessToken: json['access-token'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String?,
      id: json['_id'] as String?,
      userName: json['user-name'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phone-number'] as String?,
      address: json['address'] as String?,
      avatar: json['avatar'] as String?,
      createdDate: json['created-date'] != null
          ? DateTime.parse(json['created-date'] as String)
          : null,
      updatedDate: json['updated-date'] != null
          ? DateTime.parse(json['updated-date'] as String)
          : null,
      role: json['role'] as String?,
    );
  }
}
