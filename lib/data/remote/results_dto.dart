
import 'package:marvel_app/data/remote/thumbnail_dto.dart';

import '../local/comic.dart';
import 'creators_dto.dart';

class Results {
  int? id;
  String? title;
  String? description;

  String? resourceURI;

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

    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;

    creators = json['creators'] != null
        ? new Creators.fromJson(json['creators'])
        : null;
    characters = json['characters'] != null
        ? new Creators.fromJson(json['characters'])
        : null;
    stories =
        json['stories'] != null ? new Creators.fromJson(json['stories']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;

    data['resourceURI'] = this.resourceURI;

    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }

    if (this.creators != null) {
      data['creators'] = this.creators!.toJson();
    }
    if (this.characters != null) {
      data['characters'] = this.characters!.toJson();
    }

    return data;
  }

  ComicItem toComicItem() {
    return ComicItem(
        id: id,
        title: title,
        author: creators?.items?.first.name,
        description: description,
        thumbnail: thumbnail?.getFullPath(),
        uriDetails: resourceURI);
  }
}
