import 'package:flutter/material.dart';
import 'package:proyecto_medico/models/antibiotic_model.dart';

class BacteriumModel {
  final int id;
  final String name;

  BacteriumModel({required this.id, required this.name});

  factory BacteriumModel.fromJson(Map<String, dynamic> json) {
    return BacteriumModel(id: json['id'], name: json['name']);
  }
}
