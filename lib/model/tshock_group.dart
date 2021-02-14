class TShockGroup {
  final String name;
  final String parent;
  final String chatColor;
  final List<String> permissions;
  final List<String> negatedPermissions;
  final List<String> totalPermissions;

  TShockGroup(
    this.name,
    this.parent,
    this.chatColor,
    this.permissions,
    this.negatedPermissions,
    this.totalPermissions,
  );

  factory TShockGroup.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String parent = json['parent'];
    String chatColor = json['chatcolor'];
    List<String> permissions = ((json['permissions'] ?? []) as Iterable)
        .map((e) => e as String)
        .toList();
    List<String> negatedPermissions =
        ((json['negatedpermissions'] ?? []) as Iterable)
            .map((e) => e as String)
            .toList();
    List<String> totalPermissions =
        ((json['totalpermissions'] ?? []) as Iterable)
            .map((e) => e as String)
            .toList();

    return TShockGroup(name, parent, chatColor, permissions, negatedPermissions,
        totalPermissions);
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'parent': parent,
        'chatColor': chatColor,
        'permission': permissions.map((e) => e),
        'negatedPermission': negatedPermissions.map((e) => e),
        'totalPermission': totalPermissions.map((e) => e),
      };
}
