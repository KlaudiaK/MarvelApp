import 'package:flutter/cupertino.dart';
import 'package:marvel_app/data/local/comic.dart';

class ComicCard extends StatelessWidget {
  final ComicItem comic;
  const ComicCard({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          comic.thumbnail ??
              'https://static.posters.cz/image/750/plakaty/marvel-comic-here-come-the-heroes-i34927.jpg',
          width: 100,
        ),
        Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    comic.title ?? "",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    overflow: TextOverflow.visible,
                  ),
                ),
                Container(
                    width: 200,
                    height: 50,
                    padding: EdgeInsets.only(top: 2.0),
                    child: Text('Written by ${comic.author}')),
              ],
            )),
      ],
    );
  }
}
