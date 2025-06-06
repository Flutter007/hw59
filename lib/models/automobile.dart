import 'package:flutter/material.dart';

class Automobile {
  final String model;
  final Color color;
  final String stateNumber;
  final String driverName;
  final String status;

  Automobile({
    required this.model,
    required this.color,
    required this.stateNumber,
    required this.driverName,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'color': color.toString(),
      'stateNumber': stateNumber,
      'driverName': driverName,
      'status': status,
    };
  }

  factory Automobile.fromJson(Map<String, dynamic> json) {
    return Automobile(
      model: json['model'],
      color: json['color'],
      stateNumber: json['stateNumber'],
      driverName: json['driverName'],
      status: json['status'],
    );
  }
}
