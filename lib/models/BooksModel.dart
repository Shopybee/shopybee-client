import 'package:flutter/material.dart';

class BookModel
{
  final String type; // type will bw book !!
  final String id;
  final int price;
  final bool isDealOfTheDay;
  final int quantity;
  final String typeOfBook; // Thriller
  final String language;
  final String author;
  final int noOfPages;
  final String publisher;
  final String name;

  BookModel(
      {required this.id,
      required this.quantity,
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

  factory BookModel.fromjson(Map<String, dynamic> json) {
    return BookModel(
        id: json['id'],
        quantity: json['quantity'],
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
