import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ChatListModel extends Equatable {
final String image;
final  String productImag;
final  String title;
final  String location;
final  String time;
final  String message;
final  int?   status;
final  int?   buyer;   
// status [0 = Active, 1 = Reserved, 2 = Sold],
// buyer [0 = false, 1 = true]  
  const ChatListModel({
    required this.image,
    required this.productImag,
    required this.title,
    required this.location,
    required this.time,
    required this.message,
    this.status,
    this.buyer,
  });

  ChatListModel copyWith({
    String? image,
    String? productImag,
    String? title,
    String? location,
    String? time,
    String? message,
    ValueGetter<int?>? status,
    ValueGetter<int?>? buyer,
  }) {
    return ChatListModel(
      image: image ?? this.image,
      productImag: productImag ?? this.productImag,
      title: title ?? this.title,
      location: location ?? this.location,
      time: time ?? this.time,
      message: message ?? this.message,
      status: status != null ? status() : this.status,
      buyer: buyer != null ? buyer() : this.buyer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'productImag': productImag,
      'title': title,
      'location': location,
      'time': time,
      'message': message,
      'status': status,
      'buyer': buyer,
    };
  }

  factory ChatListModel.fromMap(Map<String, dynamic> map) {
    return ChatListModel(
      image: map['image'] ?? '',
      productImag: map['productImag'] ?? '',
      title: map['title'] ?? '',
      location: map['location'] ?? '',
      time: map['time'] ?? '',
      message: map['message'] ?? '',
      status: map['status']?.toInt(),
      buyer: map['buyer']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatListModel.fromJson(String source) => ChatListModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatListModel(image: $image, productImag: $productImag, title: $title, location: $location, time: $time, message: $message, status: $status, buyer: $buyer)';
  }

  @override
  List<Object?> get props {
    return [
      image,
      productImag,
      title,
      location,
      time,
      message,
      status,
      buyer,
    ];
  }
}

enum StatusProduct{
  active,
  reserved,
  sold,
}

enum StatusUser{
  all,
  buyer,
  seller,
}
