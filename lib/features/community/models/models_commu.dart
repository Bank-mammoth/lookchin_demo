import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';


class CommuModel extends Equatable {
 final String? userName;
  final int? level;
  final String? status;
  final String? postAt;
  final int? like;
  final int? comment;
  final String? image;
  CommuModel({
    this.userName,
    this.level,
    this.status,
    this.postAt,
    this.like,
    this.comment,
    this.image,
  });

  CommuModel copyWith({
    ValueGetter<String?>? userName,
    ValueGetter<int?>? level,
    ValueGetter<String?>? status,
    ValueGetter<String?>? postAt,
    ValueGetter<int?>? like,
    ValueGetter<int?>? comment,
    ValueGetter<String?>? image,
  }) {
    return CommuModel(
      userName: userName != null ? userName() : this.userName,
      level: level != null ? level() : this.level,
      status: status != null ? status() : this.status,
      postAt: postAt != null ? postAt() : this.postAt,
      like: like != null ? like() : this.like,
      comment: comment != null ? comment() : this.comment,
      image: image != null ? image() : this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'level': level,
      'status': status,
      'postAt': postAt,
      'like': like,
      'comment': comment,
      'image': image,
    };
  }

  factory CommuModel.fromMap(Map<String, dynamic> map) {
    return CommuModel(
      userName: map['userName'],
      level: map['level']?.toInt(),
      status: map['status'],
      postAt: map['postAt'],
      like: map['like']?.toInt(),
      comment: map['comment']?.toInt(),
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CommuModel.fromJson(String source) => CommuModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommuModel(userName: $userName, level: $level, status: $status, postAt: $postAt, like: $like, comment: $comment, image: $image)';
  }

  @override
  List<Object?> get props {
    return [
      userName,
      level,
      status,
      postAt,
      like,
      comment,
      image,
    ];
  }
}
