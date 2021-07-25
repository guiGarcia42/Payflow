import 'dart:convert';

import 'package:flutter/material.dart';

class BoletoModel {
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;
  final bool? isPaid;
  final String? primaryKey;
  BoletoModel({
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
    this.isPaid = false,
     this.primaryKey
  });

  static String generateKey() => UniqueKey().hashCode.toString();

  BoletoModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
    bool? isPaid,
    
  }) {
    return BoletoModel(
      primaryKey: generateKey(),
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
      isPaid: isPaid ?? this.isPaid
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
      'isPaid' : isPaid,
      'primaryKey': primaryKey,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
      isPaid:  map['isPaid'],
      primaryKey: map['primaryKey'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) => BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, dueDate: $dueDate, value: $value, barcode: $barcode,isPaid: $isPaid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BoletoModel &&
      other.name == name &&
      other.dueDate == dueDate &&
      other.value == value &&
      other.isPaid == isPaid &&
      other.barcode == barcode;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      dueDate.hashCode ^
      value.hashCode ^
      isPaid.hashCode ^
      primaryKey.hashCode ^
      barcode.hashCode;
  }
}
