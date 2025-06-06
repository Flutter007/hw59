class Car {
  final String? id;
  final String model;
  final String color;
  final String stateNumber;
  final String driverName;
  final String status;

  Car({
    this.id,
    required this.model,
    required this.color,
    required this.stateNumber,
    required this.driverName,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'color': color,
      'stateNumber': stateNumber,
      'driverName': driverName,
      'status': status,
    };
  }

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      model: json['model'],
      color: json['color'],
      stateNumber: json['stateNumber'],
      driverName: json['driverName'],
      status: json['status'],
    );
  }
}
