// To parse this JSON data, do
//
//     final noteList = noteListFromJson(jsonString);

import 'dart:convert';

NoteList noteListFromJson(String str) => NoteList.fromJson(json.decode(str));

String noteListToJson(NoteList data) => json.encode(data.toJson());

class NoteList {
  NoteList({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory NoteList.fromJson(Map<String, dynamic> json) => NoteList(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Datum.initNote() {
    this.userId = 0;
    this.id = 0;
    this.title = '';
    this.body = '';
  }

  int userId;
  int id;
  String title;
  String body;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
