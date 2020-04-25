class UserInfoEntity {
  int id;
  String account;
  String password;
  String nickname;
  int gender;
  String avatar;
  String introduction;
  String email;
  String phone;
  String address;
  DateTime birthday;
  int petNumber;
  int instantNumber;
  int followNumber;
  int fansNumber;
  DateTime createTime;
  DateTime updateTime;

  UserInfoEntity({
    this.id,
    this.account,
    this.password,
    this.nickname,
    this.gender,
    this.avatar,
    this.introduction,
    this.email,
    this.phone,
    this.address,
    this.birthday,
    this.petNumber,
    this.instantNumber,
    this.followNumber,
    this.fansNumber,
    this.createTime,
    this.updateTime,
  });

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => UserInfoEntity(
        id: json["id"],
        account: json["account"],
        password: json["password"],
        nickname: json["nickname"],
        gender: json["gender"],
        avatar: json["avatar"],
        introduction: json["introduction"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        birthday: json["birthday"],
        petNumber: json["petNumber"],
        instantNumber: json["instantNumber"],
        followNumber: json["followNumber"],
        fansNumber: json["fansNumber"],
        createTime: json["createTime"],
        updateTime: json["updateTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account": account,
        "password": password,
        "nickname": nickname,
        "gender": gender,
        "avatar": avatar,
        "introduction": introduction,
        "email": email,
        "phone": phone,
        "address": address,
        "birthday": birthday,
        "petNumber": petNumber,
        "instantNumber": instantNumber,
        "followNumber": followNumber,
        "fansNumber": fansNumber,
        "createTime": createTime,
        "updateTime": updateTime,
      };
}
