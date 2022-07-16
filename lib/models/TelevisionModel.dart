import 'package:flutter/material.dart';

class TelivisionModel {
  final String type;
  final String brand;
  final double screenSize;
  final bool isDealOfTheDay;
  final bool isAvailableInTheStock;
  final String id;
  final String modelName;
  final String colour;
  final String screenType;
  final String hdTechnologyAndResolution; //Hd Ready
  final bool isSmartTv;
  final bool builtInWiFi;
  final int hdmi;
  final int usb;
  final String wifiType;
  final String series;
  final double price;

  TelivisionModel(
      {required this.brand,
      required this.builtInWiFi,
      required this.colour,
      required this.hdTechnologyAndResolution,
      required this.hdmi,
      required this.id,
      required this.isAvailableInTheStock,
      required this.isDealOfTheDay,
      required this.isSmartTv,
      required this.modelName,
      required this.screenSize,
      required this.screenType,
      required this.series,
      required this.type,
      required this.usb,
      required this.wifiType,
      required this.price
      });

  factory TelivisionModel.fromjson(Map<dynamic, dynamic> json) {
    return TelivisionModel(
        brand: json['brand'],
        builtInWiFi: json['builtInWiFi'],
        colour: json['colour'],
        hdTechnologyAndResolution: json['hdTechnologyAndResolution'],
        hdmi: json['hdmi'],
        id: json['id'],
        isAvailableInTheStock: json['isAvailableInTheStock'],
        isDealOfTheDay: json['isDealOfTheDay'],
        isSmartTv: json['isSmartTv'],
        modelName: json['modelName'],
        screenSize: json['screenSize'],
        screenType: json['screenType'],
        series: json['series'],
        type: json['type'],
        usb: json['usb'],
        wifiType: json['wifiType'],
        price: json['price']
        );
  }
}
