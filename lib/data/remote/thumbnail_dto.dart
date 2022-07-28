class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['path'] = path;
    data['extension'] = extension;
    return data;
  }

  String? getFullPath() {
    if (extension != null && path != null) {
      return '$path.$extension';
    }
  }
}
