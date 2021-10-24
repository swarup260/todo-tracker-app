import 'package:notes/flavours.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/services/api_services.dart';
import 'package:notes/utils/endpoints.dart';

class NoteServices {
  Flavours flavours;
  Map<String, String> config;
  ApiServices apiServices;

  NoteServices({this.flavours, this.apiServices}) {
    this.config = appConfig[this.flavours];
  }

  Future<NoteList> fetchNotes() async {
    Uri uri = Uri.https(this.config['baseUrl'], endpoints[Endpoint.posts]);
    String result = await this.apiServices.ajaxGet(uri);
    NoteList noteList = noteListFromJson(result);
    return noteList;
  }

  Future<NoteList> writeNotes(Map data) async {
    Uri uri = Uri.https(this.config['baseUrl'], endpoints[Endpoint.posts]);
    String result = await this.apiServices.ajaxPost(uri, data);
    NoteList noteList = noteListFromJson(result);
    return noteList;
  }
}
