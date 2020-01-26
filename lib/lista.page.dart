import 'package:flutter/material.dart';
import 'package:vamosla/repositories/listaRepository.dart';

import 'models/posts.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Post>>(
        stream: ListaRepository.instance.posts.stream,
        builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) => Text(snapshot.data[index].title),
        ),
      ),
    );
  }
}
