class TShockWorld {
  final String name;
  final String size;
  final double time;
  final bool dayTime;
  final bool bloodMoon;
  final int invasionSize;

  TShockWorld(
    this.name,
    this.size,
    this.time,
    this.dayTime,
    this.bloodMoon,
    this.invasionSize,
  );

  factory TShockWorld.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    String size = json['size'];
    double time = json['time'];
    bool dayTime = json['daytime'];
    bool bloodMoon = json['bloodmoon'];
    int invasionSize = json['invasionsize'];

    return TShockWorld(
      name,
      size,
      time,
      dayTime,
      bloodMoon,
      invasionSize,
    );
  }
}
