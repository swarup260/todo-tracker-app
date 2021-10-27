// To parse this JSON data, do
//
//     final noteList = noteListFromJson(jsonString);

import 'dart:convert';

NoteList noteListFromJson(String str) => NoteList.fromJson(json.decode(str));

NoteList noteFromJson(String str) => NoteList.singlePost(json.decode(str));

String noteListToJson(NoteList data) => json.encode(data.toJson());

class NoteList {
  NoteList({
    this.status,
    this.message,
    this.data,
    this.note,
  });

  bool status;
  String message;
  List<Note> data;
  Note note;

  factory NoteList.fromJson(Map<String, dynamic> json) => NoteList(
        status: json["status"],
        message: json["message"],
        data: List<Note>.from(json["data"].map((x) => Note.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  String toString() => json.encode({
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      });

  factory NoteList.singlePost(Map<String, dynamic> json) => NoteList(
        status: json["status"],
        message: json["message"],
        note: Note.fromJson(json["data"]),
      );
}

class Note {
  Note({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Note.initNote() {
    this.userId = 0;
    this.id = 0;
    this.title = '';
    this.body = '';
  }

  int userId;
  int id;
  String title;
  String body;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
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

  String toString() => json.encode({
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      });
}
