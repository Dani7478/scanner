class User {
  int? id;
  String? userName;
  String? passwrord;

  User({this.id, this.userName, this.passwrord});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    passwrord = json['passwrord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['passwrord'] = this.passwrord;
    return data;
  }
}