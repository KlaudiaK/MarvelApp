import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/data/local/comic.dart';
import 'comic_card.dart';
import 'package:marvel_app/utils/navigation_paths.dart';


class ComicList extends StatelessWidget {
  ComicList({Key? key, required this.comics}) : super(key: key);
  List<ComicItem?> comics;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: comics.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.all(6.0),
            height: 150,
            child: Material(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: InkWell(
                    onTap: _onItemClicked,
                    child: ComicCard(
                      comic: comics[index],
                    ))));
      },
    );
  }

  void _onItemClicked() {
    () => Modular.to.navigate(
        '${NavigationPaths.dashboardModulePath}${NavigationPaths.searchPagePath}');

    log("Clicked");
  }
}
