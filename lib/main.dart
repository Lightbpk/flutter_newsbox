//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class NewsBoxFavorite extends StatefulWidget {
  final int _num;
  final bool _like;

  NewsBoxFavorite(this._num, this._like);

  @override
  createState() => new NewsBoxFavoriteState(_num, _like);
}

class NewsBoxFavoriteState extends State<NewsBoxFavorite> {
  int num;
  bool like;

  NewsBoxFavoriteState(this.num, this.like);

  void pressButton() {
    setState(() {
      like = !like;

      if (like)
        num++;
      else
        num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(children: [
      new Text('В избранном $num', textAlign: TextAlign.center,),
      new IconButton(icon: new Icon(
        like ? Icons.star : Icons.star_border, size: 30.0,
        color: Colors.blue[500],),
          onPressed: pressButton
      )
    ],);
  }

}

class NewsBox extends StatelessWidget {
  final String _title;
  final String _text;
  String _imageurl;
  int _num;
  bool _like;

  NewsBox(this._title, this._text, {String imageurl, int num = 0,bool like = false }) {
    _imageurl = imageurl;
    _num = num;
    _like = like;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageurl != null && _imageurl != '')
      return new Container(
          color: Colors.black12,
          height: 100.0,
          child: new Row(children: [
            new Image.network(
              _imageurl, width: 100.0, height: 100.0, fit: BoxFit.cover,),
            new Expanded(
                child: new Container(
                    padding: new EdgeInsets.all(5.0), child: new
                Column(children: [
                  new Text(_title, style: new TextStyle(fontSize: 20.0),
                    overflow: TextOverflow.ellipsis,),
                  new Expanded(child: new Text(
                    _text, softWrap: true, textAlign: TextAlign.justify,))
                ],
                ))),
            new NewsBoxFavorite(_num, _like)
          ])
      );
    return new Container(
      color: Colors.black12,
      height: 100.0,
      child: new Row(children: [
        new Expanded(child: new Container(padding: new EdgeInsets.all(5.0),
          child: new
          Column(children: [
            new Text(_text, style: new TextStyle(fontSize: 20.0),
                overflow: TextOverflow.ellipsis),
            new Expanded(child: new Text (
              _text, softWrap: true, textAlign: TextAlign.justify,))
          ],),)),
        new NewsBoxFavorite(_num, _like)
      ],),
    );
  }
}


void main() =>
    runApp(
        new MaterialApp(
            debugShowCheckedModeBanner: false,
            home: new Scaffold(
                appBar: new AppBar(),
                body: new NewsBox('Новый урок по Flutter',
                    '''В новом уроке рассказывается в каких случаях применять класс StatelessWidget и StatefulWidget. Приведены примеры их использования.''',
                    imageurl: 'https://flutter.su/favicon.png',num: 10)
            )
        )
    );

