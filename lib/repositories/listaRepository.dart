import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';
import 'package:vamosla/models/posts.dart';

class ListaRepository {

  static ListaRepository _instansce;
  static ListaRepository get instance {
    if(_instansce == null){
      _instansce = ListaRepository._();
    }
    return _instansce;
  }

  ListaRepository._();

  BehaviorSubject<List<Post>> posts =
      BehaviorSubject<List<Post>>.seeded(List());

  void getList() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    List<Post> lista = List();
    jsonDecode(response.body).forEach((value) {
      lista.add(Post.fromJson(value));
    });
    posts.sink.add(lista);
  }
}
