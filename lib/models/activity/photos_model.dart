class PhotosModel {
  List<PhotosItemModel> content;

  PhotosModel({this.content = const []});

  factory PhotosModel.fromJson(List<dynamic> json) {
    return PhotosModel(
        content: json == null ? [] : (json).map((e) => PhotosItemModel.fromJson(e)).toList());
  }
}

class PhotosItemModel {
  final num albumId;
  final num id;
  final String url;
  final String thumbnailUrl;


  PhotosItemModel({
    this.albumId = 0,
    this.id = 0,
    this.url = '',
    this.thumbnailUrl = '',
  });

  factory PhotosItemModel.fromJson(Map<String, dynamic> json) {
    return PhotosItemModel(
      albumId: json['albumId'] ?? -1,
      id: json['id'] ?? -1,
      url: json['url'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
    );
  }
}
