import 'package:marvel_app/data/remote/thumbnail_dto.dart';

import '../local/comic.dart';
import 'creators_dto.dart';
import 'urls_dto.dart';

class Results {
  int? id;
  String? title;
  String? description;

  String? resourceURI;
List<Urls>? urls;
  List<Null>? collections;

  Thumbnail? thumbnail;
  Creators? creators;
  Creators? characters;
  Creators? stories;

  Results({
    this.id,
    this.title,
    this.description,
    this.resourceURI,
    this.urls,
    this.collections,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    title = json['title'];

    description = json['description'];

    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls?.add(Urls.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;

    creators =
        json['creators'] != null ? Creators.fromJson(json['creators']) : null;
    characters = json['characters'] != null
        ? Creators.fromJson(json['characters'])
        : null;
    stories =
        json['stories'] != null ? Creators.fromJson(json['stories']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;

    data['resourceURI'] = resourceURI;
   if (urls != null) {
      data['urls'] = urls?.map((v) => v.toJson()).toList();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail?.toJson();
    }

    if (creators != null) {
      data['creators'] = creators?.toJson();
    }
    if (characters != null) {
      data['characters'] = characters?.toJson();
    }

    return data;
  }

  ComicItem toComicItem() {
    String? author;
    if (creators?.items != null) {
      if (creators?.items?.isNotEmpty ?? true) {
        author = creators?.items?[0].name;
      }
    }
    thumbnail?.path = thumbnail?.path?.replaceAll("http", "https");
    return ComicItem(
        id: id,
        title: title,
        author: author ?? "Unknown",
        description: description,
        thumbnail: thumbnail?.getFullPath(),
        uriDetails: urls?[0].url
        );
  }
}
