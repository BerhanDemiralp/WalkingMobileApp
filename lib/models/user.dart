class User {
  final int id;
  final String username;
  final String email;
  final String role;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? lastLogin;
  final List<int> assignedOwnerIds; // New field for assigned owners

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    this.isActive = true,
    required this.createdAt,
    this.lastLogin,
    this.assignedOwnerIds = const [], // Default empty
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'role': role,
        'isActive': isActive,
        'createdAt': createdAt.toIso8601String(),
        'lastLogin': lastLogin?.toIso8601String(),
        'assignedOwnerIds': assignedOwnerIds,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        role: json['role'],
        isActive: json['isActive'],
        createdAt: DateTime.parse(json['createdAt']),
        lastLogin: json['lastLogin'] != null
            ? DateTime.parse(json['lastLogin'])
            : null,
        assignedOwnerIds: List<int>.from(json['assignedOwnerIds'] ?? []),
      );
}
