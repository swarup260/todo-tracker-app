import 'package:notes/flavours.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/services/api_services.dart';
import 'package:notes/services/cache_note_services.dart';
import 'package:notes/utils/endpoints.dart';

enum RequestType {
  saveNoteList,
  addNoteList,
  updateNoteList,
  deleteNoteList,
  readNoteList
}

class NoteServices {
  NoteServices(Flavours flavours) {
    this._config = appConfig[flavours];
    _apiServices = ApiServices();
    _cacheServices = CacheNoteServices();
  }

  Flavours flavours;
  Map<String, String> _config;
  ApiServices _apiServices;
  CacheNoteServices _cacheServices;

  Future<NoteList> fetchNotes() async {
    NoteList noteListCache = await _cacheServices.fetchPosts();
    if (noteListCache.data != null && noteListCache.data.length > 0) {
      return noteListCache;
    }
    Uri uri = Uri.http(_config['baseUrl'], endpoints[Endpoint.posts]);
    String result = await _apiServices.ajaxGet(uri);
    NoteList noteList = noteListFromJson(result);
    await _cacheServices.saveNote(noteList);
    return noteList;
  }

  Future<NoteList> writeNote(Map data) async {
    Uri uri = Uri.http(_config['baseUrl'], endpoints[Endpoint.posts]);
    String result = await _apiServices.ajaxPatch(uri, data);
    NoteList noteList = noteFromJson(result);
    _cacheResult(noteList.note, RequestType.updateNoteList);
    return noteList;
  }

  Future<NoteList> updateNote(Map data) async {
    Uri uri = Uri.http(_config['baseUrl'], endpoints[Endpoint.posts]);
    String result = await _apiServices.ajaxPost(uri, data);
    NoteList noteList = noteFromJson(result);
    _cacheResult(noteList.note, RequestType.updateNoteList);
    return noteList;
  }

  Future<NoteList> deleteNote(String id) async {
    Uri uri = Uri.http(
      _config['baseUrl'],
      "${endpoints[Endpoint.posts]}/$id",
    );
    String result = await _apiServices.ajaxDelete(uri);
    NoteList noteList = noteFromJson(result);
    _cacheResult(noteList.note, RequestType.deleteNoteList);
    return noteList;
  }

  Future<void> _cacheResult(Note result, RequestType requestType) async {
    switch (requestType) {
      case RequestType.addNoteList:
        return await _cacheServices.addNote(result);
        break;
      case RequestType.updateNoteList:
        return await _cacheServices.updateNote(result);
        break;
      case RequestType.deleteNoteList:
        return await _cacheServices.deleteNote(result);
        break;
      default:
        throw Exception('requestType undefined');
    }
  }
}
