import 'package:flutter/material.dart';

class BooksModel {
  final String type; // type will bw book !!
  final String id;
  final double price;
  final bool isDealOfTheDay;
  final bool isAvailableInTheStock;
  final String typeOfBook; // Thriller
  final String language;
  final String author;
  final int noOfPages;
  final String publisher;
  final String name;

  BooksModel(
      {required this.id,
      required this.isAvailableInTheStock,
      required this.isDealOfTheDay,
      required this.price,
      required this.type,
      required this.typeOfBook,
      required this.publisher,
      required this.author,
      required this.language,
      required this.name,
      required this.noOfPages,

      });

  factory BooksModel.fromjson(Map<dynamic, dynamic> json) {
    return BooksModel(
        id: json['id'],
        isAvailableInTheStock: json['isAvailableInTheStock'],
        isDealOfTheDay: json['isDealOfTheDay'],
        price: json['price'],
        type: json['type'],
        typeOfBook: json['typeofbook'],
        publisher: json['publisher'],
        author: json['author'],
        language: json['language'],
        name: json['name'],
        noOfPages: json['noOfPages']
        );
  }
}
