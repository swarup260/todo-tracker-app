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

  Note(
      {this.createdAt,
      this.modifiedAt,
      this.id,
      this.title,
      this.body,
      this.label});

  DateTime createdAt;
  DateTime modifiedAt;
  String id;
  String title;
  String body;
  String label;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        createdAt: DateTime.parse(json["createdAt"]),
        modifiedAt: DateTime.parse(json["modifiedAt"]),
        id: json["_id"],
        title: json["title"],
        body: json["body"],
        label: json["label"],
      );

  factory Note.initNote() => Note(
    createdAt : DateTime.now(),
    modifiedAt : DateTime.now(),
    id : ' ',
    title : ' ',
    body : ' ',
    label : ' ',
  );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "modifiedAt": modifiedAt.toIso8601String(),
        "_id": id,
        "title": title,
        "body": body,
        "label": label,
      };
}
