class User {
  User({
      this.id,
      this.userName,
      this.isVisitor,
      this.firstName,
      this.lastName,
      this.email,
      this.status,
      this.activationStatus,
      this.terminated,
      this.department,
      this.workFrom,
      this.displayName,
      this.mobilePhone,
      this.avatarMedium,
      this.avatar,
      this.isAdmin,
      this.isLdap,
      this.listAdminModules,
      this.isOwner,
      this.cultureName,
      this.isSso,
      this.avatarSmall,
      this.profileUrl,
  });

    final String id;
    final String userName;
    final bool isVisitor;
    final String firstName;
    final String lastName;
    final String email;
    final int status;
    final int activationStatus;
    final dynamic terminated;
    final String department;
    final DateTime workFrom;
    final String displayName;
    final String mobilePhone;
    final String avatarMedium;
    final String avatar;
    final bool isAdmin;
    final bool isLdap;
    final List<String> listAdminModules;
    final bool isOwner;
    final String cultureName;
    final bool isSso;
    final String avatarSmall;
    final String profileUrl;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        userName: json['userName'],
        isVisitor: json['isVisitor'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        status: json['status'],
        activationStatus: json['activationStatus'],
        terminated: json['terminated'],
        department: json['department'],
        workFrom: DateTime.parse(json['workFrom']),
        displayName: json['displayName'],
        mobilePhone: json['mobilePhone'],
        avatarMedium: json['avatarMedium'],
        // avatar: json['avatar'].replaceAll('\/', '/'),
        avatar: json['avatar'],
        isAdmin: json['isAdmin'],
        isLdap: json['isLDAP'],
        listAdminModules: List<String>.from(json['listAdminModules'].map((x) => x)),
        isOwner: json['isOwner'],
        cultureName: json['cultureName'],
        isSso: json['isSSO'],
        avatarSmall: json['avatarSmall'],
        profileUrl: json['profileUrl'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'isVisitor': isVisitor,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'status': status,
        'activationStatus': activationStatus,
        'terminated': terminated,
        'department': department,
        'workFrom': workFrom.toIso8601String(),
        'displayName': displayName,
        'mobilePhone': mobilePhone,
        'avatarMedium': avatarMedium,
        'avatar': avatar,
        'isAdmin': isAdmin,
        'isLDAP': isLdap,
        'listAdminModules': List<dynamic>.from(listAdminModules.map((x) => x)),
        'isOwner': isOwner,
        'cultureName': cultureName,
        'isSSO': isSso,
        'avatarSmall': avatarSmall,
        'profileUrl': profileUrl,
    };
}
