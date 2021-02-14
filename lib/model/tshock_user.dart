class TShockUser {
  final String name;
  final String id;
  final String group;

  TShockUser(this.name, this.id, this.group);

  factory TShockUser.fromJson(Map<String, dynamic> map) {
    String name = map['name'];
    String id = map['id'].toString();
    String group = map['group'];
    return TShockUser(name, id, group);
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'id': id,
        'group': group,
      };
}

class TShockBannedUser {
  final String name;
  final String ip;
  final String banningUser;
  final String date;
  final String reason;

  TShockBannedUser(
      this.name, this.ip, this.banningUser, this.date, this.reason);

  factory TShockBannedUser.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String ip = json['ip'];
    String banningUser = json['banning_user'];
    String date = json['date'];
    String reason = json['reason'];

    return TShockBannedUser(name, ip, banningUser, date, reason);
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'ip': ip,
        'banningUser': banningUser,
        'date': date,
        'reason': reason,
      };
}
