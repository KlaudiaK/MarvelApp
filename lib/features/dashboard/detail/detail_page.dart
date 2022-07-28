import 'package:flutter/material.dart';
import 'package:marvel_app/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/local/comic.dart';
import '../../../utils/styles.dart';
//import 'dart:html' as html;

class DetailsPage extends StatelessWidget {
  final String? id;
  final ComicItem comic;
  // = Uri.parse(comic.uriDetails ?? 'https://www.marvel.com/comics?&options%5Boffset%5D=0&totalcount=12');
  const DetailsPage({Key? key, required this.id, required this.comic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringResource.detail_app_bar_title,
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: false,
        backgroundColor: Colors.blueGrey.shade300,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => {_launchUrl()
         
        },
        style: ElevatedButton.styleFrom(primary: Colors.red),
        child: const Text(StringResource.see_more),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            comic.thumbnail ?? ComicItem.defaultThumbnailUrl,
            fit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.6,
              maxChildSize: 0.8,
              builder: (context, scrollController) => DraggableScrollableSheet(
                  builder: (context, scrollController) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(230),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Center(
                            child: Container(
                              width: 100,
                              height: 20,
                              padding: const EdgeInsets.all(8),
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(children: [
                              Text(comic.title ?? StringResource.unknown_title,
                                  style: StyleResource.titleTextStyle),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                  comic.author ?? StringResource.unknown_author,
                                  style: StyleResource.authorTextStyle),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(comic.description ??
                                  StringResource.empty_string)
                            ]),
                          )
                        ],
                      ))))
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    comic.uriDetails = comic.uriDetails?.replaceAll('http', 'https');
    Uri _url = Uri.parse(comic.uriDetails ?? ComicItem.defaultDetailsUrl);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
}
