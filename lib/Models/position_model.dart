class PositionModel {
  final String name;
  final Sys sys;

  PositionModel(this.name, this.sys);

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(json['name'], Sys.fromJson(json['sys']));
  }

  @override
  String toString() {
    return 'PositionModel{name: $name, sys: $sys}';
  }
}

class Sys {
  final String country;

  Sys(this.country);

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(json['country']);
  }

  @override
  String toString() {
    return 'Sys{country: $country}';
  }
}
