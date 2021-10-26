import 'package:flutter/material.dart';
import 'package:notes/flavours.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/services/api_services.dart';
import 'package:notes/services/cache_services.dart';
import 'package:notes/utils/endpoints.dart';

enum RequestType {
  saveNoteList,
  addNoteList,
  updateNoteList,
  deleteNoteList,
  readNoteList
}

class NoteServices {
  NoteServices(
      {this.flavours,
      @required ApiServices apiServices,
      @required CacheServices cacheServices})
      : _apiServices = apiServices,
        _cacheServices = cacheServices {
    this._config = appConfig[this.flavours];
    this._config = appConfig[this.flavours];
  }

  Flavours flavours;
  Map<String, String> _config;
  final ApiServices _apiServices;
  CacheServices _cacheServices;

  Future<NoteList> fetchNotes() async {
    NoteList noteListCache = await _cacheServices.fetchPosts();
    if (noteListCache.data.length > 0) {
      return noteListCache;
    }

    Uri uri = Uri.https(_config['baseUrl'], endpoints[Endpoint.posts]);
    String result = await _apiServices.ajaxGet(uri);
    _cacheResult(result, RequestType.saveNoteList);
    NoteList noteList = noteListFromJson(result);
    return noteList;
  }

  Future<NoteList> writeNote(Map data) async {
    Uri uri = Uri.https(_config['baseUrl'], endpoints[Endpoint.posts]);
    String result = await _apiServices.ajaxPatch(uri, data);
    _cacheResult(result, RequestType.updateNoteList);
    return _cacheServices.fetchPosts();
  }

  Future<NoteList> updateNote(Map data) async {
    Uri uri = Uri.https(_config['baseUrl'], endpoints[Endpoint.posts]);
    String result = await _apiServices.ajaxPost(uri, data);
    _cacheResult(result, RequestType.updateNoteList);
    return _cacheServices.fetchPosts();
  }

  Future<NoteList> deleteNote(int id) async {
    Uri uri = Uri.https(
      _config['baseUrl'],
      "${endpoints[Endpoint.posts]}/${id as String}",
    );
    String result = await _apiServices.ajaxDelete(uri);
    _cacheResult(result, RequestType.deleteNoteList);
    return _cacheServices.fetchPosts();
  }

  Future<void> _cacheResult(String result, RequestType requestType) async {
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
      case RequestType.saveNoteList:
        return await _cacheServices.saveNote(result);
        break;
      default:
        throw Exception('requestType undefined');
    }
  }
}
