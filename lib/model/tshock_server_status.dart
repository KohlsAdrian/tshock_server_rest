class TShockServerStatus {
  final String name;
  final String serverVersion;
  final TShockServerVersion tShockServerVersion;
  final int port;
  final int playerCount;
  final int maxPlayers;
  final String worldName;
  final String uptime;
  final bool serverpassword;

  TShockServerStatus(
    this.name,
    this.serverVersion,
    this.tShockServerVersion,
    this.port,
    this.playerCount,
    this.maxPlayers,
    this.worldName,
    this.uptime,
    this.serverpassword,
  );

  factory TShockServerStatus.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String serverVersion = json['serverversion'];
    TShockServerVersion tShockServerVersion =
        TShockServerVersion.fromJson(json['tshockversion'] ?? {});
    int port = json['port'];
    int playerCount = json['playercount'];
    int maxPlayers = json['maxplayers'];
    String worldName = json['world'];
    String uptime = json['uptime'];
    bool serverpassword = json['serverpassword'];

    return TShockServerStatus(
      name,
      serverVersion,
      tShockServerVersion,
      port,
      playerCount,
      maxPlayers,
      worldName,
      uptime,
      serverpassword,
    );
  }
}

class TShockServerVersion {
  final int major;
  final int minor;
  final int build;
  final int revision;
  final int majorRevision;
  final int minorRevision;

  TShockServerVersion(
    this.major,
    this.minor,
    this.build,
    this.revision,
    this.majorRevision,
    this.minorRevision,
  );

  factory TShockServerVersion.fromJson(Map<String, dynamic> json) {
    int major = json['Major'];
    int minor = json['Minor'];
    int build = json['Build'];
    int revision = json['Revision'];
    int majorRevision = json['MajorRevision'];
    int minorRevision = json['MinorRevision'];

    return TShockServerVersion(
        major, minor, build, revision, majorRevision, minorRevision);
  }
}
