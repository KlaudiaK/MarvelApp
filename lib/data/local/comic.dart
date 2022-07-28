class ComicItem {
  int? id;
  String? title;
  String? author;
  String? description;
  String? thumbnail;
  String? uriDetails;

  static const defaultThumbnailUrl =
      'https://static.posters.cz/image/750/plakaty/marvel-comic-here-come-the-heroes-i34927.jpg';

  static const defaultDetailsUrl = 'https://www.marvel.com/comics?&options%5Boffset%5D=0&totalcount=12';
  ComicItem(
      {this.id,
      this.title,
      this.author,
      this.description,
      this.thumbnail,
      this.uriDetails});
}
