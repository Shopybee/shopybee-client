import 'dart:core';

import 'package:flutter/material.dart';

class LaptopModel {
  final String? type; // in this case type will be the laptop
  final String brandName;
  final double price;
  final bool isDealOfTheDay;
  final String modelName; //like 14-s-dy2506TU
  final String colour;
  final String os;
  final String cpuSpeed;
  final String graphicsCardDescription;
  final String screenSize;
  final bool isAvailableInStock;
  final double weight;
  final bool cpuModel;
  final String id;

  LaptopModel({
    required this.type,
    required this.brandName,
    required this.colour,
    required this.isDealOfTheDay,
    required this.modelName,
    required this.os,
    required this.cpuSpeed,
    required this.graphicsCardDescription,
    required this.screenSize,
    required this.weight,
    required this.isAvailableInStock,
    required this.cpuModel,
    required this.id,
    required this.price,
  });

  factory LaptopModel.fromjson(Map<dynamic, dynamic> json) {
    return LaptopModel(
        type: json['type'],
        brandName: json['brandName'],
        colour: json['colour'],
        isDealOfTheDay: json['isDealOfTheDay'],
        modelName: json['modelName'],
        os: json['os'],
        cpuSpeed: json['cpuSpeed'],
        graphicsCardDescription: json['graphicsCardDescription'],
        screenSize: json['screenSize'],
        weight: json['weight'],
        isAvailableInStock: json['isAvailableInStock'],
        cpuModel: json['cpuModel'],
        id: json['id'],
        price: json['price']);
  }
}
